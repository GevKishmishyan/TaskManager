<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<%@ page import="model.User" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="model.UserStatus" %>--%>
<%--<%@ page import="model.Task" %>--%>
<%--<%@ page import="java.text.SimpleDateFormat" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>

<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--    <link rel="stylesheet" type="text/css" href="../css/style.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<%--%>
<%--    User user = (User) session.getAttribute("user");--%>
<%--    List<Task> searchedList = (List<Task>) request.getAttribute("searchedList");--%>
<%--    String searchedWord = (String) request.getAttribute("searchedWord");--%>

<%--    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");--%>
<%--%>--%>


<%--<div class="main">--%>
<%--    <h1><%= user.getName() %> <%= user.getSurname() %>--%>
<%--    </h1>--%>
<%--    <div class="top">--%>
<%--        <% if (user.getUserStatus() == UserStatus.USER ){ %>--%>
<%--        <div class="search">--%>
<%--            <form action="/userSearch" method="post" style="margin-left: 28%">--%>
<%--                <input class="inp" style="width: 39%;  float:left;" type="search" name="search" placeholder="Name" required="required"/>--%>
<%--                <button style="width: 20%; margin-left: 2%; float: left;" type="submit" class="btn btn-primary btn-block btn-large">--%>
<%--                    Search.--%>
<%--                </button>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--        <div class="home">--%>
<%--            <a href="/userHome" style="text-decoration: none">--%>
<%--                <button style="width: 40%; margin: auto;" type="submit" class="btn btn-primary btn-block btn-large">--%>
<%--                    Home page.--%>
<%--                </button>--%>
<%--            </a>--%>
<%--        </div>--%>
<%--        <% } else { %>--%>
<%--        <div class="search">--%>
<%--            <form action="/managerSearch" method="post" style="margin-left: 28%">--%>
<%--                <input class="inp" style="width: 39%;  float:left;" type="search" name="search" placeholder="Name" required="required"/>--%>
<%--                <button style="width: 20%; margin-left: 2%; float: left;" type="submit" class="btn btn-primary btn-block btn-large">--%>
<%--                    Search.--%>
<%--                </button>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--        <div class="home">--%>
<%--            <a href="/managerHome" style="text-decoration: none">--%>
<%--                <button style="width: 40%; margin: auto;" type="submit" class="btn btn-primary btn-block btn-large">--%>
<%--                    Home page.--%>
<%--                </button>--%>
<%--            </a>--%>
<%--        </div>--%>
<%--        <% } %>--%>
<%--        <div class="logout">--%>
<%--            <a href="/logout" style="text-decoration: none">--%>
<%--                <button style="width: 40%; margin: auto;" type="submit" class="btn btn-primary btn-block btn-large">--%>
<%--                    Log out.--%>
<%--                </button>--%>
<%--            </a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <% if (searchedList == null) { %>--%>
<%--        <h1>Your search "<%= searchedWord %>" did not match any tasks.</h1>--%>
<%--    <% } else { %>--%>
<%--    <div class="allUsers">--%>
<%--        <h1>We find these tasks with your serach "<%= searchedWord %>".</h1>--%>
<%--        <% if (user.getUserStatus() == UserStatus.MANAGER) { %>--%>
<%--        <table>--%>
<%--            <thead>--%>
<%--            <tr>--%>
<%--                <th scope="col" width="3%">Id</th>--%>
<%--                <th scope="col" width="10%">Name</th>--%>
<%--                <th scope="col" width="13%">Description</th>--%>
<%--                <th scope="col" width="12%">Assigned User</th>--%>
<%--                <th scope="col" width="9%">Task Status</th>--%>
<%--                <th scope="col" width="19%">Created Date</th>--%>
<%--                <th scope="col" width="19%">Task Deadline</th>--%>
<%--                <th scope="col" width="10%">Update</th>--%>
<%--                <th scope="col" width="10%">Delete</th>--%>
<%--            </tr>--%>
<%--            </thead>--%>
<%--            <tbody>--%>
<%--            <% for (Task perTask : searchedList) { %>--%>
<%--            <tr>--%>
<%--                <td data-label="Id"><%= perTask.getId() %>--%>
<%--                </td>--%>
<%--                <td data-label="Name"><%= perTask.getName() %>--%>
<%--                </td>--%>
<%--                <td data-label="Description"><%= perTask.getDescription() %>--%>
<%--                </td>--%>
<%--                <td data-label="Assigned User"><%= perTask.getAssignedUser().getEmail() %>--%>
<%--                </td>--%>
<%--                <td data-label="Task Status"><%= perTask.getTaskStatus() %>--%>
<%--                </td>--%>
<%--                <td data-label="Created Date"><%= sdf.format(perTask.getCreatedDate()) %>--%>
<%--                </td>--%>
<%--                <td data-label="Deadline"><%= sdf.format(perTask.getDeadline()) %>--%>
<%--                </td>--%>
<%--                <td data-label="Update">--%>
<%--                    <a href="/getTaskForUpdate?id=<%= perTask.getId() %>" style="text-decoration: none">--%>
<%--                        <button  type="submit" class="edit btn btn-primary btn-block btn-large" style="width: 70%; margin: auto">--%>
<%--                            Update.--%>
<%--                        </button>--%>
<%--                    </a>--%>
<%--                </td>--%>
<%--                <td data-label="Delete">--%>
<%--                    <a href="/deleteTask?id=<%= perTask.getId() %>" style="text-decoration: none">--%>
<%--                        <button  type="submit" class="delete btn btn-primary btn-block btn-large" style="width: 70%; margin: auto">--%>
<%--                            Delete.--%>
<%--                        </button>--%>
<%--                    </a>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <% } %>--%>
<%--            </tbody>--%>
<%--        </table>--%>
<%--        <% } else { %>--%>
<%--        <table>--%>
<%--            <thead>--%>

<%--            <tr>--%>
<%--                <th scope="col" width="3%">Id</th>--%>
<%--                <th scope="col" width="7%">Name</th>--%>
<%--                <th scope="col" width="20%">Description</th>--%>
<%--                <th scope="col" width="15%">Assigned User</th>--%>
<%--                <th scope="col" width="12%">Task Status</th>--%>
<%--                <th scope="col" width="19%">Created Date</th>--%>
<%--                <th scope="col" width="19%">Task Deadline</th>--%>
<%--                <th scope="col" width="10%">Update</th>--%>
<%--            </tr>--%>
<%--            </thead>--%>
<%--            <tbody>--%>
<%--            <% for (Task perTask : searchedList) { %>--%>
<%--            <tr>--%>
<%--                <td data-label="Id"><%= perTask.getId() %>--%>
<%--                </td>--%>
<%--                <td data-label="Name"><%= perTask.getName() %>--%>
<%--                </td>--%>
<%--                <td data-label="Description"><%= perTask.getDescription() %>--%>
<%--                </td>--%>
<%--                <td data-label="Assigned User"><%= perTask.getAssignedUser().getEmail() %>--%>
<%--                </td>--%>
<%--                <td data-label="Task Status"><%= perTask.getTaskStatus() %>--%>
<%--                </td>--%>
<%--                <td data-label="Created Date"><%= sdf.format(perTask.getCreatedDate()) %>--%>
<%--                </td>--%>
<%--                <td data-label="Deadline"><%= sdf.format(perTask.getDeadline()) %>--%>
<%--                </td>--%>
<%--                <td data-label="Update">--%>
<%--                    <a href="/getTaskStatus?id=<%= perTask.getId() %>" style="text-decoration: none">--%>
<%--                        <button  type="submit" class="edit btn btn-primary btn-block btn-large" style="width: 70%; margin: auto">--%>
<%--                            Update.--%>
<%--                        </button>--%>
<%--                    </a>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <% } %>--%>
<%--            </tbody>--%>
<%--        </table>--%>
<%--        <% } %>--%>
<%--    </div>--%>
<%--    <% } %>--%>
<%--</div>--%>

