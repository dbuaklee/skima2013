<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<script type="text/javascript">
<!--
function toggleBillingAddress() {
	$('#billingAddressInfo').toggle();
} 
//-->
</script>

<h1>
	Fill out the information below, then click Next to proceed
	
</h1>


<div class="page-header">
<h2>Personal Information</h2>
</div>

<form:form class="form-horizontal" action="${flowExecutionUrl}" method="POST" commandName="registrator">
	<fieldset>
		<div class="control-group">
			<label class="control-label" for="title">Title:</label>
			<div class="controls">
				<div style="padding-top: 5px;">${registrator.titleDisplayValue}</div>
			</div>
		</div> 
	</fieldset>
	
	<fieldset>
		<div class="control-group">
			<label class="control-label" for="firstName">First/Given Name:</label>
			<div class="controls">
				<div style="padding-top: 5px;">${registrator.firstName}</div>
			</div>
		</div> 
	</fieldset>
	<fieldset>
		<div class="control-group">
			<label class="control-label" for="middleName">Middle Name:</label>
			<div class="controls">
				<div style="padding-top: 5px;">${registrator.middleName}</div>
			</div>
		</div> 
	</fieldset>
	<fieldset>
		<div class="control-group">
			<label class="control-label" for="lastName">Family/Surname:</label>
			<div class="controls">
				<div style="padding-top: 5px;">${registrator.lastName}</div>
			</div>
		</div> 
	</fieldset>

	<fieldset>
		<div class="control-group">
			<label class="control-label" for="email">Email Address:</label>
			<div class="controls">
				<div style="padding-top: 5px;">${registrator.email}</div>
			</div>
		</div> 
	</fieldset>

	<div class="page-header">
		<h2>Contact Information</h2>
	</div>
	<fieldset>
		<c:set var="mainAddressOrganizationNameErrors"><form:errors path="mainAddress.organizationName"/></c:set>
    	<c:if test="${not empty mainAddressOrganizationNameErrors}">
        	<c:set var="mainAddressOrganizaionNameCssError">error</c:set>
    	</c:if>	
		<div class="control-group <c:out value='${mainAddressOrganizaionNameCssError}'/>">
			<label class="control-label" for="mainAddress.organizationName">Organization Name:</label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" id="billingOrganizationName" path="mainAddress.organizationName"/>
				<span class="help-inline"><form:errors path="mainAddress.organizationName"/></span>
			</div>
		</div> 
	</fieldset>
	<fieldset>
		<c:set var="mainAddressAddress1Errors"><form:errors path="mainAddress.address1"/></c:set>
    	<c:if test="${not empty mainAddressAddress1Errors}">
        	<c:set var="mainAddressAddress1CssError">error</c:set>
    	</c:if>	
		<div class="control-group <c:out value='${mainAddressAddress1CssError}'/>">
			<label class="control-label" for="mainAddress.address1"><b>* Address 1:</b></label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" id="mainAddressAddress1" path="mainAddress.address1"/>
				<span class="help-inline"><form:errors path="mainAddress.address1"/></span>
			</div>
		</div> 
	</fieldset>
	<fieldset>
		<c:set var="mainAddressAddress2Errors"><form:errors path="mainAddress.address2"/></c:set>
    	<c:if test="${not empty mainAddressAddress2Errors}">
        	<c:set var="mainAddressAddress2CssError">error</c:set>
    	</c:if>	
		<div class="control-group <c:out value='${mainAddressAddress2CssError}'/>">
			<label class="control-label" for="mainAddress.address2">Address 2:</label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" id="mainAddressAddress2" path="mainAddress.address2"/>
				<span class="help-inline"><form:errors path="mainAddress.address2"/></span>
			</div>
		</div> 
	</fieldset>
	<fieldset>
		<c:set var="mainAddressCityErrors"><form:errors path="mainAddress.city"/></c:set>
    	<c:if test="${not empty mainAddressCityErrors}">
        	<c:set var="mainAddressCityCssError">error</c:set>
    	</c:if>	
		<div class="control-group <c:out value='${mainAddressCityCssError}'/>">
			<label class="control-label" for="mainAddress.city"><b>* City:</b></label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" id="mainAddressCity" path="mainAddress.city"/>
				<span class="help-inline"><form:errors path="mainAddress.city"/></span>
			</div>
		</div> 
	</fieldset>
	<fieldset>
		<c:set var="mainAddressZipErrors"><form:errors path="mainAddress.zip"/></c:set>
    	<c:if test="${not empty mainAddressZipErrors}">
        	<c:set var="mainAddressZipCssError">error</c:set>
    	</c:if>	
		<div class="control-group <c:out value='${mainAddressZipCssError}'/>">
			<label class="control-label" for="mainAddress.zip"><b>* Zip/PostCode:</b></label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" id="mainAddressZip" path="mainAddress.zip"/>
				<span class="help-inline"><form:errors path="mainAddress.zip"/></span>
			</div>
		</div> 
	</fieldset>
	<fieldset>
		<c:set var="mainAddressCountryErrors"><form:errors path="mainAddress.country"/></c:set>
    	<c:if test="${not empty mainAddressCountryErrors}">
        	<c:set var="mainAddressCountryCssError">error</c:set>
    	</c:if>	
		<div class="control-group <c:out value='${mainAddressCountryCssError}'/>">
			<label class="control-label" for="mainAddress.country"><b>* Country:</b></label>
			<div class="controls">
				<form:select path="mainAddress.country" id="mainAddressCountry">
					<form:option value="0" label="Select..." />
					<form:options items="${countryList.list}"  itemValue="countryName" itemLabel="countryName" />
				</form:select>
