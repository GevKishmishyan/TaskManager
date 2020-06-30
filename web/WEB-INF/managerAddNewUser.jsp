<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="model.*" %><%--
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
            padding: 12px 48%;
            width: 100%;
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
    List<Notification> nots = (List<Notification>) request.getAttribute("allNots");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String regex = "([^\\s]+(\\.(?i)(jpe?g|png|gif|bmp))$)";
    Pattern pattern = Pattern.compile(regex);

    String userRegMsg = "";
    String taskCreateMsg = "";
    if (session.getAttribute("message") != null) {
        userRegMsg = (String) session.getAttribute("message");
    }
    if (session.getAttribute("taskCreateMsg") != null) {
        taskCreateMsg = (String) session.getAttribute("taskCreateMsg");
    }
    session.removeAttribute("message");
    session.removeAttribute("taskCreateMsg");

%>

<%--<div class="main">--%>
<%--    <h1><%= user.getName() %> <%= user.getSurname() %>--%>
<%--    </h1>--%>
<%--    <div class="top">--%>
<%--        <div class="search">--%>
<%--            <form action="/managerSearch" method="post" style="margin-left: 28%">--%>
<%--                <input class="inp" style="width: 39%;  float:left;" type="search" name="search" placeholder="Search"--%>
<%--                       required="required"/>--%>
<%--                <button style="width: 20%; margin-left: 2%; float: left;" type="submit"--%>
<%--                        class="btn btn-primary btn-block btn-large">--%>
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
<%--        <div class="logout">--%>
<%--            <a href="/logout" style="text-decoration: none">--%>
<%--                <button style="width: 40%; margin: auto;" type="submit" class="btn btn-primary btn-block btn-large">--%>
<%--                    Log out.--%>
<%--                </button>--%>
<%--            </a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="users" style="width: 50%">--%>
<%--        <div class="addUser">--%>
<%--            <h1>Create new user.</h1>--%>
<%--            <p style="color: gainsboro; text-align: center; font-size: 13px"><%= userRegMsg %>--%>
<%--            </p>--%>
<%--            <form action="/adminRegister" method="post" enctype="multipart/form-data">--%>
<%--                <input class="inp" type="text" name="name" placeholder="Name" required="required"/>--%>
<%--                <input class="inp" type="text" name="surname" placeholder="Surname" required="required"/>--%>
<%--                <input class="inp" type="email" name="email" placeholder="E-mail" required="required"/>--%>
<%--                <input class="inp" type="password" name="password" placeholder="Password" required="required"/>--%>
<%--                <input class="choice" type="radio" name="gender" value="MALE" required="required"> <span class="txt">Male</span>--%>
<%--                <input class="choice" type="radio" name="gender" value="FEMALE" required="required"> <span class="txt">Female</span><br>--%>
<%--                <input class="inp" type="number" name="age" placeholder="Age" required="required"/>--%>
<%--                <input class="choice" type="radio" name="userStatus" value="USER"> <span--%>
<%--                    class="txt" required="required">User</span>--%>
<%--                <input class="choice" type="radio" name="userStatus" value="MANAGER"> <span--%>
<%--                    class="txt" required="required">Manager</span><br>--%>
<%--                <input class="inp" type="file" name="profilePic"/>--%>
<%--                <button type="submit" class="btn btn-primary btn-block btn-large">Create.</button>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="tasks" style="width: 50%">--%>
<%--        <div class="addTask">--%>
<%--            <h1>Create new task.</h1>--%>
<%--            <p style="color: gainsboro; text-align: center; font-size: 13px"><%= taskCreateMsg %>--%>
<%--            </p>--%>
<%--            <form action="/addTask" method="post">--%>
<%--                <input class="inp" type="text" name="name" placeholder="Name" required="required"/>--%>
<%--                <textarea class="inp" style="height: 40px" name="description" placeholder="Description"--%>
<%--                          required="required"--%>
<%--                ></textarea>--%>
<%--                <select class="inp" name="assignedUser" required="required">--%>
<%--                    <option disabled selected value>Assign to user</option>--%>
<%--                    <%--%>
<%--                        for (User perUser : users) {--%>
<%--                            if (perUser.getUserStatus() == UserStatus.USER) {--%>
<%--                    %>--%>
<%--                    <option value="<%= perUser.getEmail() %>"><%= perUser.getEmail() %>--%>
<%--                    </option>--%>
<%--                    <% }--%>
<%--                    } %>--%>
<%--                </select>--%>
<%--                <input class="choice" type="radio" name="taskStatus" value="TODO" required="required"> <span--%>
<%--                    class="txt">To do</span>--%>
<%--                <input class="choice" type="radio" name="taskStatus" value="IN_PROGRESS" required="required"> <span--%>
<%--                    class="txt">In Progress</span>--%>
<%--                <input class="choice" type="radio" name="taskStatus" value="FINISHED" required="required"> <span--%>
<%--                    class="txt">Finished</span><br>--%>
<%--                <input class="inp" type="datetime-local" name="deadline" placeholder="Deadline" required="required"/>--%>
<%--                <button type="submit" class="btn btn-primary btn-block btn-large">Create.</button>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="allUsers">--%>
<%--        <h1>Notifications.</h1>--%>
<%--        <% for (Notification not : nots) { %>--%>
<%--        <% if (not.getAuthor().getUserStatus() != UserStatus.MANAGER) { %>--%>
<%--        <p style="color: gainsboro; text-align: center; font-size: 13px">--%>
<%--            <b><%= not.getAuthor().getName() %> <%= not.getAuthor().getSurname() %>--%>
<%--            </b>--%>
<%--            <% if (not.getNotType() == NotType.COMMENT) { %>--%>
<%--            added new comment on task:--%>
<%--            <% } else if (not.getNotType() == NotType.REPLY) { %>--%>
<%--            replyed to comment on task:--%>
<%--            <% } %>--%>
<%--            <b><%= not.getTask().getName() %>--%>
<%--            </b>--%>
<%--            <a href="/seenNot?id=<%= not.getId() %>"--%>
<%--               style="color: gainsboro; text-align: center; font-size: 13px">seen.</a>--%>
<%--        </p>--%>
<%--        <% } %>--%>
<%--        <% } %>--%>
<%--    </div>--%>
<%--    <div class="allUsers">--%>
<%--        <h1>All users list.</h1>--%>
<%--        <table>--%>
<%--            <thead>--%>
<%--            <tr>--%>
<%--                <th scope="col" width="5%">Id</th>--%>
<%--                <th scope="col" width="6%">Photo</th>--%>
<%--                <th scope="col" width="12%">Name</th>--%>
<%--                <th scope="col" width="12%">Surname</th>--%>
<%--                <th scope="col" width="20%">Email</th>--%>
<%--                <th scope="col" width="10%">Gender</th>--%>
<%--                <th scope="col" width="5%">Age</th>--%>
<%--                <th scope="col" width="10%">User Status</th>--%>
<%--                <th scope="col" width="10%">Update</th>--%>
<%--                <th scope="col" width="10%">Delete</th>--%>
<%--            </tr>--%>
<%--            </thead>--%>
<%--            <tbody>--%>
<%--            <% for (User perUser : users) { %>--%>
<%--            <tr>--%>
<%--                <td data-label="Id"><%= perUser.getId() %>--%>
<%--                </td>--%>
<%--                <td data-label="Profile Picture">--%>
<%--                    <% if (!pattern.matcher(perUser.getProfPicUrl()).matches()) { %>--%>
<%--                        <% if (perUser.getGender() == Gender.MALE) { %>--%>
<%--                        <img src="/image?path=defMale.png" width="30px" alt="">--%>
<%--                        <% } else if (perUser.getGender() == Gender.FEMALE) { %>--%>
<%--                        <img src="/image?path=defFemale.png" width="30px" alt="">--%>
<%--                        <% }--%>
<%--                    } else { %>--%>
<%--                    <img src="/image?path=<%= perUser.getProfPicUrl() %>" width="30px" alt="">--%>
<%--                    <% } %>--%>
<%--                </td>--%>
<%--                <td data-label="Name"><%= perUser.getName() %>--%>
<%--                </td>--%>
<%--                <td data-label="Surname"><%= perUser.getSurname() %>--%>
<%--                </td>--%>
<%--                <td data-label="Email"><%= perUser.getEmail() %>--%>
<%--                </td>--%>
<%--                <td data-label="Gender"><%= perUser.getGender() %>--%>
<%--                </td>--%>
<%--                <td data-label="Age"><%= perUser.getAge() %>--%>
<%--                </td>--%>
<%--                <td data-label="User Status"><%= perUser.getUserStatus() %>--%>
<%--                </td>--%>
<%--                <td data-label="Edit">--%>
<%--                    <a href="/getUserForUpdate?id=<%= perUser.getId() %>" style="text-decoration: none">--%>
<%--                        <button type="submit" class="edit btn btn-primary btn-block btn-large"--%>
<%--                                style="width: 70%; margin: auto">--%>
<%--                            Update.--%>
<%--                        </button>--%>
<%--                    </a>--%>
<%--                </td>--%>
<%--                <td data-label="Delete">--%>
<%--                    <a href="/deleteUser?id=<%= perUser.getId() %>" style="text-decoration: none">--%>
<%--                        <button type="submit" class="delete btn btn-primary btn-block btn-large"--%>
<%--                                style="width: 70%; margin: auto">--%>
<%--                            Delete.--%>
<%--                        </button>--%>
<%--                    </a>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <% } %>--%>

