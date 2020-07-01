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

    <%--  Costum css  --%>
    <style type="text/css">
        #updateProfilePic {
            display: none;
        }

        #updateProfilePicLabel {
            color: #fff;
            background-color: #9c27b0;
            border-color: #9c27b0;
            box-shadow: 0 2px 2px 0 rgba(156, 39, 176, 0.14), 0 3px 1px -2px rgba(156, 39, 176, 0.2), 0 1px 5px 0 rgba(156, 39, 176, 0.12);
            position: relative;
            padding: 12px 12px;
            margin: 0.3125rem 1px;
            font-size: .75rem;
            font-weight: 400;
            line-height: 1.428571;
            text-decoration: none;
            text-transform: uppercase;
            letter-spacing: 0;
            cursor: pointer;
            border: 0;
            border-radius: 0.2rem;
            outline: 0;
            transition: box-shadow 0.2s cubic-bezier(0.4, 0, 1, 1), background-color 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            will-change: box-shadow, transform;
        }

        .form-group option {
            font-size: 15px;
            font-weight: 200;
            background: transparent;
        }
    </style>
</head>
<body>

<%
    User user = (User) request.getAttribute("user");
    User sessionUser = (User) session.getAttribute("user");
    String regex = "([^\\s]+(\\.(?i)(jpe?g|png|gif|bmp))$)";
    Pattern pattern = Pattern.compile(regex);
    List<Notification> nots = (List<Notification>) request.getAttribute("allNots");
    List<Notification> userNots = new ArrayList<>();
    for (Notification not : nots) {
        if (!not.getAuthor().equals(sessionUser)){
            userNots.add(not);
        }
    }
    Task task = (Task) request.getAttribute("task");
    List<User> users = (List<User>) request.getAttribute("usersByStatus");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>


<div class="wrapper ">
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
                                <% if (!not.getAuthor().equals(user)) { %>
                                <a class="dropdown-item" href="/seenNot?id=<%= not.getId() %>">
                                    <strong><%= not.getAuthor().getName() %>&nbsp;<%= not.getAuthor().getSurname() %></strong>
                                    &nbsp;
                                    <% if (not.getNotType() == NotType.NEW_TASK) { %>
                                    assigned you new task:
                                    <% } else if (not.getNotType() == NotType.COMMENT) { %>
                                    added comment on task:
                                    <% } else if (not.getNotType() == NotType.REPLY) { %>
                                    replied to comment on task:
                                    <% } %>
                                    &nbsp;
                                    <strong><%= not.getTask().getName() %></strong>
                                </a>
                                <% }
                                }
                                }%>
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
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title">Edit Task</h4>
                                <p class="card-category">Please fill all fields for updateing task</p>
                            </div>
                            <div class="card-body">
                                <form action="/updateTask" method="post" autocomplete="off">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Title</label>
                                                <input type="text" name="name" value="<%= task.getName() %>"
                                                       class="form-control">
                                                <input type="hidden" name="id" value="<%= task.getId() %>"
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Assigned user</label>
                                                <select name="assignedUser" class="form-control">
                                                    <option selected value="<%= task.getAssignedUser().getEmail() %>">
                                                        <%= task.getAssignedUser().getName() %>&nbsp;<%= task.getAssignedUser().getSurname() %>
                                                    </option>
                                                    <%
                                                        for (User perUser : users) {
                                                            if (perUser.equals(task.getAuthor())) {
                                                                continue;
                                                            } else { %>
                                                    <option value="<%= perUser.getEmail() %>"><%= perUser.getName() %>
                                                        &nbsp;
                                                        <%= perUser.getSurname() %>
                                                    </option>
                                                    <% }
                                                    }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Task status</label>
                                                <select name="taskStatus" class="form-control">
                                                    <% if (task.getTaskStatus() == TaskStatus.TODO) { %>
                                                        <option value="TODO" selected>To do</option>
                                                        <option value="IN_PROGRESS">In progress</option>
                                                        <option value="FINISHED">Finished</option>
                                                    <% } else if (task.getTaskStatus() == TaskStatus.IN_PROGRESS) { %>
                                                        <option value="TODO">To do</option>
                                                        <option value="IN_PROGRESS" selected>In progress</option>
                                                        <option value="FINISHED">Finished</option>
                                                    <% } else if (task.getTaskStatus() == TaskStatus.FINISHED) {%>
                                                        <option value="TODO">To do</option>
                                                        <option value="IN_PROGRESS">In progress</option>
                                                        <option value="FINISHED" selected>Finished</option>
                                                    <% } %>


                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <%
                                                    String parse = sdf.format(task.getDeadline());
                                                    String[] deadlineStr = parse.split(" ");
                                                    String deadline = deadlineStr[0] + "T" + deadlineStr[1];
                                                %>
                                                <label class="bmd-label-floating">Deadline</label>
                                                <input type="datetime-local" name="deadline" class="form-control" value="<%= deadline %>">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Description</label>
                                                <textarea class="form-control" style="height: 50px"
                                                          name="description"><%= task.getDescription() %></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary pull-right">Update Task</button>
                                    <div class="clearfix"></div>
                                </form>
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