<%--</body>--%>
<%--</html>--%>

<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="model.*" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 29/06/2020
  Time: 6:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
    <!-- CSS Files -->
    <link href="../assets/css/material-dashboard.css?v=2.1.0" rel="stylesheet"/>
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="../assets/demo/demo.css" rel="stylesheet"/>
</head>
<body>

<%
    User user = (User) session.getAttribute("user");
    List<User> users = (List<User>) request.getAttribute("users");
    List<Task> tasks = (List<Task>) request.getAttribute("searchedList");
    List<Notification> nots = (List<Notification>) request.getAttribute("allNots");
    List<Notification> userNots = new ArrayList<>();

    if (user.getUserStatus() == UserStatus.USER) {
        for (Notification not : nots) {
            if (!not.getAuthor().equals(user) && not.getTask().getAssignedUser().equals(user)) {
                userNots.add(not);
            }
        }
    } else {
        for (Notification not : nots) {
            if (!not.getAuthor().equals(user)) {
                userNots.add(not);
            }
        }
    }

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String regex = "([^\\s]+(\\.(?i)(jpe?g|png|gif|bmp))$)";
    Pattern pattern = Pattern.compile(regex);

    String userRegMsg = "";
    String taskCreateMsg = "";
    if (session.getAttribute("userRegMsg") != null) {
        userRegMsg = (String) session.getAttribute("userRegMsg");
    }
    if (session.getAttribute("taskCreateMsg") != null) {
        taskCreateMsg = (String) session.getAttribute("taskCreateMsg");
    }
    session.removeAttribute("userRegMsg");
    session.removeAttribute("taskCreateMsg");

