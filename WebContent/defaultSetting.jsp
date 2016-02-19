<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- tab library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fnc" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- common java script -->
<script src="${project}/jquery-1.12.0.js"></script>
<script src="${js}/common.js"></script>

<!-- common style sheet -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- variable -->
<c:set var="project" value="/fj"/>
<c:set var="js" value="${project}/js"/>
<c:set var="images" value="${project}/images"/>