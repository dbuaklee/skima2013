<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div style="text-align: right;">
<a class="btn btn-warning" target="_blank" href="<c:url value='/admin/BlankReceipt'/>"> Print Blank Receipt</a>
<a class="btn btn-primary" href="<c:url value='/skimaAdmin/allRegisters/ALL?index=0'/>"> Basic Admin Page</a>
<a class="btn btn-primary" href="<c:url value='/logout'/>">Admin Logout</a>
</div>

<fmt:setLocale value="en_US"/>
<h1 style="margin-bottom:10px;">Cchoose filter: <a class="btn btn-info ${ALLactive}" href="ALL?index=0">ALL</a>
<a class="btn btn-info ${PAIDactive}" href="PAID?index=0">PAID</a>
<a class="btn btn-info ${UNPAIDactive}" href="UNPAID?index=0">UNPAID</a>
<a class="btn btn-info ${JUNKactive}" href="JUNK?index=0">JUNK</a>
<a class="btn btn-info ${ALLJUNKactive}" href="ALLJUNK?index=0">ALL+JUNK</a></h1>

<h1>Listing ${filter_title} (${personList.totalElements}) Registers:</h1>

<c:if test="${personList.totalPages>1}">
<div class="pagination">
<ul>
	<c:set var="href"><c:url value="/admin/allRegisters/${filter}?index="/></c:set>
	<c:choose>
	<c:when test="${not personList.hasPreviousPage()}">
    	<li class="disabled"><a href="">Prev</a></li>
    </c:when>
    <c:otherwise>
    	<li><a href="${href}${personList.number-1}">Prev</a></li>
    </c:otherwise>
    </c:choose>
    
    <c:forEach var="i" begin="1" end="${personList.totalPages}">
        <c:url var="pageUrl" value="/admin/allRegisters/${filter}?index=${i-1}" />
        <c:choose>
            <c:when test="${i == personList.number+1 }">
                <li class="active"><a href="${pageUrl}"><c:out value="${i}" /></a></li>
            </c:when>
            <c:otherwise>
                <li><a href="${pageUrl}"><c:out value="${i}" /></a></li>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    
    <c:choose>
    <c:when test="${not personList.hasNextPage()}">
    	<li class="disabled"><a href="#">Next</a></li>
    </c:when>
    <c:otherwise>
    	<li><a href="${href}${personList.number+1}">Next</a></li>
    </c:otherwise>
    </c:choose>
  </ul>
</div>
</c:if>
<form method="post">
<input type="hidden" name="refCode"/>
<input type="hidden" name="changeToStatus"/>
<input type="hidden" name="exchangeRate"/>
<input type="hidden" name="totalBahtFee"/>
<table class="table table-bordered">
<tr>
	<th>refCode</th>
	<th>Name</th>
	<th>Email</th>
	<th>paymentMethod</th>
	<th>paymentStatus</th>
	<th>JUNK</th>
	<th></th>
</tr>
<c:forEach items="${personList.content}" var="p">
<c:set var="paidCss"/>
<c:if test="${p.registrationInfo.status eq 'Paid'}">
	<c:set var="paidCss">paidCss</c:set>
