<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Category</title>
    <link rel="stylesheet" type="text/css" href="/assets/css/global.css">
</head>

<body>
<div class="container">
    <div class="card form-card">
        <h1>
            <c:choose>
                <c:when test="${isEdit}">
                    Edit Category
                </c:when>
                <c:otherwise>
                    New Category
                </c:otherwise>
            </c:choose>
        </h1>
        <p class="subtitle">
            <c:choose>
                <c:when test="${isEdit}">
                    Update the fields below to edit the category.
                </c:when>
                <c:otherwise>
                    Fill out the fields below to create a new category.
                </c:otherwise>
            </c:choose>
        </p>

        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>

        <c:set var="formAction" value="${isEdit ? '/admin/category/'.concat(categoryCode).concat('/edit') : '/admin/category/new'}" />
        <form:form modelAttribute="newCategoryForm" action="${formAction}" method="post" cssClass="form">
            <div class="form-group">
                <label for="newCategory-name">Name:</label>
                <form:input path="name" id="newCategory-name" cssClass="input" required="required" />
            </div>

            <div class="form-group">
                <label for="newCategory-code">Code:</label>
                <form:input path="code" id="newCategory-code" cssClass="input" required="required" />
            </div>

            <div class="form-group">
                <label for="newCategory-color">Color:</label>
                <form:input path="color" id="newCategory-color" cssClass="input" required="required" />
            </div>

            <div class="form-group">
                <label for="newCategory-order">Order:</label>
                <form:input path="order" id="newCategory-order" type="number" min="1" cssClass="input" required="required" />
            </div>

            <div class="buttons">
                <input type="submit" value="Save" class="btn" />
                <a href="/admin/categories" class="btn btn-small">Back</a>
            </div>
        </form:form>
    </div>
</div>
</body>
</html>