<%-- 				<form:input type="text" class="input-xlarge"  path="mainAddress.country"/> --%>
				<span class="help-inline"><form:errors path="mainAddress.country"/></span>
			</div>
		</div> 
	</fieldset>
	<fieldset>
		<c:set var="mainAddressTelephoneErrors"><form:errors path="mainAddress.telephone"/></c:set>
    	<c:if test="${not empty mainAddressTelephoneErrors}">
        	<c:set var="mainAddressTelephoneCssError">error</c:set>
    	</c:if>	
		<div class="control-group <c:out value='${mainAddressTelephoneCssError}'/>">
			<label class="control-label" for="mainAddress.telephone"><b>* Telephone:</b></label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" id="mainAddressTelephone" path="mainAddress.telephone"/>
				<span class="help-inline"><form:errors path="mainAddress.telephone"/></span>
			</div>
		</div> 
	</fieldset>


	<fieldset>
		<div class="control-group">
			<label class="control-label" for="sameBillingAddress"><b>* Billing Address:</b></label>
			<div class="controls">
				<label class="checkbox">
					<form:checkbox id="sameBillingAddress" path="sameBillingAddress" onclick="toggleBillingAddress()"/> 
						My Billing Address is the same as my main address
				</label>
			</div>
		</div> 
	</fieldset>
	<c:choose> 
		<c:when test="${registrator.sameBillingAddress}">
        	<c:set var="addressDisplay">none</c:set>
    	</c:when>
    	<c:otherwise>
    		<c:set var="addressDisplay">inherit</c:set>
    	</c:otherwise>
    </c:choose>
	<div id="billingAddressInfo" style="display: ${addressDisplay};">
		<fieldset>
			<c:set var="billingAddressOrganizationNameErrors"><form:errors path="billingAddress.organizationName"/></c:set>
	    	<c:if test="${not empty billingAddressOrganizationNameErrors}">
	        	<c:set var="billingAddressOrganizaionNameCssError">error</c:set>
	    	</c:if>	
			<div class="control-group <c:out value='${billingAddressOrganizaionNameCssError}'/>">
				<label class="control-label" for="billingAddress.organizationName">Organization Name:</label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" id="billingOrganizationName" path="billingAddress.organizationName"/>
					<span class="help-inline"><form:errors path="billingAddress.organizationName"/></span>
				</div>
			</div> 
		</fieldset>
		<fieldset>
			<c:set var="billingAddressAddress1Errors"><form:errors path="billingAddress.address1"/></c:set>
	    	<c:if test="${not empty billingAddressAddress1Errors}">
	        	<c:set var="billingAddressAddress1CssError">error</c:set>
	    	</c:if>	
			<div class="control-group <c:out value='${billingAddressAddress1CssError}'/>">
				<label class="control-label" for="billingAddress.address1"><b>* Address 1:</b></label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" id="billingAddressAddress1" path="billingAddress.address1"/>
					<span class="help-inline"><form:errors path="billingAddress.address1"/></span>
				</div>
			</div> 
		</fieldset>
		<fieldset>
			<c:set var="billingAddressAddress2Errors"><form:errors path="billingAddress.address2"/></c:set>
	    	<c:if test="${not empty billingAddressAddress2Errors}">
	        	<c:set var="billingAddressAddress2CssError">error</c:set>
	    	</c:if>	
			<div class="control-group <c:out value='${billingAddressAddress2CssError}'/>">
				<label class="control-label" for="billingAddress.address2">Address 2:</label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" id="billingAddressAddress2" path="billingAddress.address2"/>
					<span class="help-inline"><form:errors path="billingAddress.address2"/></span>
				</div>
			</div> 
		</fieldset>
		<fieldset>
			<c:set var="billingAddressCityErrors"><form:errors path="billingAddress.city"/></c:set>
	    	<c:if test="${not empty billingAddressCityErrors}">
	        	<c:set var="billingAddressCityCssError">error</c:set>
	    	</c:if>	
			<div class="control-group <c:out value='${billingAddressCityCssError}'/>">
				<label class="control-label" for="billingAddress.city"><b>* City:</b></label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" id="billingAddressCity" path="billingAddress.city"/>
					<span class="help-inline"><form:errors path="billingAddress.city"/></span>
				</div>
			</div> 
		</fieldset>
		<fieldset>
			<c:set var="billingAddressZipErrors"><form:errors path="billingAddress.zip"/></c:set>
	    	<c:if test="${not empty billingAddressZipErrors}">
	        	<c:set var="billingAddressZipCssError">error</c:set>
	    	</c:if>	
			<div class="control-group <c:out value='${billingAddressZipCssError}'/>">
				<label class="control-label" for="billingAddress.zip"><b>* Zip/PostCode:</b></label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" id="billingAddressZip" path="billingAddress.zip"/>
					<span class="help-inline"><form:errors path="billingAddress.zip"/></span>
				</div>
			</div> 
		</fieldset>
		<fieldset>
			<c:set var="billingAddressCountryErrors"><form:errors path="billingAddress.country"/></c:set>
	    	<c:if test="${not empty billingAddressCountryErrors}">
	        	<c:set var="billingAddressCountryCssError">error</c:set>
	    	</c:if>	
			<div class="control-group <c:out value='${billingAddressCountryCssError}'/>">
				<label class="control-label" for="billingAddress.country"><b>* Country:</b></label>
				<div class="controls">
				<form:select path="billingAddress.country" id="billingAddressCountry">
					<form:option value="0" label="Select..." />
					<form:options items="${countryList.list}"  itemValue="countryName" itemLabel="countryName" />
				</form:select>
