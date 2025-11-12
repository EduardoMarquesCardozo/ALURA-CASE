<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Registrations</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/assets/external-libs/bootstrap/css/bootstrap.min.css">
</head>
    <body class="p-4">
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1>Registration</h1>
                    <a class="btn btn-info new-button" href="/admin/registration/new">New registration</a>
                    <a class="btn btn-info new-button" href="/dashboard">Dashboard</a>
                </div>
                <table class="panel-body table table-hover">
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
                            <td>${registration.registrationDate}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
