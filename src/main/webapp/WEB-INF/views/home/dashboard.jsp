<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/assets/external-libs/bootstrap/css/bootstrap.min.css">
    <style>
        .container{
            padding-top: 16px;
            text-align: center;
        }
        .card-body {
            padding: 40px 60px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .btn:hover {
            transform: translateY(-2px);
            transition: 0.2s ease-in-out;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="card shadow">
            <section class="panel panel-primary vertical-space">
                <div class="panel-heading">
                    <h1>Dashboard</h1>
                </div>
                <div class="card-body text-center">
                    <div class="d-grid gap-3 col-6 mx-auto">
                        <a href="/admin/courses" class="btn btn-primary btn-lg">Courses</a>
                        <a href="/admin/categories" class="btn btn-success btn-lg">Categories</a>
                        <a href="/admin/users" class="btn btn-warning btn-lg">Users</a>
                        <a href="/admin/registrations" class="btn btn-info btn-lg">Registrations</a>
                    </div>
                </div>
            </section>
        </div>
    </div>
</body>
</html>
