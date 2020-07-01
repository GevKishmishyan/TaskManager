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
<body class="dark-edition">
<%
    User user = (User) session.getAttribute("user");
    List<User> users = (List<User>) request.getAttribute("users");
    List<Notification> nots = (List<Notification>) request.getAttribute("allNots");
    List<Notification> userNots = new ArrayList<>();
    for (Notification not : nots) {
        if (!not.getAuthor().equals(user)){
            userNots.add(not);
        }
    }
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
                        <div class="card card-plain">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title mt-0"> Users List</h4>
                                <p class="card-category"> Here is a list of our employees</p>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead class="">
                                        <th>

                                        </th>
                                        <th>
                                            ID
                                        </th>
                                        <th>
                                            Name
                                        </th>
                                        <th>
                                            Surname
                                        </th>
                                        <th>
                                            E-Mail
                                        </th>
                                        <th>
                                            Gender
                                        </th>
                                        <th>
                                            Age
                                        </th>
                                        <th>
                                            Status
                                        </th>
                                        <th>
                                            Update
                                        </th>
                                        <th>
                                            Delete
                                        </th>
                                        </thead>
                                        <tbody>

                                        <% for (User perUser : users) { %>
                                        <tr>
                                            <td data-label="Profile Picture">
                                                <% if (!pattern.matcher(perUser.getProfPicUrl()).matches()) { %>
                                                <% if (perUser.getGender() == Gender.MALE) { %>
                                                <img src="/image?path=defMale.png" width="30px" alt="">
                                                <% } else if (perUser.getGender() == Gender.FEMALE) { %>
                                                <img src="/image?path=defFemale.png" width="30px" alt="">
                                                <% }
                                                } else { %>
                                                <img src="/image?path=<%= perUser.getProfPicUrl() %>" width="30px"
                                                     alt="">
                                                <% } %>
                                            </td>
                                            <td data-label="Id"><%= perUser.getId() %>
                                            </td>
                                            <td data-label="Name"><%= perUser.getName() %>
                                            </td>
                                            <td data-label="Surname"><%= perUser.getSurname() %>
                                            </td>
                                            <td data-label="Email"><%= perUser.getEmail() %>
                                            </td>
                                            <td data-label="Gender"><%= perUser.getGender() %>
                                            </td>
                                            <td data-label="Age"><%= perUser.getAge() %>
                                            </td>
                                            <td data-label="User Status"><%= perUser.getUserStatus() %>
                                            </td>
                                            <td data-label="Edit">
                                                <a href="/getUserForUpdate?id=<%= perUser.getId() %>"
                                                   style="text-decoration: none">
                                                    <button type="submit" class="btn btn-primary "
                                                    style="background-color: #298c18">Update</button>
                                                </a>
                                            </td>
                                            <td data-label="Delete">
                                                <a href="/deleteUser?id=<%= perUser.getId() %>"
                                                   style="text-decoration: none">
                                                    <button type="submit" class="btn btn-primary"
                                                    style="background-color: #ba282d">Delete</button>
                                                </a>
                                            </td>
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
<div class="fixed-plugin">
    <div class="dropdown show-dropdown">
        <a href="#" data-toggle="dropdown">
            <i class="fa fa-cog fa-2x"> </i>
        </a>
        <ul class="dropdown-menu">
            <li class="header-title"> Sidebar Filters</li>
            <li class="adjustments-line">
                <a href="javascript:void(0)" class="switch-trigger active-color">
                    <div class="badge-colors ml-auto mr-auto">
                        <span class="badge filter badge-purple active" data-color="purple"></span>
                        <span class="badge filter badge-azure" data-color="azure"></span>
                        <span class="badge filter badge-green" data-color="green"></span>
                        <span class="badge filter badge-warning" data-color="orange"></span>
                        <span class="badge filter badge-danger" data-color="danger"></span>
                    </div>
                    <div class="clearfix"></div>
                </a>
            </li>
            <li class="header-title">Images</li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../assets/img/sidebar-1.jpg" alt="">
                </a>
            </li>
            <li class="active">
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../assets/img/sidebar-2.jpg" alt="">
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../assets/img/sidebar-3.jpg" alt="">
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../assets/img/sidebar-4.jpg" alt="">
                </a>
            </li>

            <li class="header-title">Thank you for choosing us!</li>
            <li class="button-container text-center">
                <button id="twitter" class="btn btn-round btn-twitter"><i class="fa fa-twitter"></i> &middot; 45</button>
                <button id="facebook" class="btn btn-round btn-facebook"><i class="fa fa-facebook-f"></i> &middot; 50</button>
                <br>
                <br>
            </li>
        </ul>
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
