<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
	<title>TM - View Loan</title>
</head>
<body>
	<div>
		<form:form action ="view" method="get" modelAttribute="viewLoanForm">
			<table>
				<tr><th>Enter the loan no.</th></tr>
				<tr><td>Loan id:</td><td><form:input id="loanId" path="loanId" type = "number"></form:input></td></tr>
<!-- 				<tr><td>Action:</td><td><input type="radio" name="action" value="edit" checked/>Edit <input type="radio" name="action" value="return"/>Return</td></tr> -->
				<tr><td><button type="submit">Submit</button></td></tr>
			</table>
		</form:form>
	</div>
</body>
</html>