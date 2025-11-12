<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Change Course Status</title>
    <link rel="stylesheet" type="text/css" href="/assets/css/global.css">
</head>

<body>
<div class="container">
    <div class="card form-card">
        <h1>Change Course Status</h1>
        <p class="subtitle">Do you really wish to change the status of this course?</p>

        <form:form method="post" action="/admin/course/${course.code}/inactive">
            <div class="buttons">
                <input type="submit" class="btn btn-danger" value="Change" />
                <a href="/admin/courses" class="btn btn-small">Cancel</a>
            </div>
        </form:form>
    </div>
</div>
</body>
</html>
