<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>New Registration</title>
    <link rel="stylesheet" type="text/css" href="/assets/css/global.css">
</head>

<body>
<div class="container">
    <div class="card form-card">
        <h1>New Registration</h1>

        <form:form modelAttribute="newRegistration" action="/admin/registration/new" method="post" cssClass="form">

            <div class="form-group">
                <label for="student-select">Student</label>
                <form:select path="studentEmail" id="student-select" cssClass="input" required="true">
                    <form:option value="">Select a student</form:option>
                    <c:forEach var="student" items="${students}">
                        <form:option value="${student.email}">
                            ${student.name} (${student.email})
                        </form:option>
                    </c:forEach>
                </form:select>
            </div>

            <div class="form-group">
                <label for="course-select">Course</label>
                <form:select path="courseCode" id="course-select" cssClass="input" required="true">
                    <form:option value="">Select a course</form:option>
                    <c:forEach var="course" items="${courses}">
                        <form:option value="${course.code}">
                            ${course.name}
                        </form:option>
                    </c:forEach>
                </form:select>
            </div>

            <div class="buttons">
                <input type="submit" value="Register" class="btn" />
                <a href="/admin/registrations" class="btn btn-small">Back</a>
            </div>
        </form:form>
    </div>
</div>
</body>
</html>
