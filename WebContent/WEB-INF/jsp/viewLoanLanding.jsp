<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
	<title>TM - View Loan</title>
</head>
<body>
	<div>
		<form:form action ="/TM_UI/app/loan/update" method="post" modelAttribute="editLoanForm">
			<table>
<!-- 				<tr><th>View Loan</th></tr> -->
<%-- 				<tr><td>Loan id:</td><td><form:input id="loanId" path="loanId" value="${loan.loanId}" type = "number"></form:input></td></tr> --%>
<%-- 				<tr><td>Customer name:</td><td><form:input id="loanId" path="loanId" value="${loan.customer.name}" type = "text"></form:input></td></tr> --%>
<!-- 				<tr><td><button type="submit">Submit</button></td></tr> -->
			</table>
			<table>
				<tr><th>Add Loan</th></tr>
				<tr><td>Date:</td><td><form:input id="loanDate" path="date" value="${loan.date}" type="text"/></td></tr>
				<tr><td>Name:</td><td><form:input id="name" path="customer.name" value="${loan.customer.name}" type="text"/></td></tr>
				<tr><td>Secondary Name:</td><td><form:input id="secondaryName" path="customer.secondaryName" value="${loan.customer.secondaryName}" type="text"/></td></tr>
				<tr><td>Customer ID:</td><td><form:input id="customerId" path="customer.customerId" value="${loan.customer.customerId}" type="number" readonly="true"></form:input></td></tr>
				<tr><td>Customer since:</td><td><form:input id="customerDate" path="customer.date" value="${loan.customer.date}" type="text" readonly="true"></form:input></td></tr>
				<tr><td>Address:</td><td><form:input id="address" path="customer.address" value="${loan.customer.address}" type="text"/></td></tr>
				<tr><td>Post:</td><td><form:input id="post" path="customer.post" value="${loan.customer.post}"/></td></tr>
				<tr><td>PIN:</td><td><form:input id="pin" path="customer.pin" value="${loan.customer.pin}"/></td></tr>
				<tr><td>Phone:</td><td><form:input id="phone" path="customer.phone" value="${loan.customer.phone}"/></td></tr>
				<tr><td>Amount:</td><td><form:input id="amount" path="amount" value="${loan.amount}" type="text"/></td></tr>
			</table>
		</form:form>
	</div>
</body>
</html>