</c:if>
<tr id="row-${p.registrationInfo.refCode}">
	<td class="${paidCss}"><a href="<c:url value='/admin/registrationDetail?refCode=${p.registrationInfo.refCode}'/>">${p.registrationInfo.refCode}</a><br/>
	<fmt:formatDate value="${p.registrationInfo.registerDate}" pattern="dd/MM/yyyy" /></td>
	<td class="${paidCss}">${p.title} ${p.firstName} ${p.lastName}</td>
	<td class="${paidCss}">${p.email}</td>
	<td class="${paidCss}">${p.registrationInfo.paymentMethod}</td>
	<td  class="${paidCss}" id='tdStatus-${p.registrationInfo.refCode}'> 
		<c:choose>
			<c:when test="${p.registrationInfo.paymentMethod eq 'creditCard' and p.registrationInfo.status eq 'Unpaid'}">
				${p.registrationInfo.creditCardPaymentStatus}
			</c:when>
			<c:otherwise>
				${p.registrationInfo.status}
				<c:if test="${p.registrationInfo.status eq 'Paid'}">
					<br/>${p.registrationInfo.receiptNo}
					<br/><fmt:formatDate value="${p.registrationInfo.receiptDate}" pattern="dd/MM/yyyy"/>
					<%--
					<br/>@<fmt:formatNumber value="${p.registrationInfo.receiptExchangeRate}" pattern="#,###.00"/> THB/USD
					--%>
					<br/>= THB <fmt:formatNumber value="${p.registrationInfo.receiptTotalThaiBaht}" pattern="#,###.00"/>

				</c:if>
			</c:otherwise>
		</c:choose>
	</td>
	<td class="${paidCss}" id='tdJunkBtn-${p.registrationInfo.refCode}'>
		<span id='junk-${p.registrationInfo.refCode}'>${p.registrationInfo.junkRegister}</span><br/><a class="btn" id="junkBtn-${p.registrationInfo.refCode}" onclick="sumitMarkJunkForm('${p.registrationInfo.refCode}')">Toggle Junk!</a>
	</td>
	<td class="${paidCss}" id='tdBtn-${p.registrationInfo.refCode}'>
		<c:choose>
			<c:when test="${p.registrationInfo.status == 'Paid'}">
				<a href="#" class="btn" id="p-${p.registrationInfo.refCode}" onclick="submitMarkUnpaidForm('${p.registrationInfo.refCode}')">Mark Unpaid</a>
				<br/><br/><a href="<c:url value='/admin/Receipt/${p.registrationInfo.refCode}'/>" class="btn btn-primary" target="_blank">PRINT RECEIPT</a><br/>
				<br/><a href="<c:url value='/admin/ReceiptNoSignature/${p.registrationInfo.refCode}'/>" class="btn btn-primary" target="_blank">PRINT RECEIPT NO SIGNATURE</a>
				<c:set var="sendReceiptMsg">SEND RECEIPT</c:set>
				<c:if test="${p.registrationInfo.receiptSent}">
					<c:set var="sendReceiptMsg">SEND RECEIPT AGAIN</c:set>
				</c:if>
				<br/><br/><a id="receiptSent-${p.registrationInfo.refCode}" onclick="sendReceipt('${p.registrationInfo.refCode}')" class="btn btn-primary">${sendReceiptMsg}</a>		
			</c:when>
			<c:otherwise>
				<label>Receipt Number</label>
				<input type="text" class="span2" name="i-${p.registrationInfo.refCode}" id="i-${p.registrationInfo.refCode}"/>
				<label>Receipt Date</label>
				<input type="text" class="span2" name="d-${p.registrationInfo.refCode}" id="d-${p.registrationInfo.refCode}"/>
				<%--
				<label>Receipt Exchange Rate</label>
				<input type="text" class="span2" name="e-${p.registrationInfo.refCode}" id="e-${p.registrationInfo.refCode}"/>
				--%>
				<label>Receipt Total Baht Fee</label>
				<input type="text" class="span2" name="f-${p.registrationInfo.refCode}" id="f-${p.registrationInfo.refCode}"/>
				 
				<br/>
				<div style="text-align:right;">	
				<a class="btn" id="u-${p.registrationInfo.refCode}" onclick="submitMarkPaidForm('${p.registrationInfo.refCode}')">Mark Paid</a>
				</div>	
			</c:otherwise>
		</c:choose>
	</td>
</tr>
</c:forEach>
</table>
</form>

<script type="text/javascript">
function sendReceipt(refCode) {
	// now add spinning thing
	var old_btn_html = $('#receiptSent-'+refCode).html();
	$('#receiptSent-'+refCode).empty();
	$('#receiptSent-'+refCode).toggleClass('disabled');
	$('#receiptSent-'+refCode).html("<img src='/skima2012/resources/images/loading1.gif'/> SENDING");
	$.ajax({
		url: '../sendReceipt/'+refCode,
		success: function(data) {
			alert(data);
			// now change to send again
			$('#receiptSent-'+refCode).html('SEND RECEIPT AGAIN');
			$('#receiptSent-'+refCode).toggleClass('disabled');			
		},
		error: function(data) {
			console.log(data);
			alert("Error sending mail, Please see Server log\nStatus: " + data.status + "\n" + data.statusText );
			$('#receiptSent-'+refCode).html(old_btn_html);
			$('#receiptSent-'+refCode).toggleClass('disabled');
		}
	});
}

function sumitMarkJunkForm(refCode) {
	// mark this refcode Junk!
	$.ajax({
		url: '../toggleJunk',
		data: {
			refCode: refCode
		},
		success: function(data) {
			console.log(data);
			console.log('#junk-'+refCode);
			//change the hilight of this cell?
			
			if($('#junk-'+refCode).html() == 'false') {
				$('#junk-'+refCode).empty();
				$('#junk-'+refCode).append('true');
			} else {
				$('#junk-'+refCode).empty();
				$('#junk-'+refCode).append('false');
			}
		}
	});
}

