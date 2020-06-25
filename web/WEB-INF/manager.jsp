<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
    List<User> users = (List<User>) request.getAttribute("users");
    List<Task> tasks = (List<Task>) request.getAttribute("tasks");
    List<Notification> nots = (List<Notification>) request.getAttribute("allNots");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

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

<div class="main">
    <h1><%= user.getName() %> <%= user.getSurname() %>
    </h1>
    <div class="top">
        <div class="search">
            <form action="/managerSearch" method="post" style="margin-left: 28%">
                <input class="inp" style="width: 39%;  float:left;" type="search" name="search" placeholder="Search"
                       required="required"/>
                <button style="width: 20%; margin-left: 2%; float: left;" type="submit"
                        class="btn btn-primary btn-block btn-large">
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
        <div class="logout">
            <a href="/logout" style="text-decoration: none">
                <button style="width: 40%; margin: auto;" type="submit" class="btn btn-primary btn-block btn-large">
                    Log out.
                </button>
            </a>
        </div>
    </div>
    <div class="users" style="width: 50%">
        <div class="addUser">
            <h1>Create new user.</h1>
            <p style="color: gainsboro; text-align: center; font-size: 13px"><%= userRegMsg %>
            </p>
            <form action="/register" method="post" enctype="multipart/form-data">
                <input class="inp" type="text" name="name" placeholder="Name" required="required"/>
                <input class="inp" type="text" name="surname" placeholder="Surname" required="required"/>
                <input class="inp" type="email" name="email" placeholder="E-mail" required="required"/>
                <input class="inp" type="password" name="password" placeholder="Password" required="required"/>
                <input class="choice" type="radio" name="gender" value="MALE" required="required"> <span class="txt">Male</span>
                <input class="choice" type="radio" name="gender" value="FEMALE" required="required"> <span class="txt">Female</span><br>
                <input class="inp" type="number" name="age" placeholder="Age" required="required"/>
                <input class="choice" type="radio" name="userStatus" value="USER"> <span
                    class="txt" required="required">User</span>
                <input class="choice" type="radio" name="userStatus" value="MANAGER"> <span
                    class="txt" required="required">Manager</span><br>
                <input class="inp" type="file" name="profilePic"/>
                <button type="submit" class="btn btn-primary btn-block btn-large">Create.</button>
            </form>
        </div>
    </div>
    <div class="tasks" style="width: 50%">
        <div class="addTask">
            <h1>Create new task.</h1>
            <p style="color: gainsboro; text-align: center; font-size: 13px"><%= taskCreateMsg %>
            </p>
            <form action="/addTask" method="post">
                <input class="inp" type="text" name="name" placeholder="Name" required="required"/>
                <textarea class="inp" style="height: 40px" name="description" placeholder="Description"
                          required="required"
                ></textarea>
                <select class="inp" name="assignedUser" required="required">
                    <option disabled selected value>Assign to user</option>
                    <%
                        for (User perUser : users) {
                            if (perUser.getUserStatus() == UserStatus.USER) {
                    %>
                    <option value="<%= perUser.getEmail() %>"><%= perUser.getEmail() %>
                    </option>
                    <% }
                    } %>
                </select>
                <input class="choice" type="radio" name="taskStatus" value="TODO" required="required"> <span
                    class="txt">To do</span>
                <input class="choice" type="radio" name="taskStatus" value="IN_PROGRESS" required="required"> <span
                    class="txt">In Progress</span>
                <input class="choice" type="radio" name="taskStatus" value="FINISHED" required="required"> <span
                    class="txt">Finished</span><br>
                <input class="inp" type="datetime-local" name="deadline" placeholder="Deadline" required="required"/>
                <button type="submit" class="btn btn-primary btn-block btn-large">Create.</button>
            </form>
        </div>
    </div>
    <div class="allUsers">
        <h1>Notifications.</h1>
        <% for (Notification not : nots) { %>
        <% if (not.getAuthor().getUserStatus() != UserStatus.MANAGER) { %>
        <p style="color: gainsboro; text-align: center; font-size: 13px">
            <b><%= not.getAuthor().getName() %> <%= not.getAuthor().getSurname() %>
            </b>
            <% if (not.getNotType() == NotType.COMMENT) { %>
            added new comment on task:
            <% } else if (not.getNotType() == NotType.REPLY) { %>
            replyed to comment on task:
            <% } %>
            <b><%= not.getTask().getName() %>
            </b>
            <a href="/seenNot?id=<%= not.getId() %>"
               style="color: gainsboro; text-align: center; font-size: 13px">seen.</a>
        </p>
        <% } %>
        <% } %>
    </div>
    <div class="allUsers">
        <h1>All users list.</h1>
        <table>
            <thead>
            <tr>
                <th scope="col" width="5%">Id</th>
                <th scope="col" width="6%">Photo</th>
                <th scope="col" width="12%">Name</th>
                <th scope="col" width="12%">Surname</th>
                <th scope="col" width="20%">Email</th>
                <th scope="col" width="10%">Gender</th>
                <th scope="col" width="5%">Age</th>
                <th scope="col" width="10%">User Status</th>
                <th scope="col" width="10%">Update</th>
                <th scope="col" width="10%">Delete</th>
            </tr>
            </thead>
            <tbody>
            <% for (User perUser : users) { %>
            <tr>
                <td data-label="Id"><%= perUser.getId() %>
                </td>
                <td data-label="Profile Picture">
                    <img src="/image?path=<%= perUser.getProfPicUrl() %>" width="30px" alt="">
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
                    <a href="/getUserForUpdate?id=<%= perUser.getId() %>" style="text-decoration: none">
                        <button type="submit" class="edit btn btn-primary btn-block btn-large"
                                style="width: 70%; margin: auto">
                            Update.
                        </button>
                    </a>
                </td>
                <td data-label="Delete">
                    <a href="/deleteUser?id=<%= perUser.getId() %>" style="text-decoration: none">
                        <button type="submit" class="delete btn btn-primary btn-block btn-large"
                                style="width: 70%; margin: auto">
                            Delete.
                        </button>
                    </a>
                </td>
            </tr>
            <% } %>

            </tbody>
        </table>
    </div>
    <div class="allUsers">
        <h1>All tasks list.</h1>
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
            <% for (Task perTask : tasks) { %>
            <tr>
                <td data-label="Id"><%= perTask.getId() %>
                </td>
                <td data-label="Name" class="taskHover">
                    <a href="/getTaskById?id=<%= perTask.getId() %>"
                       style="text-decoration: none; color: black"><%= perTask.getName() %>
                    </a>
                </td>
                <td data-label="Description" style="font-size: 11px"><%= perTask.getDescription() %>
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
                        <button type="submit" class="edit btn btn-primary btn-block btn-large"
                                style="width: 70%; margin: auto">
                            Update.
                        </button>
                    </a>
                </td>
                <td data-label="Delete">
                    <a href="/deleteTask?id=<%= perTask.getId() %>" style="text-decoration: none">
                        <button type="submit" class="delete btn btn-primary btn-block btn-large"
                                style="width: 70%; margin: auto">
                            Delete.
                        </button>
                    </a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
