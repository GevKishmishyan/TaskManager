<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="model.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="manager.TaskManager" %><%--
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
    </style>
</head>
<body>

<%
    User user = (User) session.getAttribute("user");
    List<User> users = (List<User>) request.getAttribute("users");
    List<Task> tasks = (List<Task>) request.getAttribute("tasks");
    TaskManager taskManager = new TaskManager();
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
                <li class="nav-item active">
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
                <li class="nav-item ">
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
                <li class="nav-item active">
                    <a class="nav-link" href="/userProfile">
                        <i class="material-icons">person</i>
                        <p>Profile</p>
                    </a>
                </li>
                <li class="nav-item ">
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
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title">Edit Profile</h4>
                                <p class="card-category">Complete your profile</p>
                            </div>
                            <div class="card-body">
                                <form action="/updateProfile" method="post" autocomplete="off">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Fist Name</label>
                                                <input type="text" name="name" value="<%= user.getName() %>"
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Last Name</label>
                                                <input type="text" name="surname" value="<%= user.getSurname() %>"
                                                       class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Email address</label>
                                                <input type="email" name="email" value="<%= user.getEmail() %>"
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Age</label>
                                                <input type="number" name="age" value="<%= user.getAge() %>"
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Account status (disabled)</label>
                                                <input type="text" name="userStatus" value="<%= user.getUserStatus() %>"
                                                       class="form-control" disabled>
                                            </div>
                                        </div>

                                    </div>
                                    <button type="submit" class="btn btn-primary pull-right">Update Profile</button>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-profile">
                            <div class="card-avatar">
                                <% if
                                (
                                        user
                                                .
                                                        getUserStatus
                                                                (
                                                                )
                                                ==
                                                UserStatus
                                                        .
                                                        MANAGER
                                ) { %>
                                <a href="/managerHome">
                                        <% } else { %>
                                    <a href="/userHome">
                                        <% } %>
                                        <% if
                                        (
                                                !
                                                        pattern
                                                                .
                                                                        matcher
                                                                                (
                                                                                        user
                                                                                                .
                                                                                                        getProfPicUrl
                                                                                                                (
                                                                                                                )
                                                                                )
                                                                .
                                                                        matches
                                                                                (
                                                                                )
                                        ) { %>
                                        <% if
                                        (
                                                user
                                                        .
                                                                getGender
                                                                        (
                                                                        )
                                                        ==
                                                        Gender
                                                                .
                                                                MALE
                                        ) { %>
                                        <img class="img" src="/image?path=defMale.png" width="30px" alt="">
                                        <% } else if
                                        (
                                                user
                                                        .
                                                                getGender
                                                                        (
                                                                        )
                                                        ==
                                                        Gender
                                                                .
                                                                FEMALE
                                        ) { %>
                                        <img class="img" src="/image?path=defFemale.png" width="30px" alt="">
                                        <% }
                                        } else { %>
                                        <img class="img" src="/image?path=<%= user.getProfPicUrl() %>" width="30px"
                                             alt="">
                                        <% } %>
                                    </a>
                            </div>
                            <div class="card-body">
                                <form action="/updateProfilePic" method="post" enctype="multipart/form-data">
                                    <input type="file" name="profilePic" id="updateProfilePic">
                                    <label for="updateProfilePic" id="updateProfilePicLabel">
                                        <span class="material-icons" style="font-size: 19px">
                                            add_photo_alternate
                                        </span>
                                    </label><br>
                                    <button type="submit" class="btn btn-primary">
                                        Update Profile Picture
                                    </button>

                                </form>
                                <br>
                                <h6 class="card-category"><%= user
                                        .
                                                getUserStatus
                                                        (
                                                        ) %>
                                </h6>
                                <h4 class="card-title"><%= user
                                        .
                                                getName
                                                        (
                                                        ) %> <%= user
                                        .
                                                getSurname
                                                        (
                                                        ) %>
                                </h4>
                                <%--                                <p class="card-description">--%>
                                <%--                                    Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is...--%>
                                <%--                                </p>--%>
                                <%--                                <a href="#pablo" class="btn btn-primary btn-round">Follow</a>--%>
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
