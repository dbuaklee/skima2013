<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>


<form:form class="form-horizontal" action="${flowExecutionUrl}" method="POST" commandName="registrator">
<h1>
	Hello ${registrator.titleDisplayValue} ${registrator.firstName} ${registrator.middleName} ${registrator.lastName} <br/>
	You have already filed a registration to SKIMA 2013 Conference
</h1>


<div class="page-header">
<h2>SKIMA 2013 Registration Fee Status</h2>
</div>
<div style="margin-bottom:20px;">
	You have chosen to pay registration fee by : ${registrator.registrationInfo.paymentMethod}
	<c:choose>
	<c:when test="${registrator.registrationInfo.status eq 'Paid'}">
		has successfully been paid.<br/> Thank you for your payment 
		<button type="submit" class="btn btn-primary" name="_eventId_receipt">Print Receipt &gt;</button>
	</c:when>
	<c:when test="${registrator.registrationInfo.creditCardPaymentStatus eq 'ACCEPT' }">
		has been accepted by KTC payment gateway. Usually there is one or two days for processing, and once 
		your credit has been cleared, you can print your receipt here. Please come back later. If you have 
		any issue or question about your transaction please contact <a href="mailto:skima2013@gmail.com">skima2013@gmail.com</a>
	</c:when>
	</c:choose>
	
</div>

<c:if test="${registrator.registrationInfo.status eq 'Unpaid' and registrator.registrationInfo.creditCardPaymentStatus ne 'ACCEPT'}">


We have not received your payment yet, you can 
<c:choose>
	<c:when test="${registrator.registrationInfo.paymentMethod eq 'creditCard'}">
		<button type="submit" class="btn btn-primary" name="_eventId_creditCardInvoice">Try Pay Through KTC Gateway &gt;</button>
	</c:when>
	<c:otherwise>
		<button type="submit" class="btn btn-primary" name="_eventId_moneyTransferInvoice">Print Invoice Again &gt;</button>
	</c:otherwise>
</c:choose>



<div class="page-header"> <b>Or Change Your Payment Method</b> </div>
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
   		<button type="submit" class="btn" name="_eventId_exit">Exit and Go Back to SKIMA 2013 Web page</button>
    	<span id="creditCardBtn">
        	<button type="submit" class="btn btn-primary" name="_eventId_creditCard">Confirm &amp; Next &gt;</button>
        </span>
        <span id="moneyTransferBtn" style="display: none">
        	<button type="submit" class="btn btn-primary" name="_eventId_moneyTransfer">Confirm &amp; Next &gt;</button>
        </span>
	</div>
	
	

</c:if>

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