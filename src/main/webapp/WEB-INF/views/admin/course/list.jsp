<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Courses List</title>
    <link rel="stylesheet" type="text/css" href="/assets/css/global.css">
</head>

<body>
    <div class="container">
        <div class="card list-card">
            <div class="list-header">
                <h1>Courses</h1>
                <div class="flex-basic">
                    <a class="btn btn-small btn-blue" href="/dashboard">Dashboard</a>
                    <a class="btn btn-small" href="/admin/course/new">New Course</a>
                </div>
            </div>

            <table class="list-table">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Code</th>
                    <th>Category</th>
                    <th>Instructor</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${courses}" var="course">
                    <tr>
                        <td>${course.name}</td>
                        <td>${course.code}</td>
                        <td>${course.categoryName}</td>
                        <td>${course.instructorEmail}</td>
                        <td>
                            <span class="${course.status == 'ACTIVE' ? 'status-active' : 'status-inactive'}">
                                    ${course.status}
                            </span>
                        </td>
                        <td style="display: flex; gap: 0.5rem;">
                            <c:choose>
                                <c:when test="${course.status == 'ACTIVE'}">
                                    <a class="btn btn-small btn-danger" href="/admin/course/${course.code}/status">Deactivate</a>
                                </c:when>
                                <c:otherwise>
                                    <a class="btn btn-small" href="/admin/course/${course.code}/status">Activate</a>
                                </c:otherwise>
                            </c:choose>
                            <a href="/admin/course/${course.code}/edit" class="btn btn-small btn-edit">Edit</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
