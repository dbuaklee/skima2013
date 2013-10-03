<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="hero-unit">
	<div class="page-header">
		<h3>Please Enter your e-mail Address and SKIMA2012 Registration Invoice Number</h3>
	</div>

	<form:form class="form-horizontal" action="${flowExecutionUrl}"
		method="POST" commandName="registrator">
		<form:errors path="*">
			<div class="alert alert-error">
				<i class="icon-warning-sign"></i> <form:errors path="*" />
			</div>
		</form:errors>
		<fieldset>
			<c:set var="emailErrors">
				<form:errors path="*" />
			</c:set>
			<c:if test="${not empty emailErrors}">
				<c:set var="emailCssError">error</c:set>
			</c:if>
			<div class="control-group  <c:out value='${emailCssError}'/>">
				<label class="control-label" for="email"><b>* Email
						Address:</b></label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" id="email"
						path="email" />
				</div>
			</div>
		</fieldset>

		<fieldset>
			<c:set var="refCodeErrors">
				<form:errors path="*" />
			</c:set>
			<c:if test="${not empty refCodeErrors}">
				<c:set var="refCodeCssError">error</c:set>
			</c:if>
			<div class="control-group  <c:out value='${refCodeCssError}'/>">
				<label class="control-label" for="email"><b>* Invoice
						Number:</b></label>
				<div class="controls">
					<form:input type="text" class="input-xlarge"
						id="registrationInfoRefcode" path="registrationInfo.refCode" />
				</div>
			</div>
		</fieldset>
		<div class="form-actions">
			<button type="submit" class="btn" name="_eventId_cancel">Cancel</button>
			<button type="submit" class="btn btn-primary" name="_eventId_next">OK
				&gt;</button>
		</div>
	</form:form>
</div>
