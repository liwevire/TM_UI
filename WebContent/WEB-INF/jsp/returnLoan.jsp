<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<title>TM - View Loan</title>
	<script src="/TM_UI/resources/js/jquery-3.1.1.min.js"></script>
	<script src="/TM_UI/resources/js/jquery-ui.min.js"></script>
	<script src="/TM_UI/resources/js/jquery.datetimepicker.full.min.js"></script>
	<script src="/TM_UI/resources/js/jquery-dateFormat.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="/TM_UI/resources/js/jquery-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="/TM_UI/resources/js/jquery.datetimepicker.min.css" />
	
	<style>
	  .ui-autocomplete-loading {
	    background: white url("/TM_UI/resources/images/ui-anim_basic_16x16.gif") right center no-repeat;
	  }
	</style>
</head>
<body>
	<div>
		<form:form action ="/TM_UI/app/loan/update" method="post" modelAttribute="editLoanForm">
			<table>
				<tr><th>Edit Loan</th></tr>
				<tr><td>Loan Id:</td><td><form:input id="loanId" path="loanId" type="text" readonly="true"/></td></tr>
<%-- 				<tr><td>Date:</td><td><form:input id="loanDate" class="editable" path="date" type="text" readonly="true"/></td></tr> --%>
				<tr><td>Name:</td><td><form:input id="name" class="editable" path="customer.name" onchange="clearDetails()" type="text" readonly="true"/></td></tr>
				<tr><td>Secondary Name:</td><td><form:input class="editable" id="secondaryName" path="customer.secondaryName" type="text" readonly="true"/></td></tr>
				<tr><td>Customer ID:</td><td><form:input id="customerId" path="customer.customerId" type="number" readonly="true"/></td></tr>
				<tr><td>Customer since:</td><td><form:input id="customerDate" path="customer.date" type="text" readonly="true"/></td></tr>
				<tr><td>Address:</td><td><form:input id="address" class="editable" path="customer.address" type="text" readonly="true"/></td></tr>
				<tr><td>Post:</td><td><form:input id="post" class="editable" path="customer.post" readonly="true"/></td></tr>
				<tr><td>PIN:</td><td><form:input id="pin" class="editable" path="customer.pin" readonly="true"/></td></tr>
				<tr><td>Phone:</td><td><form:input id="phone" class="editable" path="customer.phone" readonly="true"/></td></tr>
				<tr><td>Principal:</td><td><form:input id="principal" class="editable" path="principal" type="text" readonly="true"/></td></tr>
			</table>
			<table id="listItems">
				<tr><th>Add Items</th></tr>
				<tr><td>Name</td><td>Weight</td></tr>
				<c:set var="itemListId" scope="page" value="0"></c:set>
				<c:if test="${fn:length(loan.items) le 0}">
					<tr id="moreRow0">
						<td><input name="items[0].name" class="editable" type="text" readonly/></td>
						<td><input name="items[0].weight" class="editable" type="text" readonly/></td>
						<td><input type="button" onclick="addMoreItem()" value="Add more items" disabled/></td>
						<c:set var="itemListId" value="${itemListId+1}"></c:set>
					</tr>
				</c:if>
				<c:forEach items="${loan.items}" var="item">
					<tr id="moreRow${itemListId}">
						<td><input name="items[${itemListId}].name" class="editable" value="${item.name}" type="text" readonly/></td>
						<td><input name="items[${itemListId}].weight" class="editable" value="${item.weight}" type="text" readonly/></td>
						<c:if test="${itemListId eq 0}">
							<td><input type="button" onclick="addMoreItem()" value="Add more items" disabled/></td>
						</c:if>
					</tr>
					<c:set var="itemListId" value="${itemListId+1}"></c:set>
				</c:forEach>
			</table>
			<table id="returnEntry">
				<tr><th>Loan return</th></tr>
				<tr><td>Return date:</td><td><form:input id="returnDate" path="returnDate" type="text"/></td></tr>
				<tr>
					<td>Loan status:</td>
					<td><form:select id="loanStatus" path="loanStatus" type="checkbox">
						<form:option value="open">Open</form:option>
						<form:option value="open">Closed</form:option>
						<form:option value="open">Re-loan</form:option>
					</form:select></td>
				</tr>
				<tr><td>Return amount:</td><td><form:input id="returnAmount" path="returnAmount" type="text"/></td></tr>
				<tr><td>Loan comments:</td><td><form:input id="comments" path="comments" type="text"/></td></tr>
			</table>
			<input id="formSubmit" type="submit" value="Submit"/><input id="formReset" type="reset" value="Reset"/>
		</form:form>
	</div>
	<script type="text/javascript">
		itemListId = +"${itemListId}";
		$(document).ready(function(){
			$("#returnDate").on("change", function(e){
				$("#returnDate").data('xdsoft_datetimepicker').setOptions({format:'m/d/Y h:i A'});
			});
			$("#loanDate").on("change", function(e){
				$("#loanDate").data('xdsoft_datetimepicker').setOptions({format:'m/d/Y h:i A'});
			});
		});
		$('#returnDate').datetimepicker();
	</script>
</body>
</html>