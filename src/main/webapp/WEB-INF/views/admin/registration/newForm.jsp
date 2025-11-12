<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Register New Registration</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/assets/external-libs/bootstrap/css/bootstrap.min.css">
</head>

<body>
<div class="container">
    <section class="panel panel-primary vertical-space">
        <div class="panel-heading">
            <h1>Register New Course</h1>
        </div>

        <form:form modelAttribute="newRegistration" action="/admin/registration/new" method="post" class="mt-3">

            <div class="mb-3">
                <label class="form-label">Student</label>
                <form:select path="studentEmail" cssClass="form-select" required="true">
                    <form:option value="">Select a student</form:option>
                    <c:forEach var="student" items="${students}">
                        <form:option value="${student.email}">${student.name} (${student.email})</form:option>
                    </c:forEach>
                </form:select>
            </div>

            <div class="mb-3">
                <label class="form-label">Course</label>
                <form:select path="courseCode" cssClass="form-select" required="true">
                    <form:option value="">Select a course</form:option>
                    <c:forEach var="course" items="${courses}">
                        <form:option value="${course.code}">${course.name}</form:option>
                    </c:forEach>
                </form:select>
            </div>

            <button type="submit" class="btn btn-success">Register</button>
            <a href="/admin/registrations" class="btn btn-secondary">Back</a>

        </form:form>
    </section>
</div>
</body>
</html>
