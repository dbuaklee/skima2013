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
			<%-- No Processing Fee	
			<tr>
				<td style="padding-left: 40px; border-bottom: 0px; border-top: 0px;">Money Transfer Processing Fee</td>
				<td style="text-align: right; padding-right: 30px; border-bottom: 0px; border-top: 0px;">15.00</td>
			</tr>
			 --%>
			<tr>
				<td style="text-align: right; padding-right: 40px;"><b>Total</b></td>
				<td style="text-align: right; padding-right: 30px;"><b><fmt:formatNumber pattern="#,##0.00">${registrator.registrationInfo.totalFee}</fmt:formatNumber> (USD)</b></td>
			</tr>
		</tbody>
	</table>
	</div>
</div>

<div class="row"  style="margin-top: 20px; margin-bottom: 40px;">
	<div class="span12">
		
		<h2>Bank Account Detail For Payment</h2>
		<p><span class="label label-important">Note:</span> Bank fees are the sole responsibility of the registrant and should be paid in addition to the registration fees.</p>
		<p>Payment by Direct Electronic Transfer is requested, as follows:</p>
		<div style="margin-left: 30px; margin-bottom: 10px;">
			<b>Bank: </b> KRUNGTHAI BANK<br/>
			<b>Branch: </b> Ratchathavi<br/>
			<b>Address: </b>   486/112-116 Phayathai  Road, Phetburi,  Ratchathawi, Bangkok 10400 
		</div>
		<div style="margin-left: 30px; margin-bottom: 10px;">
			<b>Account: </b>The Innova Foundation<br/>
			<b>Account Number: </b> 030-0-18393-3
		</div>
		<div style="margin-left: 30px; margin-bottom: 10px;">
			<b>SWIFT code: </b>KRTHTHBK
		</div> 
		
	</div>
	
	<form:form class="form-horizontal" action="${flowExecutionUrl}" method="POST" commandName="registrator">
		<div class="span12">
			<button type="submit" class="btn" name="_eventId_edit">Change Payment Method</button>
			<button type="submit" class="btn" name="_eventId_complete">Registration Complete, Back to SKIMA2012 Web Page</button>		
		</div>   	
	</form:form>
	
</div>
