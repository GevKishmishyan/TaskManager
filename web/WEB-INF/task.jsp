<%@ page import="model.Task" %>
<%@ page import="model.User" %>
<%@ page import="model.UserStatus" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Comment" %>
<%@ page import="manager.CommentManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/scrolbar.less">
</head>
<body>
    <% Task task = (Task) request.getAttribute("taskById"); %>
    <% User user = (User) session.getAttribute("user"); %>
    <%  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); %>
    <% List<Comment> commentsByTask = (List<Comment>) request.getAttribute("taskComment"); %>
    <% CommentManager commentManager = new CommentManager(); %>
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
    <div class="specificTask">
            <h1 class="borderWhite" style="text-align: left; margin: 0"><%= task.getName() %></h1>
            <p class="borderWhite treeLike" style=" width: 31%; padding-left: 10px;  margin: 17.5px 1% 0 1%; float: left; text-align: left"><%= task.getTaskStatus() %></p>
            <p class="borderWhite treeLike" style="width: 31.5%; margin: 17.5px 1% 0 1%; float: left; text-align: center; margin-top: 17.5px"><%= task.getAssignedUser().getName() %> <%= task.getAssignedUser().getSurname() %></p>
            <p class="borderWhite treeLike" style="width: 31.5%; padding-right: 10px; margin: 17.5px 1% 0 1%; float: left; text-align: right; margin-top: 17.5px"><%= sdf.format(task.getDeadline()) %></p>
    <br>
    <br>
    <hr>
        <p style="text-align: left; margin-left: 30px"><%= task.getDescription() %></p>
        <hr style="margin-bottom: 20px;">
        <% if (commentsByTask == null) { %>
            <form action="/addComment" method="post">
                <input type="hidden" value="<%= task.getId() %>" name="hiddenId">
                <input class="inp" style="width: 78%; float:left;" type="text" name="comment" placeholder="Write your comment." required="required"/>
                <button style="width: 20%; margin-left: 2%; float: left;" type="submit" class="btn btn-primary btn-block btn-large">
                    Comment.
                </button>
            </form>
        <% } else { %>
        <div class="comments">
            <% for (Comment comment : commentsByTask) { %>
                <div class="commentBox">
                    <span class="bottomBorder" style="float:left;"><%= comment.getAuthor().getName() %> <%= comment.getAuthor().getSurname() %></span>
                    <span class="" style="float:right;;">
                        <%= sdf.format(comment.getCreatedDate()) %>
                        <% if (comment.getAuthor().equals(user)) { %>
                        <a style="text-decoration: none; color: #FFFFFF; margin-left: 10px"
                           href="/deleteComment?id=<%= comment.getId() %>">&#x2715;</a>
                        <% } %>
                    </span><br>
                    <p><%= comment.getText() %></p>
                    <hr style="width: 95%">
                    <div class="replyes">
                        <% List<Comment> activeReplyesByCommentId = commentManager.getActiveReplyesByCommentId(comment.getId()); %>
                        <% if (activeReplyesByCommentId != null) { %>
                        <% for (Comment perComment : activeReplyesByCommentId) { %>
                        <div class="replyBox">
                            <span class="bottomBorder" style="float:left;"><%= perComment.getAuthor().getName() %> <%= perComment.getAuthor().getSurname() %></span>
                            <span class="" style="float:right;;">
                                <%= sdf.format(perComment.getCreatedDate()) %>
                                <% if (perComment.getAuthor().equals(user)) { %>
                                <a style="text-decoration: none; color: #FFFFFF; margin-left: 10px"
                                   href="/deleteComment?id=<%= perComment.getId() %>">&#x2715;</a>
                                <% } %>
                            </span><br>
                            <p><%= perComment.getText() %></p>
                        </div>
                        <% }
                        } %>
                        <form action="/replyComment" method="post">
                            <input type="hidden" value="<%= comment.getId() %>" name="hiddenCommentId">
                            <input class="inp" style="width: 78%; float:left;" type="text" name="reply" placeholder="Write your reply.." required="required"/>
                            <button style="width: 20%; margin-left: 2%; float: left;" type="submit" class="btn btn-primary btn-block btn-large">
                                Reply.
                            </button>
                        </form>
                    </div>
                </div>
            <% } %>
        </div>
            <form action="/addComment" method="post" style="margin-top: 20px">
                <input type="hidden" value="<%= task.getId() %>" name="hiddenId">
                <input class="inp" style="width: 78%; float:left;" type="text" name="comment" placeholder="Write your comment." required="required"/>
                <button style="width: 20%; margin-left: 2%; float: left;" type="submit" class="btn btn-primary btn-block btn-large">
                    Comment.
                </button>
            </form>
        <% } %>



    </div>
</div>
</body>
</html>