<%-- 					<form:input type="text" class="input-xlarge" id="billingAddressCountry" path="billingAddress.country"/> --%>
					<span class="help-inline"><form:errors path="billingAddress.country"/></span>
				</div>
			</div> 
		</fieldset>
		<fieldset>
			<c:set var="billingAddressTelephoneErrors"><form:errors path="billingAddress.telephone"/></c:set>
	    	<c:if test="${not empty billingAddressTelephoneErrors}">
	        	<c:set var="billingAddressTelephoneCssError">error</c:set>
	    	</c:if>	
			<div class="control-group <c:out value='${billingAddressTelephoneCssError}'/>">
				<label class="control-label" for="billingAddress.telephone"><b>* Telephone:</b></label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" id="billingAddressTelephone" path="billingAddress.telephone"/>
					<span class="help-inline"><form:errors path="billingAddress.telephone"/></span>
				</div>
			</div> 
		</fieldset>
	</div>
		
	<div class="page-header">
		<h2>Registration Information</h2>
	</div>	
	<c:set var="registrationItemErrors"><form:errors path="registrationInfo.registrationItem"/></c:set>
    	<c:if test="${not empty registrationItemErrors}">
        	<c:set var="registrationItemCssError">error</c:set>
    </c:if>
	<div class="control-group <c:out value='${registrationItemCssError}'/>">
		<label class="control-label"><b>* Registration Items:</b></label>
		<div class="controls">
			<p class="help-block"> <form:errors path="registrationInfo.registrationItem"/></p>
			<label class="radio">
				<form:radiobutton name="presentOptions" id="presentOption1" path="registrationInfo.registrationItem" value="full"/>${registrator.registrationInfo.registrationItemFullString}
			</label>
			<label class="radio">
				<form:radiobutton name="presentOptions" id="presentOption2" path="registrationInfo.registrationItem" value="student"/>${registrator.registrationInfo.registrationItemStudentString}
				<span style="color: red;"
        			id="studentInfo"
        			data-original-title="Student Registration"
        			data-content="Need to proof with academic status and / orregistration document to be confirmed as a student.">
        			<img style="margin-bottom:10px;" src="<c:url value='/resources/images/info.jpg'/>"/>
        		</span>
			</label>
			<label class="radio">
				<form:radiobutton name="presentOptions" id="presentOption3" path="registrationInfo.registrationItem" value="participant"/>${registrator.registrationInfo.registrationItemParticipantString}
				<span style="color: red;"
        			id="participantInfo"
        			data-original-title="Local Registration (Thais Only)"
        			data-content="Only for local residences (Thais).">
        			<img style="margin-bottom:10px;" src="<c:url value='/resources/images/info.jpg'/>"/>
        		</span>
			</label>
		</div>
	</div>
	
	<div class="page-header">
		<h2>Conference Items</h2>
	</div>	
	
	<fieldset>
		<c:set var="extraBanquetError"><form:errors path="registrationInfo.numExtraBanquet"/></c:set>
    	<c:if test="${not empty extraBanquetError}">
        	<c:set var="extraBanquetCssError">error</c:set>
    	</c:if>	
		<div class="control-group <c:out value='${extraBanquetCssError}'/>">
			<label class="control-label">Extra Banquet</label>
			<div class="controls">
				<form:input type="text" class="input-xlarge span1" id="extraBanquet" path="registrationInfo.numExtraBanquet"/> 
				@ 80 USD Each <span class="help-inline"><form:errors path="registrationInfo.numExtraBanquet"/></span>
			</div>
		</div>
	</fieldset>
	<fieldset>
		<c:set var="extraCDError"><form:errors path="registrationInfo.numExtraCD"/></c:set>
    	<c:if test="${not empty extraCDError}">
        	<c:set var="extraCDCssError">error</c:set>
    	</c:if>	
		<div class="control-group <c:out value='${extraCDCssError}'/>">
			<label class="control-label">Extra electronic proceedings</label>
			<div class="controls">
				<form:input type="text" class="input-xlarge span1" id="extraCD" path="registrationInfo.numExtraCD"/> 
				@ 20 USD Each <span class="help-inline"><form:errors path="registrationInfo.numExtraCD"/></span>
			</div>
		</div>	
	</fieldset>
