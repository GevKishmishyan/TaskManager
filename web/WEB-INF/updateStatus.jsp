<%@ page import="java.util.List" %>
<%@ page import="model.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
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
    <h1 style="font-size: 28px">Update task status.</h1>
    <form action="/updateTaskStatus" method="post">
        <input class="inp" type="number" name="id" placeholder="Id" required="required" readonly
               value="<%= task.getId() %>"/>
        <input class="inp" type="text" name="name" placeholder="Name" required="required" readonly
               value="<%= task.getName() %>"/>
        <textarea class="inp" style="height: 40px" name="description" placeholder="Description" readonly
                  required="required"><%= task.getDescription() %></textarea>
        <% if (task.getTaskStatus() == TaskStatus.TODO) { %>
        <input class="choice" type="radio" name="taskStatus" value="TODO" checked required="required"> <span class="txt">To do</span>
        <input class="choice" type="radio" name="taskStatus" value="IN_PROGRESS" required="required"> <span class="txt">In Progress</span>
        <input class="choice" type="radio" name="taskStatus" value="FINISHED" required="required"> <span class="txt">Finished</span><br>
        <% } else if (task.getTaskStatus() == TaskStatus.IN_PROGRESS) { %>
        <input class="choice" type="radio" name="taskStatus" value="TODO" required="required"> <span class="txt">To do</span>
        <input class="choice" type="radio" name="taskStatus" value="IN_PROGRESS" required="required" checked> <span class="txt">In Progress</span>
        <input class="choice" type="radio" name="taskStatus" value="FINISHED" required="required"> <span class="txt">Finished</span><br>
        <% } else if (task.getTaskStatus() == TaskStatus.FINISHED) {%>
        <input class="choice" type="radio" name="taskStatus" value="TODO" required="required"> <span class="txt">To do</span>
        <input class="choice" type="radio" name="taskStatus" value="IN_PROGRESS" required="required"> <span class="txt">In Progress</span>
        <input class="choice" type="radio" name="taskStatus" value="FINISHED" required="required" checked> <span class="txt">Finished</span><br>
        <% }
            String parse = sdf.format(task.getDeadline());
            String[] deadlineStr = parse.split(" ");
            String deadline = deadlineStr[0] + "T" + deadlineStr[1];
        %>
        <input class="inp" type="datetime-local" name="deadline" placeholder="Deadline" required="required" readonly
               value="<%= deadline %>"/>
        <button type="submit" class="btn btn-primary btn-block btn-large">Update.</button>
    </form>
</div>
</body>
</html>
