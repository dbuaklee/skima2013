<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8">
	<link href="<c:url value='/resources/js/bootstrap-2.0.3/css/bootstrap.css'/>" rel="stylesheet">
	<link href="<c:url value='/resources/js/bootstrap-2.0.3/css/datepicker.css'/>" rel="stylesheet">
	<link href="<c:url value='/resources/css/application.css'/>" rel="stylesheet">
	<script src="<c:url value='/resources/js/jquery-1.7.2.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jshashtable-2.1.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.numberformatter-1.2.3.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap-2.0.3/js/bootstrap-modal.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap-2.0.3/js/bootstrap-tooltip.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap-2.0.3/js/bootstrap-popover.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap-2.0.3/js/bootstrap-datepicker.js'/>"></script>
	
	<title>${title}</title>
</head>

<body>
	<div class="container">
	
	<div class="row" style="margin-bottom: 20px;">
		<div id="header" class="span12">
			<tiles:insertAttribute name="header"/>		
		</div>
	</div>
	
	<div class="row">
		<div id="mainContent" class="span12">
			<tiles:insertAttribute name="body"/>
		</div>
	</div>
	
	
	<div class="row" id="footer">
		<div class="span12">
			<tiles:insertAttribute name="footer"/>
		</div>
	</div>
	
	</div>
</body>
</html>
