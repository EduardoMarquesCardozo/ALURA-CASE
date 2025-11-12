<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="/assets/css/global.css">
</head>
    <body>
        <div class="container">
            <div class="card">
                <h1>Dashboard</h1>
                <p class="subtitle">
                    Welcome, choose a module!
                </p>

                <div class="buttons">
                    <a href="/admin/courses" class="btn">Courses</a>
                    <a href="/admin/categories" class="btn">Categories</a>
                    <a href="/admin/registrations" class="btn">Registrations</a>
                    <a href="/admin/reports" class="btn">Reports</a>
                </div>
            </div>
        </div>
    </body>
</html>