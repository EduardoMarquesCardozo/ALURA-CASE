<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrations</title>
    <link rel="stylesheet" type="text/css" href="/assets/css/global.css">
</head>

<body>
<div class="container">
    <div class="card list-card">
        <div class="list-header">
            <h1>Registrations</h1>
            <div class="flex-basic">
                <a class="btn btn-small btn-blue" href="/dashboard">Dashboard</a>
                <a class="btn btn-small" href="/admin/registration/new">New Registration</a>
            </div>
        </div>

        <table class="list-table">
            <thead>
            <tr>
                <th>Student</th>
                <th>Course</th>
                <th>Date</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="registration" items="${registrations}">
                <tr>
                    <td>${registration.user.name}</td>
                    <td>${registration.course.name}</td>
                    <td>${registration.formattedDate}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
