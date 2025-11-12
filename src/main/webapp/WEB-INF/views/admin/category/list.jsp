<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Category List</title>
    <link rel="stylesheet" type="text/css" href="/assets/css/global.css">
</head>

<body>
<div class="container">
    <div class="card list-card">
        <div class="list-header">
            <h1>Categories</h1>
            <a class="btn btn-small" href="/admin/category/new">New Category</a>
        </div>

        <table class="list-table">
            <thead>
            <tr>
                <th>Name</th>
                <th>Code</th>
                <th>Color</th>
                <th>Order</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${categories}" var="category">
                <tr>
                    <td>${category.name()}</td>
                    <td>${category.code()}</td>
                    <td>
                        <span class="color-dot" style="background-color: ${category.color()}"></span>
                            ${category.color()}
                    </td>
                    <td>${category.order()}</td>
                    <td>
                        <a class="btn btn-small btn-edit" href="/admin/category/edit/${category.id()}">Edit</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>