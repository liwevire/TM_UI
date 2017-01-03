<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
	<head>
		<title>TM_UI</title>
		<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"></script>
	</head>
	<body>
		<div>
			<form:form action ="/TM_UI/customer/add" method="post" modelAttribute="customerForm">
				<table>
					<tr><th>Add Customer</th></tr>
					<tr><td>Name:</td><td><form:input id="name" path="name" type="text"/></td></tr>
					<tr><td>Address:</td><td><form:input path="address" type="text"/></td></tr>
					<tr><td>Post:</td><td><form:input path="post" type="text"/></td></tr>
					<tr><td>Pin:</td><td><form:input path="pin" type="text"/></td></tr>
					<tr><td>Phone:</td><td><form:input path="phone" type="text"/></td></tr>
					<tr><td><button type="submit">Add</button></td></tr>
				</table>
			</form:form>
		</div>
		
		
		<script type="text/javascript">
			$(document).ready(function(){
				$("#name").autocomplete({
					source: '${pageContext.request.contextPath}/customer/query'
				})
			})
		</script>
	</body>
</html>