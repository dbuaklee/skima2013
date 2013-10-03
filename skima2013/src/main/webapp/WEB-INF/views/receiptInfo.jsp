<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<fmt:setLocale value="en_US"/>

<h1>
	SKIMA 2012 Registration Receipt 	
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
			<b>Receipt NO: ${registrator.registrationInfo.receiptNo}</b><br/>
			DATE: <fmt:formatDate value="${registrator.registrationInfo.receiptDate}" pattern="dd MMM yyyy"/> 
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
				<td style="padding-left: 40px; border-bottom: 0px;">SKIMA 2012 Registration Fee (${registrator.registrationInfo.registrationItem})</td>
				<td style="text-align: right; padding-right: 30px; border-bottom: 0px;"><fmt:formatNumber pattern="#,##0.00">${registrator.registrationInfo.registrationItemFee}</fmt:formatNumber></td>
			</tr>
			<c:if test="${registrator.registrationInfo.workshopItem != 'notSelected'}">
				<tr>
					<td style="padding-left: 40px; border-bottom: 0px; border-top: 0px;">ISO/IEC 29110 Consultant Training Fee (${registrator.registrationInfo.workshopItemDayString})</td>
					<td style="text-align: right; padding-right: 30px; border-bottom: 0px; border-top: 0px;"><fmt:formatNumber pattern="#,##0.00">${registrator.registrationInfo.workShopItemFee}</fmt:formatNumber></td>
				</tr>
			</c:if>
<!-- 			<tr> -->
<!-- 				<td style="padding-left: 40px; border-bottom: 0px; border-top: 0px;">Processing Fee</td> -->
<!-- 				<td style="text-align: right; padding-right: 30px; border-bottom: 0px; border-top: 0px;">0.00</td> -->
<!-- 			</tr> -->
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
		<h3>Total Amount Has Been Paid in FULL </h3>
	</div>
	
	<form:form class="form-horizontal" action="${flowExecutionUrl}" method="POST" commandName="registrator">
		<div class="span12">
			<button type="submit" class="btn" name="_eventId_complete">Back to SKIMA2012 Web Page</button>		
		</div>   	
	</form:form>
	
</div>
