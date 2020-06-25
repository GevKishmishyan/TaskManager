
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="model.UserStatus" %>
<%@ page import="model.Task" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
    List<Task> searchedList = (List<Task>) request.getAttribute("searchedList");
    String searchedWord = (String) request.getAttribute("searchedWord");

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>


<div class="main">
    <h1><%= user.getName() %> <%= user.getSurname() %>
    </h1>
    <div class="top">
        <% if (user.getUserStatus() == UserStatus.USER ){ %>
        <div class="search">
            <form action="/userSearch" method="post" style="margin-left: 28%">
                <input class="inp" style="width: 39%;  float:left;" type="search" name="search" placeholder="Name" required="required"/>
                <button style="width: 20%; margin-left: 2%; float: left;" type="submit" class="btn btn-primary btn-block btn-large">
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
        <% } else { %>
        <div class="search">
            <form action="/managerSearch" method="post" style="margin-left: 28%">
                <input class="inp" style="width: 39%;  float:left;" type="search" name="search" placeholder="Name" required="required"/>
                <button style="width: 20%; margin-left: 2%; float: left;" type="submit" class="btn btn-primary btn-block btn-large">
                    Search.
                </button>
            </form>
        </div>
        <div class="home">
            <a href="/managerHome" style="text-decoration: none">
                <button style="width: 40%; margin: auto;" type="submit" class="btn btn-primary btn-block btn-large">
                    Home page.
                </button>
            </a>
        </div>
        <% } %>
        <div class="logout">
            <a href="/logout" style="text-decoration: none">
                <button style="width: 40%; margin: auto;" type="submit" class="btn btn-primary btn-block btn-large">
                    Log out.
                </button>
            </a>
        </div>
    </div>
    <% if (searchedList == null) { %>
        <h1>Your search "<%= searchedWord %>" did not match any tasks.</h1>
    <% } else { %>
    <div class="allUsers">
        <h1>We find these tasks with your serach "<%= searchedWord %>".</h1>
        <% if (user.getUserStatus() == UserStatus.MANAGER) { %>
        <table>
            <thead>
            <tr>
                <th scope="col" width="3%">Id</th>
                <th scope="col" width="10%">Name</th>
                <th scope="col" width="13%">Description</th>
                <th scope="col" width="12%">Assigned User</th>
                <th scope="col" width="9%">Task Status</th>
                <th scope="col" width="19%">Created Date</th>
                <th scope="col" width="19%">Task Deadline</th>
                <th scope="col" width="10%">Update</th>
                <th scope="col" width="10%">Delete</th>
            </tr>
            </thead>
            <tbody>
            <% for (Task perTask : searchedList) { %>
            <tr>
                <td data-label="Id"><%= perTask.getId() %>
                </td>
                <td data-label="Name"><%= perTask.getName() %>
                </td>
                <td data-label="Description"><%= perTask.getDescription() %>
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
                    <a href="/getTaskForUpdate?id=<%= perTask.getId() %>" style="text-decoration: none">
                        <button  type="submit" class="edit btn btn-primary btn-block btn-large" style="width: 70%; margin: auto">
                            Update.
                        </button>
                    </a>
                </td>
                <td data-label="Delete">
                    <a href="/deleteTask?id=<%= perTask.getId() %>" style="text-decoration: none">
                        <button  type="submit" class="delete btn btn-primary btn-block btn-large" style="width: 70%; margin: auto">
                            Delete.
                        </button>
                    </a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
        <% } else { %>
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
            <% for (Task perTask : searchedList) { %>
            <tr>
                <td data-label="Id"><%= perTask.getId() %>
                </td>
                <td data-label="Name"><%= perTask.getName() %>
                </td>
                <td data-label="Description"><%= perTask.getDescription() %>
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
                        <button  type="submit" class="edit btn btn-primary btn-block btn-large" style="width: 70%; margin: auto">
                            Update.
                        </button>
                    </a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
        <% } %>
    </div>
    <% } %>
</div>

</body>
</html>

</body>
</html>
