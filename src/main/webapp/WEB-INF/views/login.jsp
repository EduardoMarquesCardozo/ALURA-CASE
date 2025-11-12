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
            <div class="login-box">
                <h2>Already a student ?</h2>
                <p>Login and great class!</p>
                <button type="button" class="btn-login" id="showLogin">LOGIN</button>
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
    document.getElementById("showLogin").addEventListener("click", function() {
        const container = document.querySelector(".login-box");
        container.innerHTML = `
            <h2>Login</h2>
            <form action="/login" method="post" class="login-form">
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required />
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required />
                </div>
                <button type="submit" class="btn-login">Login</button>
            </form>
        `;
    });
</script>
