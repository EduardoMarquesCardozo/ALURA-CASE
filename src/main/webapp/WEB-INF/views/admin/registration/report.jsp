<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Course Access Report</title>
    <link rel="stylesheet" type="text/css" href="/assets/css/global.css">
</head>

<body>
<div class="container">
    <div class="card list-card">
        <div class="list-header">
            <h1>Courses with Most Registrations</h1>
            <div class="flex-basic">
                <a class="btn btn-small btn-blue" href="/dashboard">Dashboard</a>
            </div>
        </div>
        <table class="list-table">
            <thead>
            <tr>
                <th>Course Name</th>
                <th>Code</th>
                <th>Instructor</th>
                <th>Instructor Email</th>
                <th>Total Registrations</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${report}">
                <tr>
                    <td>${item.courseName}</td>
                    <td>${item.courseCode}</td>
                    <td>${item.instructorName}</td>
                    <td>${item.instructorEmail}</td>
                    <td>${item.totalRegistrations}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
