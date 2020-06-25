<%@ page import="java.util.List" %>
<%@ page import="model.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<%
    Task task = (Task) request.getAttribute("task");
    List<User> users = (List<User>) request.getAttribute("usersByStatus");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>

<div class="login">
    <h1>Update task info.</h1>
    <form action="/updateTask" method="post">
        <input class="inp" type="number" name="id" placeholder="Id" required="required" readonly
               value="<%= task.getId() %>"/>
        <input class="inp" type="text" name="name" placeholder="Name" required="required"
               value="<%= task.getName() %>"/>
        <textarea class="inp" style="height: 40px" name="description" placeholder="Description"
                  required="required"><%= task.getDescription() %></textarea>
        <select class="inp" name="assignedUser" required="required">
            <option value="<%= task.getAssignedUser().getEmail() %>" selected><%= task.getAssignedUser().getEmail() %>
            </option>
            <%
                for (User perUser : users) {
                    if (perUser.equals(task.getAuthor())) {
                        continue;
                    } else { %>
                        <option value="<%= perUser.getEmail() %>"><%= perUser.getEmail() %>
                        </option>
            <%      }
                }
            %>
        </select>
        <% if (task.getTaskStatus() == TaskStatus.TODO) { %>
        <input class="choice" type="radio" name="taskStatus" value="TODO" checked> <span class="txt">To do</span>
        <input class="choice" type="radio" name="taskStatus" value="IN_PROGRESS"> <span class="txt">In Progress</span>
        <input class="choice" type="radio" name="taskStatus" value="FINISHED"> <span class="txt">Finished</span><br>
        <% } else if (task.getTaskStatus() == TaskStatus.IN_PROGRESS) { %>
        <input class="choice" type="radio" name="taskStatus" value="TODO"> <span class="txt">To do</span>
        <input class="choice" type="radio" name="taskStatus" value="IN_PROGRESS" checked> <span class="txt">In Progress</span>
        <input class="choice" type="radio" name="taskStatus" value="FINISHED"> <span class="txt">Finished</span><br>
        <% } else if (task.getTaskStatus() == TaskStatus.FINISHED) {%>
        <input class="choice" type="radio" name="taskStatus" value="TODO"> <span class="txt">To do</span>
        <input class="choice" type="radio" name="taskStatus" value="IN_PROGRESS"> <span class="txt">In Progress</span>
        <input class="choice" type="radio" name="taskStatus" value="FINISHED" checked> <span class="txt">Finished</span><br>
        <%
           }
            String parse = sdf.format(task.getDeadline());
            String[] deadlineStr = parse.split(" ");
            String deadline = deadlineStr[0] + "T" + deadlineStr[1];
        %>
        <input class="inp" type="datetime-local" name="deadline" placeholder="Deadline" required="required"
               value="<%= deadline %>"/>
        <button type="submit" class="btn btn-primary btn-block btn-large">Update.</button>
    </form>

    <div class="home" style="width: 100%">
        <a href="/managerHome" style="text-decoration: none">
            <button style="width: 60%; margin: auto;" type="submit" class="btn btn-primary btn-block btn-large">
                Home page.
            </button>
        </a>
    </div>
</div>
</body>
</html>
