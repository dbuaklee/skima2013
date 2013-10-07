<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<fmt:setLocale value="en_US"/>

<h1>
	Registration Invoice 	
</h1>

<div class="row">
	<div class="span4">
		Innova Foundation <br/>
		128/97 Phayatai Plaza Building <br/>
		8th Floor, Room N <br/>
		Phayatai Road <br/>
		Ratchathewi Bangkok <br/>
		10400 THAILAND <br/>
		Tel. +66-2-216-5769  Fax. +66-2-216-5771 <br/>
	</div>
	<div class="span4 offset4">
		<div style="text-align: right;">
			<b>INVOICE NO: ${registrator.registrationInfo.refCode}</b><br/>
			DATE: <fmt:formatDate value="${registrator.registrationInfo.registerDate}" pattern="dd MMM yyyy"/> 
		</div>
	</div>
</div>

<div class="row" style="margin-top: 20px;">
	<div class="span12">
	<b> ATTENTION: ${registrator.titleDisplayValue} ${registrator.firstName} ${registrator.middleName} ${registrator.lastName} </b><br/>
	${registrator.billingAddress.organizationName} <br/>
	${registrator.billingAddress.address1} <br/>
	<c:if test="${not empty registrator.billingAddress.address2}">
		${registrator.billingAddress.address2} <br/>
	</c:if>
	${registrator.billingAddress.city} ${registrator.billingAddress.zip} <br/>
	${registrator.billingAddress.country} <br/>
	${registrator.billingAddress.telephone} <br/>
	</div>
</div>


<div class="row" style="margin-top: 20px;">
	<div class="span12">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th style="text-align: center;">Item</th>
				<th width="150" style="text-align: center;">Amount (USD)</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="padding-left: 40px; border-bottom: 0px;">SKIMA 2012 Registration Fee - ${registrator.registrationInfo.registrationItemStringNoFee}</td>
				<td style="text-align: right; padding-right: 30px; border-bottom: 0px;"><fmt:formatNumber pattern="#,##0.00">${registrator.registrationInfo.registrationItemFee}</fmt:formatNumber></td>
			</tr>
			<c:if test="${registrator.registrationInfo.workshopItem != 'notSelected'}">
				<tr>
					<td style="padding-left: 40px; border-bottom: 0px; border-top: 0px;">ISO/IEC 29110 Consultant Training Fee (${registrator.registrationInfo.workshopItemDayString})</td>
					<td style="text-align: right; padding-right: 30px; border-bottom: 0px; border-top: 0px;"><fmt:formatNumber pattern="#,##0.00">${registrator.registrationInfo.workShopItemFee}</fmt:formatNumber></td>
				</tr>
			</c:if>
			<tr>
				<td style="padding-left: 40px; border-bottom: 0px; border-top: 0px;">${registrator.registrationInfo.numExtraBanquet} Extra Banquet (@ 80 USD each = ${registrator.registrationInfo.numExtraBanquet *80} USD)</td>
				<td style="text-align: right; padding-right: 30px; border-bottom: 0px; border-top: 0px;"><fmt:formatNumber pattern="#,##0.00">${registrator.registrationInfo.numExtraBanquet *80}</fmt:formatNumber></td>
			</tr>
			<tr>
				<td style="padding-left: 40px; border-bottom: 0px; border-top: 0px;">${registrator.registrationInfo.numExtraCD} Extra Conference Material CD (@ 50 USD each = ${registrator.registrationInfo.numExtraCD *50} USD)</td>
				<td style="text-align: right; padding-right: 30px; border-bottom: 0px; border-top: 0px;"><fmt:formatNumber pattern="#,##0.00">${registrator.registrationInfo.numExtraCD *50}</fmt:formatNumber></td>
			
			</tr>			
			<tr>
				<td style="text-align: right; padding-right: 40px;"><b>Total (USD)</b></td>
				<td style="text-align: right; padding-right: 30px;"><b><fmt:formatNumber pattern="#,##0.00">${registrator.registrationInfo.totalFee}</fmt:formatNumber> (USD) </b></td>
			</tr>
			<%--
			<tr>
				<td style="text-align: right; padding-right: 40px;"><b>Total Amount to be paid by credit card in Thai Baht @ ${registrator.registrationInfo.exchangeRate} Thai Baht = 1 US Dollar</b></td>
				<td style="text-align: right; padding-right: 30px;"><b><fmt:formatNumber pattern="#,##0.00">${registrator.registrationInfo.totalFeeBaht}</fmt:formatNumber> (THB) </b></td>
			</tr>
			 --%>
		</tbody>
	</table>
	</div>
</div>