%>

<div class="wrapper ">
    <% if (user.getUserStatus() == UserStatus.MANAGER) { %>
    <div class="sidebar" data-color="purple" data-background-color="black" data-image="../assets/img/sidebar-2.jpg">

        <div class="logo"><a href="/managerHome" class="simple-text logo-normal">
            Task Management
        </a></div>
        <div class="sidebar-wrapper">
            <ul class="nav">
                <li class="nav-item ">
                    <a class="nav-link" href="/managerHome">
                        <i class="material-icons">dashboard</i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/userProfile">
                        <i class="material-icons">person</i>
                        <p>User Profile</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/addNewUser">
                        <i class="material-icons">assignment_ind</i>
                        <p>Add new user</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/addNewTask">
                        <i class="material-icons">assignment_turned_in</i>
                        <p>Add new task</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/managerGetUsersList">
                        <i class="material-icons">content_paste</i>
                        <p>Users List</p>
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/managerGetTasksList">
                        <i class="material-icons">library_books</i>
                        <p>Tasks List</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/logout">
                        <i class="material-icons">logout</i>
                        <p>Log out</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <% } else { %>
    <div class="sidebar" data-color="purple" data-background-color="black" data-image="../assets/img/sidebar-2.jpg">
        <div class="logo"><a href="/userHome" class="simple-text logo-normal">
            Task Management
        </a></div>
        <div class="sidebar-wrapper">
            <ul class="nav">
                <li class="nav-item   ">
                    <a class="nav-link" href="/userHome">
                        <i class="material-icons">dashboard</i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/userProfile">
                        <i class="material-icons">person</i>
                        <p>Profile</p>
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/managerGetTasksList">
                        <i class="material-icons">library_books</i>
                        <p>Tasks List</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/logout">
                        <i class="material-icons">logout</i>
                        <p>Log out</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <% } %>
    <div class="main-panel">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top " id="navigation-example">
            <div class="container-fluid">
                <div class="navbar-wrapper">
                    <a class="navbar-brand" href="javascript:void(0)">Dashboard</a>
                </div>
                <div class="collapse navbar-collapse justify-content-end">
                    <form class="navbar-form" action="/search" method="post">
                        <div class="input-group no-border">
                            <input type="text" name="search" value="" class="form-control" placeholder="Search...">
                            <button type="submit" class="btn btn-default btn-round btn-just-icon">
                                <i class="material-icons">search</i>
                                <div class="ripple-container"></div>
                            </button>
                        </div>
                    </form>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="/managerHome">
                                <i class="material-icons">dashboard</i>
                                <p class="d-lg-none d-md-block">
                                    Stats
                                </p>
                            </a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="javscript:void(0)" id="navbarDropdownMenuLink"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">notifications</i>
                                <% if (userNots.size() != 0) { %>
                                <span class="notification"><%= userNots.size() %></span>
                                <% } else { %>
                                <span class="notification"></span>
                                <% } %>
                                <p class="d-lg-none d-md-block">
                                    Some Actions
                                </p>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                <% if (nots.size() != 0) { %>
                                <% for (Notification not : userNots) { %>

                                <%
                                    if (user.getUserStatus() == UserStatus.USER) {
                                        if (!not.getAuthor().equals(user) && not.getTask().getAssignedUser().equals(user)) { %>
                                <a class="dropdown-item" href="/seenNot?id=<%= not.getId() %>">
                                    <strong><%= not.getAuthor().getName() %>&nbsp;<%= not.getAuthor().getSurname() %>
                                    </strong>
                                    &nbsp;
                                    <% if (not.getNotType() == NotType.NEW_TASK) { %>
                                    assigned you new task:
                                    <% } else if (not.getNotType() == NotType.COMMENT) { %>
                                    added comment on task:
                                    <% } else if (not.getNotType() == NotType.REPLY) { %>
                                    replied to comment on task:
                                    <% } %>
                                    &nbsp;
                                    <strong><%= not.getTask().getName() %>
                                    </strong>
                                </a>
                                <% } %>
                                <% } else {
                                    if (!not.getAuthor().equals(user)) { %>
                                <a class="dropdown-item" href="/seenNot?id=<%= not.getId() %>">
                                    <strong><%= not.getAuthor().getName() %>&nbsp;<%= not.getAuthor().getSurname() %>
                                    </strong>
                                    &nbsp;
                                    <% if (not.getNotType() == NotType.NEW_TASK) { %>
                                    assigned you new task:
                                    <% } else if (not.getNotType() == NotType.COMMENT) { %>
                                    added comment on task:
                                    <% } else if (not.getNotType() == NotType.REPLY) { %>
                                    replied to comment on task:
                                    <% } %>
                                    &nbsp;
                                    <strong><%= not.getTask().getName() %>
                                    </strong>
                                </a>
                                <% }
                                } %>

                                <% }
                                } %>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/userProfile">
                                <i class="material-icons">person</i>
                                <p class="d-lg-none d-md-block">
                                    Account
                                </p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- End Navbar -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-plain">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title mt-0"> Tasks List</h4>
                                <p class="card-category"> Here is a list of our employees' tasks</p>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead class="">
                                        <th>
                                            ID
                                        </th>
                                        <th>
                                            Name
                                        </th>
                                        <th>
                                            Description
                                        </th>
                                        <th>
                                            Assigned User
                                        </th>
                                        <th>
                                            Status
                                        </th>
                                        <th>
                                            Created Date
                                        </th>
                                        <th>
                                            Deadline
                                        </th>
                                        <% if (user.getUserStatus() == UserStatus.MANAGER) { %>
                                        <th>
                                            Update
                                        </th>
                                        <th>
                                            Delete
                                        </th>
                                        <% } %>
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
                                            <td data-label="Description"
                                                style="font-size: 11px"><%= perTask.getDescription() %>
                                            </td>
                                            <td data-label="Assigned User"><%= perTask.getAssignedUser().getEmail() %>
                                            </td>
                                            <td data-label="Task Status"><%= perTask.getTaskStatus() %>
                                            </td>
                                            <td data-label="Created Date"><%= sdf.format(perTask.getCreatedDate()) %>
                                            </td>
                                            <td data-label="Deadline"><%= sdf.format(perTask.getDeadline()) %>
                                            </td>
                                            <% if (user.getUserStatus() == UserStatus.MANAGER) { %>
                                            <td data-label="Update">
                                                <a href="/getTaskForUpdate?id=<%= perTask.getId() %>"
                                                   style="text-decoration: none">
                                                    <button type="submit" class="btn btn-primary "
                                                            style="background-color: #298c18">Update
                                                    </button>
                                                </a>
                                            </td>
                                            <td data-label="Delete">
                                                <a href="/deleteTask?id=<%= perTask.getId() %>"
                                                   style="text-decoration: none">
                                                    <button type="submit" class="btn btn-primary "
                                                            style="background-color: #ba282d">Delete
                                                    </button>
                                                </a>
                                            </td>
                                            <% } %>
                                        </tr>
                                        <% } %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer">
            <div class="container-fluid">
                <div class="copyright float-right" id="date">
                    , made with <i class="material-icons">favorite</i> by
                    <a href="#" target="_self">Gevorg Kishmishyan</a> for a better web.
                </div>
            </div>
        </footer>
        <script>
            const x = new Date().getFullYear();
            let date = document.getElementById('date');
            date.innerHTML = '&copy; ' + x + date.innerHTML;
        </script>
    </div>
</div>

<!--   Core JS Files   -->
<script src="../assets/js/core/jquery.min.js"></script>
<script src="../assets/js/core/popper.min.js"></script>
<script src="../assets/js/core/bootstrap-material-design.min.js"></script>
<script src="https://unpkg.com/default-passive-events"></script>
<script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Chartist JS -->
<script src="../assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="../assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
<script src="../assets/js/material-dashboard.js?v=2.1.0"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="../assets/demo/demo.js"></script>
<script src="../js/manager.js" type="text/javascript"></script>


</body>
</html>

