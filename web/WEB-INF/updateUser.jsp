

<%--    <div class="login">--%>
<%--        <h1>Update user info.</h1>--%>
<%--        <form action="/updateUser" method="post">--%>
<%--            <input class="inp" type="number" name="id" placeholder="Id" required="required" readonly value="<%= user.getId() %>"/>--%>
<%--            <input class="inp" type="text" name="name" placeholder="Name" required="required" value="<%= user.getName() %>"/>--%>
<%--            <input class="inp" type="text" name="surname" placeholder="Surname" required="required" value="<%= user.getSurname() %>"/>--%>
<%--            <input class="inp" type="email" name="email" placeholder="E-mail" required="required" value="<%= user.getEmail() %>"/>--%>
<%--            <input class="inp" type="password" name="password" placeholder="Password" required="required" value="<%= user.getPassword() %>"/>--%>
<%--            <% if (user.getGender() == Gender.MALE) { %>--%>
<%--            <input class="choice" type="radio" name="gender" value="MALE" checked> <span class="txt">Male</span>--%>
<%--            <input class="choice" type="radio" name="gender" value="FEMALE"> <span class="txt">Female</span><br>--%>
<%--            <% } else if (user.getGender() == Gender.FEMALE) { %>--%>
<%--            <input class="choice" type="radio" name="gender" value="MALE"> <span class="txt" >Male</span>--%>
<%--            <input class="choice" type="radio" name="gender" value="FEMALE" checked> <span class="txt">Female</span><br>--%>
<%--            <% } %>--%>
<%--            <input class="inp" type="number" name="age" placeholder="Age" required="required" value="<%= user.getAge() %>"/>--%>
<%--            <% if (user.getUserStatus() == UserStatus.USER) { %>--%>
<%--            <input class="choice" type="radio" name="userStatus" value="USER" checked> <span class="txt">User</span>--%>
<%--            <input class="choice" type="radio" name="userStatus" value="MANAGER"> <span class="txt">Manager</span><br>--%>
<%--            <% } else if (user.getUserStatus() == UserStatus.MANAGER) { %>--%>
<%--            <input class="choice" type="radio" name="userStatus" value="USER" > <span class="txt">User</span>--%>
<%--            <input class="choice" type="radio" name="userStatus" value="MANAGER" checked> <span class="txt">Manager</span><br>--%>
<%--            <% } %>--%>
<%--            <button type="submit" class="btn btn-primary btn-block btn-large">Update.</button>--%>
<%--        </form>--%>

<%--        <div class="home" style="width: 100%;">--%>
<%--            <a href="/managerHome" style="text-decoration: none">--%>
<%--                <button style="width: 60%; margin: auto;" type="submit" class="btn btn-primary btn-block btn-large">--%>
<%--                    Home page.--%>
<%--                </button>--%>
<%--            </a>--%>
<%--        </div>--%>
<%--    </div>--%>

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
        .form-group option{
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
                <% if (sessionUser.getUserStatus() == UserStatus.MANAGER){ %>
                <li class="nav-item ">
                    <a class="nav-link" href="/userProfile">
                        <i class="material-icons">person</i>
                        <p>User Profile</p>
                    </a>
                </li>
                <% } %>
                <li class="nav-item active">
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
                    <a class="navbar-brand" href="javascript:void(0)">User Profile</a>
                </div>
                <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index"
                        aria-expanded="false" aria-label="Toggle navigation" data-target="#navigation-example">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="navbar-toggler-icon icon-bar"></span>
                    <span class="navbar-toggler-icon icon-bar"></span>
                    <span class="navbar-toggler-icon icon-bar"></span>
                </button>
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
                            <a class="nav-link" href="javascript:void(0)">
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
                            <a class="nav-link" href="javascript:void(0)">
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
                                <p class="card-category">Update user profile</p>
                            </div>
                            <div class="card-body">
                                <form action="/updateUser" method="post" autocomplete="off">
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
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Email address</label>
                                                <input type="email" name="email" value="<%= user.getEmail() %>"
                                                       class="form-control">
                                                <input type="hidden" name="id" value="<%= user.getId() %>"
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Password</label>
                                                <input type="password" name="password" value="<%= user.getPassword() %>"
                                                       class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Gender</label>
                                                <select name="gender" class="form-control">
                                                    <% if (user.getGender() == Gender.MALE) { %>
                                                    <option value="MALE" selected>Male</option>
                                                    <option value="FEMALE">Female</option>
                                                    <% } else { %>
                                                    <option value="FEMALE" selected>Female</option>
                                                    <option value="MALE" >Male</option>
                                                    <% } %>
                                                </select>
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
                                                <select name="userStatus" class="form-control">
                                                    <% if (user.getUserStatus() == UserStatus.MANAGER) { %>
                                                    <option value="MANAGER" selected>Manager</option>
                                                    <option value="USER">User</option>
                                                    <% } else { %>
                                                    <option value="USER" selected>User</option>
                                                    <option value="MANAGER" >Manager</option>
                                                    <% } %>
                                                </select>
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
                                <a href="/getUserForUpdate?id=<%= user.getId() %>">
                                    <% if (!pattern.matcher(user.getProfPicUrl()).matches()) { %>
                                    <% if (user.getGender() == Gender.MALE) { %>
                                    <img class="img" src="/image?path=defMale.png" width="30px" alt="">
                                    <% } else if (user.getGender() == Gender.FEMALE) { %>
                                    <img class="img" src="/image?path=defFemale.png" width="30px" alt="">
                                    <% }
                                    } else { %>
                                    <img class="img" src="/image?path=<%= user.getProfPicUrl() %>" width="30px" alt="">
                                    <% } %>
                                </a>
                            </div>
                            <div class="card-body">
                                <form action="/managerUpdateUserProfPic" method="post" enctype="multipart/form-data">
                                    <input type="file" name="profilePic" id="updateProfilePic">
                                    <input type="hidden" name="id" value="<%= user.getId() %>">
                                    <label for="updateProfilePic" id="updateProfilePicLabel">
                                        <span class="material-icons" style="font-size: 19px">
                                            add_photo_alternate
                                        </span>
                                    </label><br>
                                    <button type="submit" class="btn btn-primary">
                                        Update Profile Picture</button>

                                </form>
                                <br>
                                <h6 class="card-category"><%= user.getUserStatus() %>
                                </h6>
                                <h4 class="card-title"><%= user.getName() %> <%= user.getSurname() %>
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
                <nav class="float-left">
                    <ul>
                        <li>
                            <a href="https://www.creative-tim.com">
                                Creative Tim
                            </a>
                        </li>
                        <li>
                            <a href="https://creative-tim.com/presentation">
                                About Us
                            </a>
                        </li>
                        <li>
                            <a href="http://blog.creative-tim.com">
                                Blog
                            </a>
                        </li>
                        <li>
                            <a href="https://www.creative-tim.com/license">
                                Licenses
                            </a>
                        </li>
                    </ul>
                </nav>
                <div class="copyright float-right" id="date">
                    , made with <i class="material-icons">favorite</i> by
                    <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a> for a better web.
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
