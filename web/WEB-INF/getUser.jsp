<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="../css/login.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js" type="text/javascript"></script>
</head>
<body>

<%
    String msg = "";
    if (session.getAttribute("message") != null) {
        msg = (String) session.getAttribute("message");
    }
    session.removeAttribute("message");
%>

<div class="main-box">
    <div class="slider-cont">
        <div class="signup-slider">
            <div class="img-txt">
                <div class="img-layer"></div>
                <h1>The hardest part of starting up is starting out for you.</h1>
                <img src="https://static.pexels.com/photos/33972/pexels-photo.jpg"/>
            </div>
            <div class="img-txt">
                <div class="img-layer"></div>
                <h1>We understand you and your business, We have the right solutions for you.</h1>
                <img src="https://static.pexels.com/photos/257897/pexels-photo-257897.jpeg"/>
            </div>
            <div class="img-txt">
                <div class="img-layer"></div>
                <h1>Join US Now!</h1>
                <img src="https://static.pexels.com/photos/317383/pexels-photo-317383.jpeg"/>
            </div>
        </div>
    </div>


    <div class="form-cont">
        <div class="form form-signup" id="form-forgot-pass">
            <h3>Forgot password</h3>
            <p style="color: gainsboro; text-align: center; font-size: 13px; margin: 30px 0 10px 0"><%= msg %>
            <form action="/getUser" method="post" autocomplete="off">
                <lable>E-MAIL</lable>
                <input type="email" name="email" placeholder="Your e-mail" required="required">
                <input type="submit"
                       class="form-btn"
                       value="Next"/>
            </form>
        </div>
    </div>
    <div class="clear-fix"></div>
</div>

<script src="../js/login.js" type="text/javascript"></script>

</body>
</html>
