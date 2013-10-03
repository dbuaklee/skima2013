<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<fmt:setLocale value="en_US"/>
<div style="text-align: right;">
<sec:authorize access="hasRole('ROLE_ADMIN')">

<a class="btn btn-primary" href="<c:url value='/admin/allRegisters/ALL?index=0'/>"> Super Admin Page</a>

</sec:authorize>


<a class="btn btn-primary" href="<c:url value='/logout'/>">Admin Logout</a>
</div>
<h1 style="margin-bottom:10px;">Choose filter: <a class="btn btn-info ${ALLactive}" href="ALL?index=0">ALL</a>
<a class="btn btn-info ${PAIDactive}" href="PAID?index=0">PAID</a>
<a class="btn btn-info ${UNPAIDactive}" href="UNPAID?index=0">UNPAID</a>
<a class="btn btn-info ${JUNKactive}" href="JUNK?index=0">JUNK</a>
<a class="btn btn-info ${JUNKactive}" href="ALLJUNK?index=0">ALL+JUNK</a></h1>

<h1>Listing ${filter_title} (${personList.totalElements}) Registers: </h1>
<c:if test="${personList.totalPages>1}">
<div class="pagination">
<ul>
	<c:set var="href"><c:url value="/skimaAdmin/allRegisters/${filter}?index="/></c:set>
	<c:choose>
	<c:when test="${not personList.hasPreviousPage()}">
    	<li class="disabled"><a href="">Prev</a></li>
    </c:when>
    <c:otherwise>
    	<li><a href="${href}${personList.number-1}">Prev</a></li>
    </c:otherwise>
    </c:choose>
    
    <c:forEach var="i" begin="1" end="${personList.totalPages}">
        <c:url var="pageUrl" value="/skimaAdmin/allRegisters/${filter}?index=${i-1}" />
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

<table class="table table-bordered">
<tr>
	<th>refCode</th>
	<th>registerDate</th>
	<th>Name</th>
	<th>Email</th>
	<th>paymentMethod</th>
	<th>paymentStatus</th>
</tr>
<c:forEach items="${personList.content}" var="p">
<c:set var="paidCss"/>
<c:if test="${p.registrationInfo.status eq 'Paid'}">
	<c:set var="paidCss">paidCss</c:set>
</c:if>
<tr>
	<td class="${paidCss}"><a href="<c:url value='/skimaAdmin/registrationDetail?refCode=${p.registrationInfo.refCode}'/>">${p.registrationInfo.refCode}</a><br/>
		${p.registrationInfo.registrationItem}
	</td>
	<td class="${paidCss}"><fmt:formatDate value="${p.registrationInfo.registerDate}" pattern="dd/MM/yyyy"/>
	
	<td class="${paidCss}">${p.title} ${p.firstName} ${p.lastName}</td>
	<td class="${paidCss}">${p.email}</td>
	<td class="${paidCss}">${p.registrationInfo.paymentMethod}</td>
	<td class="${paidCss}" id='tdStatus-${p.registrationInfo.refCode}'> 
		<c:choose>
			<c:when test="${p.registrationInfo.paymentMethod eq 'creditCard' and p.registrationInfo.status eq 'Unpaid'}">
				${p.registrationInfo.creditCardPaymentStatus}
			</c:when>
			<c:otherwise>
				${p.registrationInfo.status}
				<c:if test="${p.registrationInfo.status eq 'Paid'}">
					<br/>Receipt No. ${p.registrationInfo.receiptNo}
					<br/>Receipt Date: <fmt:formatDate value="${p.registrationInfo.receiptDate}" pattern="dd/MM/yyyy"/>
				</c:if>
			</c:otherwise>
		</c:choose>
	</td>
</tr>
</c:forEach>
</table>
