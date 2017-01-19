<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
	<title>TM - View Loan</title>
</head>
<body>
	<div>
		<form:form action ="/TM_UI/app/loan/view" method="post" modelAttribute="editLoanForm">
			<table>
				<tr><th>View Loan</th></tr>
				<tr><td>Loan id:</td><td><form:input id="loanId" path="loanId" type = "number"></form:input></td></tr>
				<tr><td><button type="submit">Submit</button></td></tr>
			</table>
		</form:form>
	</div>
</body>
</html>