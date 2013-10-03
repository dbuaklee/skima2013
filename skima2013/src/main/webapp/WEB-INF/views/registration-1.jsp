<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<h1>
	Fill out the information below, then click Next to proceed
	
</h1>


<div class="page-header">
<h2>Registration Information</h2>
</div>



<form:form id="enterRegistration" class="form-horizontal" action="${flowExecutionUrl}" method="POST" commandName="registrator">
	<fieldset>
		<c:set var="titleErrors"><form:errors path="title"/></c:set>
    	<c:if test="${not empty titleErrors}">
        	<c:set var="titleCssError">error</c:set>
    	</c:if>	
		<div class="control-group <c:out value='${titleCssError}'/>">
			<label class="control-label" for="title"><b>* Title:</b></label>
			<div class="controls">
			<form:select path="title" id="title">
				<form:option value="0" label="Select..." />
				<form:options items="${registrator.titleList}"  itemValue="value" itemLabel="displayValue" />
			</form:select>
				<span class="help-inline"><form:errors path="title"/></span>
			</div>
		</div> 
	</fieldset>
	<fieldset>
		<c:set var="firstNameErrors"><form:errors path="firstName"/></c:set>
    	<c:if test="${not empty firstNameErrors}">
        	<c:set var="firstNameCssError">error</c:set>
    	</c:if>	
		<div class="control-group <c:out value='${firstNameCssError}'/>"> 
			<label class="control-label" for="firstName"><b>* First/Given Name:</b></label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" id="firstName" path="firstName"/>
				<span class="help-inline"><form:errors path="firstName"/></span>
			</div>
		</div> 
	</fieldset>
	
	<fieldset>
		<c:set var="middleNameErrors"><form:errors path="middleName"/></c:set>
    	<c:if test="${not empty middleNameErrors}">
        	<c:set var="middleNameCssError">error</c:set>
    	</c:if>	
		<div class="control-group  <c:out value='${middleNameCssError}'/>">
			<label class="control-label" for="middleName">Middle Name:</label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" id="middleName" path="middleName"/>
				<span class="help-inline"><form:errors path="middleName"/></span>
			</div>
		</div> 
	</fieldset>
	
	<fieldset>
		<c:set var="lastNameErrors"><form:errors path="lastName"/></c:set>
    	<c:if test="${not empty lastNameErrors}">
        	<c:set var="lastNameCssError">error</c:set>
    	</c:if>	
		<div class="control-group  <c:out value='${lastNameCssError}'/>">
			<label class="control-label" for="lastName"><b>* Family/Surname:</b></label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" id="lastName" path="lastName"/>
				<span class="help-inline"><form:errors path="lastName"/></span>
			</div>
		</div> 
	</fieldset>

	<fieldset>
		<c:set var="emailErrors"><form:errors path="email"/></c:set>
    	<c:if test="${not empty emailErrors}">
        	<c:set var="emailCssError">error</c:set>
    	</c:if>
		<div class="control-group  <c:out value='${emailCssError}'/>">
			<label class="control-label" for="email"><b>* Email Address:</b></label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" id="email" path="email"/>
				<span class="help-inline"><form:errors path="email"/></span>
			</div>
		</div> 
	</fieldset>
	
   	<div class="form-actions">
   	
<!--    		<span style="margin-right:45px;"><a href="">Already Register?</a></span> -->
    	<button type="submit" class="btn" name="_eventId_cancel">Cancel</button>
        <button type="submit" class="btn btn-primary" name="_eventId_next">Next &gt;</button>
        
	</div>

</form:form>