function submitMarkUnpaidForm(refCode) {
	$.ajax({
		url: '../updateStatus',
		data: {
			refCode: refCode,
			changeToStatus: 'Unpaid'
		},
		success: function(data) {
			if(data=='success') {
				var tdStatus = $('#tdStatus-'+refCode);
				
				console.log(tdStatus);
				
				tdStatus.empty();
				tdStatus.append('Unpaid');
				
				var tdBtn = $('#tdBtn-'+refCode);
				
				
				var unpaidBtn = $('<a href="#" class="btn">Mark paid</a>');
				
				unpaidBtn.click(function(){
					submitMarkPaidForm(refCode);
				});
				
				tdBtn.empty();
				tdBtn.append('<label>Receipt Number</label>');
				tdBtn.append('<input type="text" class="span2" name="i-'+refCode+'" id="i-'+refCode+ '"/>');
				tdBtn.append('<label>Receipt Date</label>');
				var dateInput = $('<input type="text" class="span2" name="d-'+refCode+'" id="d-'+refCode+ '"/>');
				dateInput.datepicker({format: 'dd/mm/yyyy'});
				tdBtn.append(dateInput);
				
				<%--
				tdBtn.append('<label>Receipt Exchange Rate</label>');
				tdBtn.append('<input type="text" class="span2" name="e-'+refCode+'" id="e-'+refCode+ '"/>');
				--%>
				tdBtn.append('<label>Receipt Total Baht Fee</label>');
				tdBtn.append('<input type="text" class="span2" name="f-'+refCode+'" id="f-'+refCode+ '"/>');
				
				
				tdBtn.append('<br/>');
				tdBtn.append(unpaidBtn);
				
				// now we'll have to make this row unPaidCss
				console.log('#row-'+refCode + ' td');
				$('#row-'+refCode + ' td').toggleClass('paidCss');
			}
		}
	});
}

function submitMarkPaidForm(refCode) {
// 	var f = $('form');
// 	$('form input[name=refCode]').attr('value',refCode);
// 	$('form input[name=changeToStatus]').attr('value','Paid');
// 	f.submit();
	console.log("submitMarkPaidForm: " + refCode);
	$.ajax({
		url: '../updateStatus',
		data: {
			refCode: refCode,
			changeToStatus: 'Paid',
			receiptDateString: $('input[id=d-'+refCode+']').val(),
			receiptNo: $('input[id=i-'+refCode+']').val(),
			receiptTotalThaiBaht: $('input[id=f-'+refCode+']').val()
			//receiptExchageRate: $('input[id=e-'+refCode+']').val(),
		},
		success: function(data) {
			
			if(data == 'success') {
				
				var tdStatus = $('#tdStatus-'+refCode);
				
				console.log(tdStatus);
				
				tdStatus.empty();
				tdStatus.append('Paid <br/> ' + $('input[id=i-'+refCode+']').val() + '<br/>' + $('input[id=d-'+refCode+']').val());
				<%--
				tdStatus.append('<br/>@' + $.formatNumber($('input[id=e-'+refCode+']').val(),{format:"#,###.00", locale:"us"}) + ' THB/USD');
				--%>
				tdStatus.append('<br/>= THB' + $.formatNumber($('input[id=f-'+refCode+']').val(),{format:"#,###.00", locale:"us"}));
			
				var tdBtn = $('#tdBtn-'+refCode);
				var unpaidBtn = $('<a href="#" class="btn">Mark Unpaid</a>');
				unpaidBtn.click(function(){
					submitMarkUnpaidForm(refCode);
				});
				  
				tdBtn.empty();
				tdBtn.append(unpaidBtn);
				tdBtn.append('<br/><br/><a href="../Receipt/' + refCode +'" class="btn btn-primary" target="_blank">PRINT RECEIPT</a>');
				tdBtn.append('<br/><a href="../ReceiptNoSignature/' + refCode +'" class="btn btn-primary" target="_blank">PRINT RECEIPT NO SIGNATURE</a>');
				tdBtn.append('<br/><br/><a href="#" id="receiptSent-'+ refCode +'" onclick="sendReceipt(\'' + refCode + '\')" class="btn btn-primary">SEND RECEIPT</a>');
				
				// now we'll have to make this row unPaidCss
				$('#row-'+refCode + ' td').toggleClass('paidCss');
			}
		}
	});
	return false;
}

$(document).ready(function() {
	$('input[id*=d-]').datepicker({format: 'dd/mm/yyyy'});
});
</script>