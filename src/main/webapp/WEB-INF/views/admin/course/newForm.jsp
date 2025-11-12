<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>
        <c:choose>
            <c:when test="${isEdit}">Edit Course</c:when>
            <c:otherwise>New Course</c:otherwise>
        </c:choose>
    </title>
    <link rel="stylesheet" type="text/css" href="/assets/css/global.css">
</head>

<body>
<div class="container">
    <div class="card form-card">
        <h1>
            <c:choose>
                <c:when test="${isEdit}">Edit Course</c:when>
                <c:otherwise>New Course</c:otherwise>
            </c:choose>
        </h1>
        <c:choose>
            <c:when test="${isEdit}">
                <c:url var="formAction" value="/admin/course/${courseForm.code}/edit" />
            </c:when>
            <c:otherwise>
                <c:url var="formAction" value="/admin/course/new" />
            </c:otherwise>
        </c:choose>

        <form:form modelAttribute="courseForm" action="${formAction}" method="post" cssClass="form">

            <div class="form-group">
                <label for="course-name">Name:</label>
                <form:input path="name" id="course-name" cssClass="input" required="required" />
                <form:errors path="name" cssClass="text-danger" />
            </div>

            <div class="form-group">
                <label for="course-code">Code:</label>
                <form:input path="code" id="course-code" cssClass="input" required="required" readonly="${isEdit}" />
                <form:errors path="code" cssClass="text-danger" />
            </div>

            <div class="form-group">
                <label for="course-description">Description:</label>
                <form:textarea path="description" id="course-description" cssClass="input" rows="3" />
            </div>

            <div class="form-group">
                <label for="course-category">Category:</label>
                <form:select path="categoryId" id="course-category" cssClass="input" required="required">
                    <form:option value="" label="-- Select a category --" />
                    <c:forEach items="${categories}" var="cat">
                        <form:option value="${cat.id}" label="${cat.name}" />
                    </c:forEach>
                </form:select>
                <form:errors path="categoryId" cssClass="text-danger" />
            </div>

            <div class="form-group">
                <label for="course-instructor">Instructor:</label>
                <form:select path="instructorEmail" id="course-instructor" cssClass="input" required="required">
                    <form:option value="" label="-- Select an instructor --" />
                    <c:forEach items="${instructors}" var="user">
                        <form:option value="${user.email}" label="${user.email}" />
                    </c:forEach>
                </form:select>
                <form:errors path="instructorEmail" cssClass="text-danger" />
            </div>

            <div class="buttons">
                <c:choose>
                    <c:when test='${isEdit}'><input type="submit" class="btn" value="Update" id="submitBtn" disabled /></c:when>
                    <c:otherwise><input type="submit" class="btn" value="Save" id="submitBtn" disabled /></c:otherwise>
                </c:choose>
                <a href="/admin/courses" class="btn btn-small">Back</a>
            </div>

        </form:form>
    </div>
</div>

<script>
    const form = document.querySelector('.form');
    const submitBtn = document.getElementById('submitBtn');
    const requiredFields = form.querySelectorAll('[required]');

    function validateForm() {
        let allFilled = true;
        requiredFields.forEach(field => {
            if (!field.value || field.value.trim() === '') {
                allFilled = false;
            }
        });
        submitBtn.disabled = !allFilled;
    }

    requiredFields.forEach(field => {
        field.addEventListener('input', validateForm);
        field.addEventListener('change', validateForm);
    });

    validateForm();
</script>
</body>
</html>
