<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>

<%
    String msg = "";
    if (session.getAttribute("message") != null) {
        msg = (String) session.getAttribute("message");
    }
    session.removeAttribute("message");
%>

<div class="login">
    <img src="../img/icon.png" alt="icon" id="icon">
    <h1 style="font-size: 24px">Input your email</h1>
    <p style="color: gainsboro; text-align: center; font-size: 13px"><%= msg %></p>
    <form action="/getUser" method="post">
        <input class="inp" type="email" name="email" placeholder="E-mail" required="required"/>
        <button type="submit" class="btn btn-primary btn-block btn-large">Next.</button>
    </form>
</div>

</body>
</html>