<%--            </tbody>--%>
<%--        </table>--%>
<%--    </div>--%>
<%--    <div class="allUsers">--%>
<%--        <h1>All tasks list.</h1>--%>
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
<%--            <% for (Task perTask : tasks) { %>--%>
<%--            <tr>--%>
<%--                <td data-label="Id"><%= perTask.getId() %>--%>
<%--                </td>--%>
<%--                <td data-label="Name" class="taskHover">--%>
<%--                    <a href="/getTaskById?id=<%= perTask.getId() %>"--%>
<%--                       style="text-decoration: none; color: black"><%= perTask.getName() %>--%>
<%--                    </a>--%>
<%--                </td>--%>
<%--                <td data-label="Description" style="font-size: 11px"><%= perTask.getDescription() %>--%>
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
<%--                        <button type="submit" class="edit btn btn-primary btn-block btn-large"--%>
<%--                                style="width: 70%; margin: auto">--%>
<%--                            Update.--%>
<%--                        </button>--%>
<%--                    </a>--%>
<%--                </td>--%>
<%--                <td data-label="Delete">--%>
<%--                    <a href="/deleteTask?id=<%= perTask.getId() %>" style="text-decoration: none">--%>
<%--                        <button type="submit" class="delete btn btn-primary btn-block btn-large"--%>
<%--                                style="width: 70%; margin: auto">--%>
<%--                            Delete.--%>
<%--                        </button>--%>
<%--                    </a>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <% } %>--%>
<%--            </tbody>--%>
<%--        </table>--%>
<%--    </div>--%>


