<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Course Access Report</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/assets/external-libs/bootstrap/css/bootstrap.min.css">
</head>

<body>
<div class="container mt-4">
    <h1>Courses with Most Registrations</h1>
    <table class="table table-striped mt-3">
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

    <a href="/dashboard" class="btn btn-secondary mt-3">Back</a>
</div>
</body>
</html>