<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
    List<Task> tasks = (List<Task>) request.getAttribute("tasks");
    List<Notification> nots = (List<Notification>) request.getAttribute("allNots");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>


<div class="main">
    <h1><%= user.getName() %> <%= user.getSurname() %>
    </h1>

    <div class="top">
        <div class="search">
            <form action="/userSearch" method="post" style="margin-left: 28%">
                <input class="inp" style="width: 39%;  float:left;" type="search" name="search" placeholder="Search"
                       required="required"/>
                <button style="width: 20%; margin-left: 2%; float: left;" type="submit"
                        class="btn btn-primary btn-block btn-large">
                    Search.
                </button>
            </form>
        </div>
        <div class="home">
            <a href="/userHome" style="text-decoration: none">
                <button style="width: 40%; margin: auto;" type="submit" class="btn btn-primary btn-block btn-large">
                    Home page.
                </button>
            </a>
        </div>
        <div class="logout">
            <a href="/logout" style="text-decoration: none">
                <button style="width: 40%; margin: auto;" type="submit" class="btn btn-primary btn-block btn-large">
                    Log out.
                </button>
            </a>
        </div>
    </div>
    <div class="allUsers">
        <h1>Notifications.</h1>
        <% for (Notification not : nots) { %>
        <% if (not.getAuthor().getUserStatus() != UserStatus.USER){ %>
        <p style="color: gainsboro; text-align: center; font-size: 13px">
            <b><%= not.getAuthor().getName() %> <%= not.getAuthor().getSurname() %>
            </b>
            <% if (not.getNotType() == NotType.NEW_TASK) { %>
            added you the new task:
            <% } else if (not.getNotType() == NotType.COMMENT) { %>
            added new comment on task:
            <% } else if (not.getNotType() == NotType.REPLY) { %>
            replyed to comment on task:
            <% } %>
            <b><%= not.getTask().getName() %>
            </b>
            <a href="/seenNot?id=<%= not.getId() %>" style="color: gainsboro; text-align: center; font-size: 13px">seen.</a>
        </p>
        <% } %>
        <% } %>
    </div>
    <div class="allUsers">
        <h1>All my tasks list.</h1>
        <table>
            <thead>

            <tr>
                <th scope="col" width="3%">Id</th>
                <th scope="col" width="7%">Name</th>
                <th scope="col" width="20%">Description</th>
                <th scope="col" width="15%">Assigned User</th>
                <th scope="col" width="12%">Task Status</th>
                <th scope="col" width="19%">Created Date</th>
                <th scope="col" width="19%">Task Deadline</th>
                <th scope="col" width="10%">Update</th>
            </tr>
            </thead>
            <tbody>
            <% for (Task perTask : tasks) { %>
            <tr>
                <td data-label="Id"><%= perTask.getId() %>
                </td>
                <td data-label="Name" class="taskHover">
                    <a href="/getTaskById?id=<%= perTask.getId() %>"
                       style="text-decoration: none; color: black"><%= perTask.getName() %>
                    </a>
                </td>
                <td data-label="Description" style="font-size: 11px"><%= perTask.getDescription() %>
                </td>
                <td data-label="Assigned User"><%= perTask.getAssignedUser().getEmail() %>
                </td>
                <td data-label="Task Status"><%= perTask.getTaskStatus() %>
                </td>
                <td data-label="Created Date"><%= sdf.format(perTask.getCreatedDate()) %>
                </td>
                <td data-label="Deadline"><%= sdf.format(perTask.getDeadline()) %>
                </td>
                <td data-label="Update">
                    <a href="/getTaskStatus?id=<%= perTask.getId() %>" style="text-decoration: none">
                        <button type="submit" class="edit btn btn-primary btn-block btn-large"
                                style="width: 70%; margin: auto">
                            Update.
                        </button>
                    </a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>

    </div>
</div>

</body>
</html>
