<%--<%@ page import="model.Task" %>--%>
<%--<%@ page import="model.User" %>--%>
<%--<%@ page import="model.UserStatus" %>--%>
<%--<%@ page import="java.text.SimpleDateFormat" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="model.Comment" %>--%>
<%--<%@ page import="manager.CommentManager" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--    <link rel="stylesheet" type="text/css" href="../css/style.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="../css/scrolbar.less">--%>
<%--</head>--%>
<%--<body>--%>
<%--    <% Task task = (Task) request.getAttribute("taskById"); %>--%>
<%--    <% User user = (User) session.getAttribute("user"); %>--%>
<%--    <%  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); %>--%>
<%--    <% List<Comment> commentsByTask = (List<Comment>) request.getAttribute("taskComment"); %>--%>
<%--    <% CommentManager commentManager = new CommentManager(); %>--%>
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
<%--    <div class="specificTask">--%>
<%--            <h1 class="borderWhite" style="text-align: left; margin: 0"><%= task.getName() %></h1>--%>
<%--            <p class="borderWhite treeLike" style=" width: 31%; padding-left: 10px;  margin: 17.5px 1% 0 1%; float: left; text-align: left"><%= task.getTaskStatus() %></p>--%>
<%--            <p class="borderWhite treeLike" style="width: 31.5%; margin: 17.5px 1% 0 1%; float: left; text-align: center; margin-top: 17.5px"><%= task.getAssignedUser().getName() %> <%= task.getAssignedUser().getSurname() %></p>--%>
<%--            <p class="borderWhite treeLike" style="width: 31.5%; padding-right: 10px; margin: 17.5px 1% 0 1%; float: left; text-align: right; margin-top: 17.5px"><%= sdf.format(task.getDeadline()) %></p>--%>
<%--    <br>--%>
<%--    <br>--%>
<%--    <hr>--%>
<%--        <p style="text-align: left; margin-left: 30px"><%= task.getDescription() %></p>--%>
<%--        <hr style="margin-bottom: 20px;">--%>
<%--        <% if (commentsByTask == null) { %>--%>
<%--            <form action="/addComment" method="post">--%>
<%--                <input type="hidden" value="<%= task.getId() %>" name="hiddenId">--%>
<%--                <input class="inp" style="width: 78%; float:left;" type="text" name="comment" placeholder="Write your comment." required="required"/>--%>
<%--                <button style="width: 20%; margin-left: 2%; float: left;" type="submit" class="btn btn-primary btn-block btn-large">--%>
<%--                    Comment.--%>
<%--                </button>--%>
<%--            </form>--%>
<%--        <% } else { %>--%>
<%--        <div class="comments">--%>
<%--            <% for (Comment comment : commentsByTask) { %>--%>
<%--                <div class="commentBox">--%>
<%--                    <span class="bottomBorder" style="float:left;"><%= comment.getAuthor().getName() %> <%= comment.getAuthor().getSurname() %></span>--%>
<%--                    <span class="" style="float:right;;">--%>
<%--                        <%= sdf.format(comment.getCreatedDate()) %>--%>
<%--                        <% if (comment.getAuthor().equals(user)) { %>--%>
<%--                        <a style="text-decoration: none; color: #FFFFFF; margin-left: 10px"--%>
<%--                           href="/deleteComment?id=<%= comment.getId() %>">&#x2715;</a>--%>
<%--                        <% } %>--%>
<%--                    </span><br>--%>
<%--                    <p><%= comment.getText() %></p>--%>
<%--                    <hr style="width: 95%">--%>
<%--                    <div class="replyes">--%>
<%--                        <% List<Comment> activeReplyesByCommentId = commentManager.getActiveReplyesByCommentId(comment.getId()); %>--%>
<%--                        <% if (activeReplyesByCommentId != null) { %>--%>
<%--                        <% for (Comment perComment : activeReplyesByCommentId) { %>--%>
<%--                        <div class="replyBox">--%>
<%--                            <span class="bottomBorder" style="float:left;"><%= perComment.getAuthor().getName() %> <%= perComment.getAuthor().getSurname() %></span>--%>
<%--                            <span class="" style="float:right;;">--%>
<%--                                <%= sdf.format(perComment.getCreatedDate()) %>--%>
<%--                                <% if (perComment.getAuthor().equals(user)) { %>--%>
<%--                                <a style="text-decoration: none; color: #FFFFFF; margin-left: 10px"--%>
<%--                                   href="/deleteComment?id=<%= perComment.getId() %>">&#x2715;</a>--%>
<%--                                <% } %>--%>
<%--                            </span><br>--%>
<%--                            <p><%= perComment.getText() %></p>--%>
<%--                        </div>--%>
<%--                        <% }--%>
<%--                        } %>--%>
<%--                        <form action="/replyComment" method="post">--%>
<%--                            <input type="hidden" value="<%= comment.getId() %>" name="hiddenCommentId">--%>
<%--                            <input class="inp" style="width: 78%; float:left;" type="text" name="reply" placeholder="Write your reply.." required="required"/>--%>
<%--                            <button style="width: 20%; margin-left: 2%; float: left;" type="submit" class="btn btn-primary btn-block btn-large">--%>
<%--                                Reply.--%>
<%--                            </button>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            <% } %>--%>
<%--        </div>--%>
<%--            <form action="/addComment" method="post" style="margin-top: 20px">--%>
<%--                <input type="hidden" value="<%= task.getId() %>" name="hiddenId">--%>
<%--                <input class="inp" style="width: 78%; float:left;" type="text" name="comment" placeholder="Write your comment." required="required"/>--%>
<%--                <button style="width: 20%; margin-left: 2%; float: left;" type="submit" class="btn btn-primary btn-block btn-large">--%>
<%--                    Comment.--%>
<%--                </button>--%>
<%--            </form>--%>
<%--        <% } %>--%>


<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="model.*" %>
<%@ page import="manager.CommentManager" %><%--
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
        .form-group option {
            font-size: 15px;
            font-weight: 200;
            background: transparent;
        }
    </style>
</head>
<body>

<%
    User sessionUser = (User) session.getAttribute("user");
    String regex = "([^\\s]+(\\.(?i)(jpe?g|png|gif|bmp))$)";
    Pattern pattern = Pattern.compile(regex);

    Task task = (Task) request.getAttribute("taskById");
    User user = (User) session.getAttribute("user");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    List<Comment> commentsByTask = (List<Comment>) request.getAttribute("taskComment");
    CommentManager commentManager = new CommentManager();
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



