$(document).ready(function () {
    $('.signup-slider').slick({
        dots: true,
        arrows: false,
        autoplay: true,
        autoplaySpeed: 2000
    });

    $("img").height($(".main-box").height());

    $(".to-signin").on("click", function () {
        $(this)
            .addClass("top-active-button")
            .siblings()
            .removeClass("top-active-button");
        $(".form-signup").slideUp(500);
        $(".form-signin").slideDown(500);
    });

    $(".to-signup").on("click", function () {
        $(this)
            .addClass("top-active-button")
            .siblings()
            .removeClass("top-active-button");
        $(".form-signin").slideUp(500);
        $(".form-signup").slideDown(500);
    });

    $(".to-signin-link").on("click", function () {
        $(".to-signin")
            .addClass("top-active-button")
            .siblings()
            .removeClass("top-active-button");
        $(".form-signup").slideUp(200);
        $(".form-signin").slideDown(200);
    });

    $(".to-signup-link").on("click", function () {
        $(".to-signup")
            .addClass("top-active-button")
            .siblings()
            .removeClass("top-active-button");
        $(".form-signin").slideUp(200);
        $(".form-signup").slideDown(200);
    });


    // basic regsiter validation


});

function validateBasicRegForm(event) {
    event.preventDefault();
    if (document.basicRegistration.name.value === "") {
        document.basicRegistration.name.style.borderBottomColor = "#c1000f";
        document.basicRegistration.name.focus();
        return false;
    } else if (document.basicRegistration.surname.value === "") {
        document.basicRegistration.surname.style.borderBottomColor = "#c1000f";
        document.basicRegistration.surname.focus();
        return false;
    } else if (document.basicRegistration.email.value === "") {
        document.basicRegistration.email.style.borderBottomColor = "#c1000f";
        document.basicRegistration.email.focus();
        return false;
    } else if (document.basicRegistration.password.value === "") {
        document.basicRegistration.password.style.borderBottomColor = "#c1000f";
        document.basicRegistration.password.focus();
        return false;
    } else if (document.basicRegistration.gender.value === "") {
        document.basicRegistration.gender.style.borderBottomColor = "#c1000f";
        document.basicRegistration.gender.focus();
        return false;
    } else if (document.basicRegistration.age.value === "") {
        document.basicRegistration.age.style.borderBottomColor = "#c1000f";
        document.basicRegistration.age.focus();
        return false;
    } else {
        document.basicRegistration.submit();
    }
}


function validateLoginForm(event) {
    event.preventDefault();
    if (document.loginForm.email.value === "") {
        document.loginForm.email.style.borderBottomColor = "#c1000f";
        document.loginForm.email.focus();
        return false;
    } else if (document.loginForm.password.value === "") {
        document.loginForm.password.style.borderBottomColor = "#c1000f";
        document.loginForm.password.focus();
        return false;
    } else {
        document.loginForm.submit();
    }
}

function validatePassChangeForm(event) {
    event.preventDefault();
    if (document.changePassForm.email.value === "") {
        document.changePassForm.email.style.borderBottomColor = "#c1000f";
        document.changePassForm.email.focus();
        return false;
    } else {
        document.changePassForm.submit();
    }
}