<%--
<div class="alert alert-info">
	<h3>Payment by credit card will be available on July 16, 2012</h3>
	<p>We are currently working with our payment gateway at this moment. The payment by 
	credit card will be available on July 16, 2012. If you choose to pay by credit card
	you can come back to <a href=""></a> and "choose I have already registered and want to 
	check my information" button. There you will have a choice to either make payment 
	transaction by credit card again. <b><u>Please print out this page for future reference 
	as you'll need invoice number and your email to log back in again</u></b></p> 
	
	You can change your payment method with money transfer by click on this button
	<form:form class="form-horizontal" action="${flowExecutionUrl}" method="POST" commandName="registrator">
			<button type="submit" class="btn" name="_eventId_edit">Change Payment Method</button>
			<button type="submit" class="btn" name="_eventId_exit">OK I understand and will check back later</button>
	</form:form>
	
</div>
 
--%>

<div class="row"  style="margin-top: 20px; margin-bottom: 40px;">
	<div class="span12">
		<h3>Please review the information before proceeding to the payment gateway</h3>
		<p> Innova Foundation use credit card payment gateway service of Krungthai Card Public Company Limited (KTC). 
		Upon clicking Proceed to Payment Gateway button, you will be redirected to the Web payment of
		Krungthai Card Public Company, and hereby leaving the SKIMA 2013 registration domain. </p>
		<p> Krungthai Card Public Company Limited (KTC) will be doing the credit card processing 
		and all of your credit card information will be collected by KTC. You should print this invoice
		for future reference and if there are any problems or concerns about the payment gateway,
		please do not hesitate to contact us at <a href="mailto:skima2013@gmail.com">skima2013@gmail.com</a> 
		The invoice shall be paid in Thai baht with the <b>fix rate @ ${registrator.registrationInfo.exchangeRate} baht/dollar </b>with the exact payment
		amount shown in the invoice above. </p>
		
		<p>Innova Foundation reserves the right to cancel or change the payment order, which might have been approved. 
		 The payment for services will be bound by the terms included in the service agreement. 
		 The agreement is a confirmation of registration and service order.</p>
		<p>Innova Foundation reserves the right to change the list of terms and conditions about the payment without 
		prior notice. In case of any dispute, Innova Foundation decision is final. </p>
		
		<a id="term"><input type="checkbox" id="acceptTermCheckBox" onclick="changeTerm()"></a> I Accept Payment Term &amp; Condition Above 
	</div>
	<div class="span6 offset6" style="text-align: right;">
		<form:form class="form-horizontal" action="${flowExecutionUrl}" method="POST" commandName="registrator">
			<button type="submit" class="btn" name="_eventId_edit">Change Payment Method</button>
		</form:form>
	
		<form name="payFormCcard" id="payFormCcard" method="post" action="https://paygate.ktc.co.th/ktc/eng/payment/payForm.jsp">
			<input type="hidden" name="merchantId" value="030300001">
			<input type="hidden" name="amount" value="${registrator.registrationInfo.totalFeeBaht}" >
			<input type="hidden" name="orderRef" value="${registrator.registrationInfo.refCode}">
			<input type="hidden" name="currCode" value="764" >
			<input type="hidden" name="successUrl"	value="http://www.innova.or.th/skima2013/paymentSuccess">
			<input type="hidden" name="failUrl" value="http://www.innova.or.th/skima2013/paymentFail">
			<input type="hidden" name="cancelUrl" value="http://www.innova.or.th/skima2013/paymentCancel">
			<input type="hidden" name="payType" value="N">
			<input type="hidden" name="lang" value="E">
			<button id="proceedBtn" class="btn btn-primary" onclick="notifyComplete()"  disabled="disabled">Proceed to KTC Payment Gateway &gt;</button>
		</form>
		
	</div>
		  
</div>

<div class="modal hide" id="acceptTermModal">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">×</button>
		<h3>Payment Gateway Term and Condition</h3>
	</div>
	<div class="modal-body">
		<p>Sorry, you must accept the Term and Condition before proceeding to KTC Payment Gateway.</p>
	</div>
	<div class="modal-footer">
		<a href="#acceptTerm" class="btn btn-info" data-dismiss="modal">Close</a>
	</div>
</div>

<script type="text/javascript">
function notifyComplete() {
	if($('#acceptTermCheckBox').is(':checked') == false ) {
		
		$('#acceptTermModal').modal('show');
		
	} else {
		$('#payFormCcard').submit();
	}
}

function changeTerm() {
	if($('#acceptTermCheckBox').is(':checked') == false ) {
		$('#proceedBtn').attr("disabled","disabled");
	} else {
		$('#proceedBtn').removeAttr("disabled");
	}
}

</script>

