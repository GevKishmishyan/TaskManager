<%@ page import="model.User" %>
<%@ page import="model.UserStatus" %>
<%@ page import="model.Gender" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
    <% User user = (User) request.getAttribute("user"); %>

    <div class="login">
        <h1>Update user info.</h1>
        <form action="/updateUser" method="post">
            <input class="inp" type="number" name="id" placeholder="Id" required="required" readonly value="<%= user.getId() %>"/>
            <input class="inp" type="text" name="name" placeholder="Name" required="required" value="<%= user.getName() %>"/>
            <input class="inp" type="text" name="surname" placeholder="Surname" required="required" value="<%= user.getSurname() %>"/>
            <input class="inp" type="email" name="email" placeholder="E-mail" required="required" value="<%= user.getEmail() %>"/>
            <input class="inp" type="password" name="password" placeholder="Password" required="required" value="<%= user.getPassword() %>"/>
            <% if (user.getGender() == Gender.MALE) { %>
            <input class="choice" type="radio" name="gender" value="MALE" checked> <span class="txt">Male</span>
            <input class="choice" type="radio" name="gender" value="FEMALE"> <span class="txt">Female</span><br>
            <% } else if (user.getGender() == Gender.FEMALE) { %>
            <input class="choice" type="radio" name="gender" value="MALE"> <span class="txt" >Male</span>
            <input class="choice" type="radio" name="gender" value="FEMALE" checked> <span class="txt">Female</span><br>
            <% } %>
            <input class="inp" type="number" name="age" placeholder="Age" required="required" value="<%= user.getAge() %>"/>
            <% if (user.getUserStatus() == UserStatus.USER) { %>
            <input class="choice" type="radio" name="userStatus" value="USER" checked> <span class="txt">User</span>
            <input class="choice" type="radio" name="userStatus" value="MANAGER"> <span class="txt">Manager</span><br>
            <% } else if (user.getUserStatus() == UserStatus.MANAGER) { %>
            <input class="choice" type="radio" name="userStatus" value="USER" > <span class="txt">User</span>
            <input class="choice" type="radio" name="userStatus" value="MANAGER" checked> <span class="txt">Manager</span><br>
            <% } %>
            <button type="submit" class="btn btn-primary btn-block btn-large">Update.</button>
        </form>

        <div class="home" style="width: 100%;">
            <a href="/managerHome" style="text-decoration: none">
                <button style="width: 60%; margin: auto;" type="submit" class="btn btn-primary btn-block btn-large">
                    Home page.
                </button>
            </a>
        </div>
    </div>
</body>
</html>
