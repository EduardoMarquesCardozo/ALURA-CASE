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
        <h1>New Category</h1>
        <p class="subtitle">Fill out the fields below to create a new category.</p>

        <form:form modelAttribute="newCategoryForm" action="/admin/category/new" method="post" cssClass="form">
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