<%--	
	<div class="page-header">
		<h2>Hotel Information</h2>
	</div>
	<c:set var="hotelReservationErrors"><form:errors path="registrationInfo.hotelReservation"/></c:set>
    	<c:if test="${not empty hotelReservationErrors}">
        	<c:set var="hotelReservationCssError">error</c:set>
    </c:if>
	<div class="control-group  <c:out value='${hotelReservationCssError}'/>">
		<label class="control-label"><b>* Hotel Reservation:</b></label>
		<div class="controls">
			<p class="help-block"> <form:errors path="registrationInfo.hotelReservation"/></p>
			<label class="radio">
				<form:radiobutton name="hotelOptions" id="hotelOption1" path="registrationInfo.hotelReservation" value="yes"/>${registrator.registrationInfo.hotelReservationYesWebString }
				<span class="label label-info"><a data-toggle="modal" href="#hotelInfo" style="color:#FFF">Information</a></span>
			</label>
			<label class="radio">
				<form:radiobutton name="hotelOptions" id="hotelOption2" path="registrationInfo.hotelReservation" value="no"/>${registrator.registrationInfo.hotelReservationNoWebString }
			</label>
		</div>
	</div>			

	<!-- hotel information -->
	<div class="modal hide" id="hotelInfo">
		<div class="modal-header">
			<h3>Hotel Information</h3>
		</div>
		<div class="modal-body">
			<p>SKIMA 2012 conference partner with Chengdu Unversity to reserve a room at 
			<a href="http://www.wangjianghotel.com" target="_blank">WAN JIANG hotel</a> 
			for participant at the conference rate. The room rate for conference participants
			is 650Yuan RMB pernight for the one big bed room(single room) and twin beds room(standard room).
			</p>
			<p>
			Chengdu Univesity will only forward your general information to the hotel
			which will go throudh the hotel own reservation system. And when the participants
			arrive at the hotel, they only need to check in by themselves with their own
			passports and credit cards. Certainly, the rooms have been reserved
			by Chengdu University in advance.
			</p>
			<p>
			One more important information, because September is the peak
			season for the tourism in Chengdu. So the Hotel requires us to give
			them the room booking information as soon as possible, better in
			early July at least. 
			</p>
			
			<p> the following are general information of Wang Jian Hotel: </p>
			<p> Address: No.42,Xia Sha He Pu, Chengdu,Sichuan,P.R.China 610066</p>
			<p> (Tel):028-84790000 (fax):028-84791688</p>
			<img src="<c:url value='/resources/images/wanjian_image002.jpg'/>"/>
			<img src="<c:url value='/resources/images/wanjian_image004.jpg'/>"/>
			<img src="<c:url value='/resources/images/wanjian_image006.jpg'/>"/>
			<img src="<c:url value='/resources/images/wanjian_image008.jpg'/>"/>			
			<img src="<c:url value='/resources/images/wanjian_image010.jpg'/>"/>
		</div>
		
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a>
		</div>
	</div>
 --%>


	<div class="form-actions">
   		<button type="submit" class="btn" name="_eventId_back">&lt; Back</button>
    	<button type="submit" class="btn" name="_eventId_cancel">Cancel</button>
        <button type="submit" class="btn btn-primary" name="_eventId_confirm">Summary &gt;</button>
	</div>
	
	
</form:form>

<script type="text/javascript">

$(document).ready(function() {
	  // Handler for .ready() called.
	$("#studentInfo").popover();
	 $('#participantInfo').popover();
});


</script>