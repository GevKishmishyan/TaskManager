<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js" type="text/javascript"></script>
</head>
<body>
    <div class="valod"></div>
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

        <div class="top-buttons">
            <button class="to-signup top-active-button">
                Sign Up
            </button>
            <button class="to-signin">
                Sign In
            </button>
        </div>

        <div class="form form-signup">
            <p style="color: gainsboro; text-align: center; font-size: 13px"><%= msg %>
            <form onSubmit="return validateBasicRegForm(event);" name='basicRegistration' action="/register" method="post"
                  enctype="multipart/form-data" autocomplete="off">
                <lable>NAME</lable>
                <input type="text" name="name" placeholder="Your name" required="required">
                <lable>SURNAME</lable>
                <input type="text" name="surname" placeholder="Your surname" required="required">
                <lable>E-MAIL</lable>
                <input type="email" name="email" placeholder="Your e-mail" required="required">
                <lable>PASSWORD</lable>
                <input type="password" name="password" placeholder="Your password" required="required">
                <lable>GENDER</lable>
                <select name="gender" required="required">
                    <option class="opt" disabled selected value>Choose your gender</option>
                    <option class="opt" value="MALE">Male</option>
                    <option class="opt" value="FEMALE">Female</option>
                </select>
                <lable>AGE</lable>
                <input type="number" name="age" placeholder="Your age" required="required">
                <input type="hidden" name="userStatus" value="USER">
                <lable>PROFILE IMAGE</lable>
                <input type="file" name="profilePic" placeholder="Your profile image">
                <input type="submit"
                       class="form-btn"
                       value="Sign Up"/>
                <a href="#" class="lined-link to-signin-link">I'm already member</a>
            </form>
        </div>

        <div class="form form-signin">
            <form onSubmit="return validateLoginForm(event);" name="loginForm" action="/login" method="post" autocomplete="off">
                <lable>E-MAIL</lable>
                <input type="email" name="email" placeholder="Your e-mail" required="required">
                <lable>PASSWORD</lable>
                <input type="password" name="password" placeholder="Your password" required="required">
                <input type="submit"
                       class="form-btn"
                       value="Sign In"/>
                <a href="#" class="lined-link to-signup-link">Create new account</a>
                <a href="/forgotPass" class="lined-link" style="margin-left: 20px">Forgot password?</a>
            </form>
        </div>
    </div>
    <div class="clear-fix"></div>
</div>

<script src="js/login.js" type="text/javascript"></script>
</body>
</html>
