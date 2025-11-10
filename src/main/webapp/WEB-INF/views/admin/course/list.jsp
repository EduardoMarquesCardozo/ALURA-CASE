<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Courses list</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/assets/external-libs/bootstrap/css/bootstrap.min.css">
</head>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h1>Courses</h1>
            <a class="btn btn-info new-button" href="/admin/course/new">Register new</a>
            <a class="btn btn-info new-button" href="/dashboard">Dashboard</a>
        </div>
        <table class="panel-body table table-hover">
            <thead>
            <tr>
                <th>Name</th>
                <th>Code</th>
                <th>Category</th>
                <th>Instructor</th>
                <th></th>
                <th></th>
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
                        <c:choose>
                            <c:when test="${course.status == 'ACTIVE'}">
                                <a class="btn btn-warning" href="/admin/course/${course.code}/status">Deactivate</a>
                            </c:when>
                            <c:otherwise>
                                <a class="btn btn-success" href="/admin/course/${course.code}/status">Activate</a>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a href="/admin/course/${course.code}/edit" class="btn btn-sm btn-primary">Edit</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>