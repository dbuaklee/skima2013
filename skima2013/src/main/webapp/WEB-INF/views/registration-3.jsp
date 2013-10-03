<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>



<h1>
	Please Review all information before proceed
	
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
		<div class="control-group">
			<label class="control-label"><b>* Organization Name:</b></label>
			<div class="controls">
				<div style="padding-top: 5px;">${registrator.mainAddress.organizationName}</div>
			</div>
		</div> 
	</fieldset>
	<fieldset>
		<div class="control-group">
			<label class="control-label" for="address1"><b>* Address 1:</b></label>
			<div class="controls">
				<div style="padding-top: 5px;">${registrator.mainAddress.address1}</div>
			</div>
		</div> 
	</fieldset>
	<fieldset>
		<div class="control-group">
			<label class="control-label" for="address2"> Address 2:</label>
			<div class="controls">
				<div style="padding-top: 5px;">${registrator.mainAddress.address2}</div>
			</div>
		</div> 
	</fieldset>
		<fieldset>
		<div class="control-group">
			<label class="control-label" for="city"><b>* city:</b></label>
			<div class="controls">
				<div style="padding-top: 5px;">${registrator.mainAddress.city}</div>
			</div>
		</div> 
	</fieldset>
	<fieldset>
		<div class="control-group">
			<label class="control-label" for="zip"><b>* ZIP/Postal Codes:</b></label>
			<div class="controls">
				<div style="padding-top: 5px;">${registrator.mainAddress.zip}</div>
			</div>
		</div> 
	</fieldset>
	<fieldset>
		<div class="control-group">
			<label class="control-label" for="country"><b>* Country/Region:</b></label>
			<div class="controls">
				<div style="padding-top: 5px;">${registrator.mainAddress.country}</div>
			</div>
		</div> 
	</fieldset>
		<fieldset>
		<div class="control-group">
			<label class="control-label" for="phone"><b>* Telephone/Cellular Number:</b></label>
			<div class="controls">
				<div style="padding-top: 5px;">${registrator.mainAddress.telephone}</div>
			</div>
		</div> 
	</fieldset>
	<c:choose>
		<c:when test="${registrator.sameBillingAddress}">
			<fieldset>
				<div class="control-group">
					<label class="control-label"><b>* Billing Address:</b></label>
					<div class="controls">
						<div style="padding-top: 5px;">My Billing Address is the same as my main address</div>
					</div>
				</div> 
			</fieldset>
		</c:when>
		<c:otherwise>
			<div class="control-group">
				<label class="control-label"><b>* Billing Address:</b></label>
				<div class="controls">
					<div style="padding-top: 5px;">Please use the following address for billing</div>
				</div>
			</div> 
			<fieldset>
				<div class="control-group">
					<label class="control-label"><b>* Organization Name:</b></label>
					<div class="controls">
						<div style="padding-top: 5px;">${registrator.billingAddress.organizationName}</div>
					</div>
				</div> 
			</fieldset>
			<fieldset>
				<div class="control-group">
					<label class="control-label" for="address1"><b>* Address 1:</b></label>
					<div class="controls">
						<div style="padding-top: 5px;">${registrator.billingAddress.address1}</div>
					</div>
				</div> 
			</fieldset>
			<fieldset>
				<div class="control-group">
					<label class="control-label" for="address2"> Address 2:</label>
					<div class="controls">
						<div style="padding-top: 5px;">${registrator.billingAddress.address2}</div>
					</div>
				</div> 
			</fieldset>
				<fieldset>
				<div class="control-group">
					<label class="control-label" for="city"><b>* city:</b></label>
					<div class="controls">
						<div style="padding-top: 5px;">${registrator.billingAddress.city}</div>
					</div>
				</div> 
			</fieldset>
			<fieldset>
				<div class="control-group">
					<label class="control-label" for="zip"><b>* ZIP/Postal Codes:</b></label>
					<div class="controls">
						<div style="padding-top: 5px;">${registrator.billingAddress.zip}</div>
					</div>
				</div> 
			</fieldset>
			<fieldset>
				<div class="control-group">
					<label class="control-label" for="country"><b>* Country/Region:</b></label>
					<div class="controls">
						<div style="padding-top: 5px;">${registrator.billingAddress.country}</div>
					</div>
				</div> 
			</fieldset>
				<fieldset>
				<div class="control-group">
					<label class="control-label" for="phone"><b>* Telephone/Cellular Number:</b></label>
					<div class="controls">
						<div style="padding-top: 5px;">${registrator.billingAddress.telephone}</div>
					</div>
				</div> 
			</fieldset>
		</c:otherwise>
	</c:choose>

	<div class="page-header">
		<h2>Registration Information</h2>
	</div>	
	<div class="control-group">
		<label class="control-label"><b>* Registration Items:</b></label>
		<div class="controls">
			<div style="padding-top: 5px;">${registrator.registrationInfo.registrationItemWebString}</div>
		</div>
	</div> 
	
	
	<div class="page-header">
		<h2>Conference Items</h2>
	</div>	
	<div class="control-group">
		<label class="control-label">Extra Banquet</label>
		<div class="controls">
			<div style="padding-top: 5px;">${registrator.registrationInfo.numExtraBanquet} (@ 80 USD each = ${registrator.registrationInfo.numExtraBanquet *80} USD)</div>
		</div>
	</div> 
	<div class="control-group">
		<label class="control-label">Extra Conference Material CD</label>
		<div class="controls">
			<div style="padding-top: 5px;">${registrator.registrationInfo.numExtraCD} (@ 50 USD each = ${registrator.registrationInfo.numExtraCD * 50 } USD)</div>
		</div>
	</div>	
	
	
	
	<%--

	<div class="page-header">
		<h2>Hotel Information</h2>
	</div>
	<div class="control-group">
		<label class="control-label"><b>* Hotel Reservation:</b></label>
		<div class="controls">
			<div style="padding-top: 5px;">${registrator.registrationInfo.hotelReservationWebString}</div>
		</div>
	</div>			
	
	 --%>
	
	<div class="page-header">
		<h2>Registration Payment Method:</h2>
	</div>
	<c:set var="paymentMethodErrors"><form:errors path="registrationInfo.paymentMethod"/></c:set>
	<c:if test="${not empty paymentMethodErrors}">
		<c:set var="paymentMethodCssError">error</c:set>
	</c:if>
	<div class="control-group <c:out value='${paymentMethodCssError}'/>">
		<label class="control-label"><b>* Payment Method: </b></label>
		<div class="controls">
			<p class="help-block"><form:errors path="registrationInfo.paymentMethod"/></p>
			<label class="radio">
				<form:radiobutton name="paymentMethod" id="paymentMethod" path="registrationInfo.paymentMethod" value="creditCard" onclick="togglePaymnet(this);"/>
        		${registrator.registrationInfo.paymentMethodCreditCardWebString}
			</label>
			        		
        		<div class="alert alert-info">
        			<span class="label label-important">Credit Card Payment Note:</span> Credit Card Transaction will be processed by Krungthai Card Public Company Limited. The only curency accepted through credit card is Thai Baht, so registration fees will be paid in Thai Baht with the fix exchange rate of <b>${registrator.registrationInfo.exchangeRate} Thai Baht = 1 US Dollar.</b>
        		</div>
        		<div><br/></div>
			<label class="radio">
				<form:radiobutton name="paymentMethod" id="paymentMethod" path="registrationInfo.paymentMethod" value="moneyTransfer" onclick="togglePaymnet(this);"/>
        		${registrator.registrationInfo.paymentMethodMoneyTransferWebString}
			</label>
			<div class="alert alert-info">
        			<span class="label label-important">Money Transfer Payment Note:</span> Applicants are responible in all bank transfer fee that might occurs. You can money transfer in US Dollar currency. Detail information about the payment will be provided by the next page
        		</div>
		</div>
	</div>	

   	<div class="form-actions">
   		<button type="submit" class="btn" name="_eventId_edit">Edit Information</button>
    	<span id="creditCardBtn">
        	<button type="submit" class="btn btn-primary" name="_eventId_creditCard">Confirm &amp; Next &gt;</button>
        </span>
        <span id="moneyTransferBtn" style="display: none">
        	<button type="submit" class="btn btn-primary" name="_eventId_moneyTransfer">Confirm &amp; Next &gt;</button>
        </span>
	</div>
	
	
</form:form>



<script type="text/javascript">
function togglePaymnet(payment) {
	
	
	if(payment.value == 'creditCard') {
		$('#creditCardBtn').show();
		$('#moneyTransferBtn').hide();
	} else {
		$('#creditCardBtn').hide();
		$('#moneyTransferBtn').show();
	}
	
	
}

$(document).ready(function() {
	  // Handler for .ready() called.
	$("#ccInfo").popover();
	$("#mtInfo").popover();
});


</script>