<%--</div>--%>


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
                <li class="nav-item active">
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
    <div class="main-panel">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top " id="navigation-example">
            <div class="container-fluid">
                <div class="navbar-wrapper">
                    <a class="navbar-brand" href="javascript:void(0)">Dashboard</a>
                </div>
                <div class="collapse navbar-collapse justify-content-end">
                    <form class="navbar-form">
                        <div class="input-group no-border">
                            <input type="text" value="" class="form-control" placeholder="Search...">
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
                            <a class="nav-link" href="javscript:void(0)" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">notifications</i>
                                <span class="notification">5</span>
                                <p class="d-lg-none d-md-block">
                                    Some Actions
                                </p>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="javascript:void(0)">Mike John responded to your email</a>
                                <a class="dropdown-item" href="javascript:void(0)">You have 5 new tasks</a>
                                <a class="dropdown-item" href="javascript:void(0)">You're now friend with Andrew</a>
                                <a class="dropdown-item" href="javascript:void(0)">Another Notification</a>
                                <a class="dropdown-item" href="javascript:void(0)">Another One</a>
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
                                <h4 class="card-title">Add new user</h4>
                                <p class="card-category">Please fill all fields for adding new user</p>
                            </div>
                            <div class="card-body">
                                <p style="color: gainsboro; text-align: center; font-size: 13px"><%= userRegMsg %>
                                <form action="/register" method="post" enctype="multipart/form-data" autocomplete="off">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Fist Name</label>
                                                <input type="text" name="name" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Last Name</label>
                                                <input type="text" name="surname" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Email address</label>
                                                <input type="email" name="email" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Password</label>
                                                <input type="password" name="password" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Gender</label>
                                                <select name="gender" class="form-control">
                                                    <option disabled selected value>Select user gender</option>--%>
                                                    <option value="MALE">Male</option>
                                                    <option value="FEMALE">Female</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Age</label>
                                                <input type="number" name="age" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Account status</label>
                                                <select name="userStatus" class="form-control">
                                                    <option disabled selected value>Select user status</option>--%>
                                                    <option value="MANAGER">Manager</option>
                                                    <option value="USER">User</option>
                                                </select>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">

                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <input type="file" name="profilePic" id="updateProfilePic">
                                                <label for="updateProfilePic" id="updateProfilePicLabel">
                                                    <span class="material-icons" style="font-size: 19px">
                                                        add_photo_alternate
                                                    </span>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">

                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary pull-right">Create Profile</button>
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
