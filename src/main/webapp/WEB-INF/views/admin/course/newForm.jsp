<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Register new Course</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/assets/external-libs/bootstrap/css/bootstrap.min.css">
</head>

<body>
<div class="container">
    <section class="panel panel-primary vertical-space">
        <div class="panel-heading">
            <h1>Register new Course</h1>
        </div>

        <form:form modelAttribute="newCourseForm" cssClass="form-horizontal panel-body"
                   action="/admin/course/new" method="post">

            <div class="row form-group">
                <div class="col-md-9">
                    <label for="course-name">Name:</label>
                    <form:input path="name" id="course-name" cssClass="form-control" required="required"/>
                    <form:errors path="name" cssClass="text-danger"/>
                </div>

                <div class="col-md-9">
                    <label for="course-code">Code:</label>
                    <form:input path="code" id="course-code" cssClass="form-control" required="required"/>
                    <form:errors path="code" cssClass="text-danger"/>
                </div>

                <div class="col-md-9">
                    <label for="course-description">Description:</label>
                    <form:textarea path="description" id="course-description" cssClass="form-control" rows="3"/>
                </div>

                <div class="col-md-9">
                    <label for="course-category">Category:</label>
                    <form:select path="categoryId" id="course-category" cssClass="form-control" required="required">
                        <form:option value="" label="-- Select a category --"/>
                        <c:forEach items="${categories}" var="cat">
                            <form:option value="${cat.id}" label="${cat.name}"/>
                        </c:forEach>
                    </form:select>
                    <form:errors path="categoryId" cssClass="text-danger"/>
                </div>

                <div class="col-md-9">
                    <label for="course-instructor">Instructor:</label>
                    <form:select path="instructorEmail" id="course-instructor" cssClass="form-control" required="required">
                        <form:option value="" label="-- Select an instructor --"/>
                        <c:forEach items="${instructors}" var="user">
                            <form:option value="${user.email}" label="${user.email}"/>
                        </c:forEach>
                    </form:select>
                    <form:errors path="instructorEmail" cssClass="text-danger"/>
                </div>
            </div>

            <input class="btn btn-success submit" type="submit" value="Save"/>
        </form:form>
    </section>
</div>
</body>
</html>
