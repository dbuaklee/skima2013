<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>



<div class="page-header">
	<h2>REGISTER FOR THE SKIMA 2013 CONFERENCE</h2>
</div>

<%--  
	 
<p>Your registration at this point in time will not entitle you to include any paper, 
hence, your paper(s), if any, UNLESS already included by another registration, will NOT 
be included in the Conference Program and Proceedings of SKIMA 2012.</p>

<p>In order to participate in the activities of SKIMA 2012, at least one author of 
each paper must register for the conference. Registrants may register up to two papers 
per registration. Each additional paper incurs a fee of 400 or 200 USD per paper according 
to registration category.</p>

<p>Author registration payment must be made by 15th August 2012; otherwise your paper 
will not be included in the proceedings.</p>

 --%>
 
<p>Online registration is available to those paying by credit card and wire transfer.
If you wish to pay by wire transfer, please complete the online registration, make the 
wire transfer and submit the scanned payment documents to skima2013@gmail.com. </p>

<table id="registrationRateTable" class="table table-bordered">
<tr>
	<th>Registration Rate</th>
	<th width="110"><font style="color: red;">Before 15 November 2013 Advance Rate</font></th>
	<th width="110"><font style="color: red;">After 15 November 2013 On-site rate</font></th>
</tr>
<tr>
	<td>Full Conference Registration</td>
	<td>400 USD</td>
	<td>450 USD</td>
</tr>
<tr>
	<td>Student</td>
	<td>280 USD</td>
	<td>330 USD</td>
</tr>
<tr>
	<td>Local (thai)</td>
	<td>6,000 Thai Baht</td>
	<td>7,500 Thai Baht</td>
</tr>
</table>

<h3>The registration includes:</h3>
<ul>
	<li>Conference program</li>
	<li>Electronic proceedings on USB (Extra electronic proceedings 20 USD) and 1 Inderscience book (After the conference)</li>
	<li>1 Banquet (Extra Banquet 80 USD)</li>
	<li>City Tour</li>
</ul>

<h3>Student Rate</h3>
<p>Need to proof with academic status and / orregistration document to be confirmed as a student.</p>
 
<h3>Cancellation/Transfer Policy</h3>
<p>Cancellation will be dealt case by case after the conference, and may subjected to some charges</p>

<br/>

 
<form:form id="enterRegistration" class="form-horizontal" action="${flowExecutionUrl}" method="POST" commandName="registrator">
	<button type="submit" class="btn btn-primary" name="_eventId_alreadyRegister">I have already registered and want to check my information</button>
	<button type="submit" class="btn btn-primary" name="_eventId_next">I understand and proceed to registration page</button>
</form:form>


