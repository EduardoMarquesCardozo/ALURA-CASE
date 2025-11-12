<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="/assets/css/global.css">
    <link rel="stylesheet" type="text/css" href="/assets/css/login.css">
</head>
    <body class="login-page">
        <div class="container">
            <div id="loginIntro" class="login-box" style="${not empty error ? 'display: none;' : ''}">
                <h2>Already a student ?</h2>
                <p>Login and great class!</p>
                <button type="button" class="btn-login" id="showLogin">LOGIN</button>
            </div>

            <div id="loginForm" class="login-box card form-card" style="${not empty error ? '' : 'display: none;'}">
                <h1>Login</h1>
                <p class="subtitle">Enter your credentials to access your account.</p>


                <form action="/login" method="post" class="form">
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input class="input" type="email" id="email" name="email" required />
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input class="input" type="password" id="password" name="password" required />
                    </div>
                    <div class="buttons">
                        <input type="submit" value="Login" class="btn" id="submitBtn" disabled />
                    </div>
                </form>
            </div>

            <div class="courses">
                <h2>Don't study with us yet?</h2>
                <p>There are more than a thousand courses in the following fields:</p>

                <div class="grid">
                    <c:forEach var="item" items="${categoryCourses}">
                        <div class="card">
                            <h3 style="color:${item.category.color};">
                                School_ ${item.category.name}
                            </h3>
                            <p>
                                <c:forEach var="course" items="${item.courses}" varStatus="loop">
                                    ${course.name}<c:if test="${!loop.last}">, </c:if>
                                </c:forEach>
                            </p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
</html>
<script>
    const showBtn = document.getElementById("showLogin");
    if (showBtn) {
        showBtn.addEventListener("click", function() {
            const intro = document.getElementById("loginIntro");
            const formBox = document.getElementById("loginForm");
            if (intro) intro.style.display = "none";
            if (formBox) formBox.style.display = "block";
            const emailInput = document.getElementById("email");
            if (emailInput) emailInput.focus();
            validateForm();
        });
    }

    function validateForm() {
        const form = document.querySelector('.form');
        const submitBtn = document.getElementById('submitBtn');
        const requiredFields = form ? form.querySelectorAll('[required]') : [];
        let allFilled = true;
        requiredFields.forEach(field => {
            if (!field.value || field.value.trim() === '') {
                allFilled = false;
            }
        });
        if (submitBtn) submitBtn.disabled = !allFilled;
    }

    document.addEventListener('input', function(e) {
        if (e.target && e.target.closest && e.target.closest('.form')) {
            validateForm();
        }
    });

    window.addEventListener('DOMContentLoaded', function() {
        const formBox = document.getElementById('loginForm');
        if (formBox && getComputedStyle(formBox).display !== 'none') {
            const emailInput = document.getElementById('email');
            if (emailInput) emailInput.focus();
            validateForm();
        }
    });
</script>
