<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="model.*" %>
<%@ page import="manager.CommentManager" %>
<%@ page import="java.util.ArrayList" %>
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
        .form-group option {
            font-size: 15px;
            font-weight: 200;
            background: transparent;
        }
    </style>
</head>
<body class="dark-edition">
<%
    Task task = (Task) request.getAttribute("taskById");
    User user = (User) session.getAttribute("user");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    List<Comment> commentsByTask = (List<Comment>) request.getAttribute("taskComment");
    CommentManager commentManager = new CommentManager();

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
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title"><%= task.getName() %>
                                </h4>
                                <p class="card-category"></p>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Assigned to</label>
                                            <p class="card-category"><%= task.getAssignedUser().getName() %>
                                                &nbsp; <%= task.getAssignedUser().getSurname() %>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Deadline</label>
                                            <p class="card-category"><%= sdf.format(task.getDeadline()) %>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Description</label>
                                            <p class="card-category"><%= task.getDescription() %>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <% if (user.getUserStatus() == UserStatus.USER) { %>
                                            <form action="/updateTaskStatus" method="post">
                                                <label class="bmd-label-floating" style="font-size: 14px;">Task
                                                    status</label>
                                                <input type="hidden" name="id" class="form-control"
                                                       value="<%= task.getId() %>">
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
                                                <button type="submit" class="btn btn-primary pull-right">Update Task
                                                    Status
                                                </button>
                                                <div class="clearfix"></div>
                                                <% } else { %>
                                                <label class="bmd-label-floating">Taskstatus</label>
                                                <p class="card-category"><%= task.getTaskStatus() %>
                                                        <% } %>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <% if (commentsByTask.size() == 0) { %>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <form action="/addComment" method="post" autocomplete="off">
                                    <div class="row">
                                        <div class="col-md-10">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Add your comment here</label>
                                                <input type="text" name="comment" class="form-control">
                                                <input type="hidden" name="hiddenId" value="<%= task.getId() %>"
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-primary pull-right">
                                                    Comment
                                                </button>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <% } else { %>
                <% for (Comment comment : commentsByTask) { %>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <div class="row">
                                    <div class="col-md-1">
                                        <img src="/image?path=<%= comment.getAuthor().getProfPicUrl() %>" width="30px"
                                             style="text-align: center">
                                    </div>
                                    <div class="col-md-7">
                                        <h4 class="card-title"><%= comment.getAuthor().getName() %>
                                            &nbsp; <%= comment.getAuthor().getSurname() %>
                                        </h4>
                                    </div>
                                    <div class="col-md-3">
                                        <p class="card-category"
                                           style="text-align: right"><%= sdf.format(comment.getCreatedDate()) %>
                                        </p>
                                    </div>
                                    <div class="col-md-1">
                                        <p class="card-category"
                                           style="text-align: right">
                                            <% if (comment.getAuthor().equals(user)) { %>
                                            <a style="text-decoration: none; color: #FFFFFF; margin-left: 10px"
                                               href="/deleteComment?id=<%= comment.getId() %>">&#x2715;</a>
                                            <% } %>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <p class="card-category"><%= comment.getText() %>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <% List<Comment> activeReplyesByCommentId = commentManager.getActiveReplyesByCommentId(comment.getId()); %>
                                <% if (activeReplyesByCommentId.size() == 0) { %>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <form action="/replyComment" method="post" autocomplete="off">
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <div class="form-group"></div>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Add your reply
                                                                    here</label>
                                                                <input type="text" name="reply" class="form-control">
                                                                <input type="hidden" name="hiddenCommentId"
                                                                       value="<%= comment.getId() %>"
                                                                       class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <button type="submit"
                                                                        class="btn btn-primary pull-right">
                                                                    Reply
                                                                </button>
                                                                <div class="clearfix"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <% } else { %>
                                <% for (Comment perComment : activeReplyesByCommentId) { %>
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group"></div>
                                    </div>
                                    <div class="col-md-10">
                                        <div class="card">
                                            <div class="card-header card-header-primary">
                                                <div class="row">
                                                    <div class="col-md-1">
                                                        <img src="/image?path=<%= perComment.getAuthor().getProfPicUrl() %>"
                                                             width="30px"
                                                             style="text-align: center">
                                                    </div>
                                                    <div class="col-md-7">
                                                        <h4 class="card-title"><%= perComment.getAuthor().getName() %>
                                                            &nbsp; <%= perComment.getAuthor().getSurname() %>
                                                        </h4>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <p class="card-category"
                                                           style="text-align: right"><%= sdf.format(perComment.getCreatedDate()) %>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-1">
                                                        <p class="card-category"
                                                           style="text-align: right">
                                                            <% if (perComment.getAuthor().equals(user)) { %>
                                                            <a style="text-decoration: none; color: #FFFFFF; margin-left: 10px"
                                                               href="/deleteComment?id=<%= perComment.getId() %>">&#x2715;</a>
                                                            <% } %>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <p class="card-category"><%= perComment.getText() %>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <% } %>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <form action="/replyComment" method="post" autocomplete="off">
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <div class="form-group"></div>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Add your reply
                                                                    here</label>
                                                                <input type="text" name="reply" class="form-control">
                                                                <input type="hidden" name="hiddenCommentId"
                                                                       value="<%= task.getId() %>"
                                                                       class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <button type="submit"
                                                                        class="btn btn-primary pull-right">
                                                                    Reply
                                                                </button>
                                                                <div class="clearfix"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <% }%>
                            </div>
                        </div>
                    </div>
                </div>
                <% }
                } %>
                <% if (commentsByTask.size() != 0) { %>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <form action="/addComment" method="post" autocomplete="off">
                                    <div class="row">
                                        <div class="col-md-10">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Add your comment here</label>
                                                <input type="text" name="comment" class="form-control">
                                                <input type="hidden" name="hiddenId" value="<%= task.getId() %>"
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-primary pull-right">
                                                    Comment
                                                </button>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
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



