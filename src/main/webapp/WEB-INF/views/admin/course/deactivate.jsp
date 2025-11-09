<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html>
<head>
    <title>Change course status</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/assets/external-libs/bootstrap/css/bootstrap.min.css">
    <style>
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

<div class="container">
    <section class="panel panel-primary vertical-space">
        <div class="panel-heading">
            <h1>Change course status</h1>
        </div>


        <div class="card-body text-center">
            <h5 class="mb-4">Do you really wish to change the status of this course?</h5>

            <form:form method="post" action="/admin/course/${course.code}/inactive">
                <div class="d-flex justify-content-center gap-3">
                    <input type="submit" class="btn btn-danger px-4" value="Change"/>
                    <a href="/admin/courses" class="btn btn-secondary px-4">Cancel</a>
                </div>
            </form:form>
        </div>

    </section>
</div>