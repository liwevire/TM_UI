<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
	<head>
		<title>TM_UI</title>
<!-- 		<script type="text/javascript" src="/TM_UI/resources/jquery-1.7.2.min.js"></script> -->
<!-- 		<script type="text/javascript" src="/TM_UI/resources/jquery-ui-1.8.18.min.js"></script> -->
<!-- 		<link rel="stylesheet" type="text/css" href="/TM_UI/resources/jquery-ui-1.8.24.css" /> -->
		
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"></script>
<!-- 		<link rel="stylesheet" type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery.ui.all.css" /> -->
		<link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.9.1/themes/ui-lightness/jquery-ui.css" />
	</head>
	<body>
		<div>
			<form:form modelAttribute="loanForm">
				<table>
					<tr><th>Add Loan</th></tr>
<%-- 					<tr><td>Date:</td><td><form:input id="date" path="date" /></tr> --%>
					<tr><td>Name:</td><td><form:input id="name" path="customer.name" type="text" onblur="fillSecondaryName()"/></td></tr>
					<tr><td>Secondary Name:</td><td><form:input id="secondaryName" path="customer.secondaryName" type="text" onblur="selectAddress()"/></td></tr>
					<tr><td>Customer ID:</td><td><form:input id="id" path="customer.customerId" disabled="true"></form:input></td></tr>
					<tr><td>Address:</td><td><form:input id="address" path="customer.address" type="text"/></td></tr>
					<tr><td>Post:</td><td><form:input id="post" path="customer.post"/></td></tr>
					<tr><td>PIN:</td><td><form:input id="pin" path="customer.pin"/></td></tr>
					<tr><td>Phone:</td><td><form:input id="phone" path="customer.phone"/></td></tr>
					<tr><td>Amount:</td><td><form:input path="amount" type="text"/></td></tr>
					<tr><td>Item:</td><td><form:input path="item" type="text"/></td></tr>
					<tr><td>Weight:</td><td><form:input path="weight" type="text"/></td></tr>
				</table>
			</form:form>
			<button id="addCustomer" onclick="addCustomer()">Submit</button>
		</div>
<!-- 		Hidden divs during page load -->
		<div id="addressSelectDialog" title="Select address"></div>
		<div id="addLoanDialog" title="Loan Status"></div>
		
		<script type="text/javascript">
			var customerList = new Array();
			$(document).ready(function(){
				$("#name").autocomplete({
					source: '${pageContext.request.contextPath}/app/customer/nameList',
				});
				$("#addressSelectDialog").dialog({
		               autoOpen: false,  
		        });
				$("#addLoanDialog").dialog({
		               autoOpen: false,  
		        });
			})
			function addCustomer(){
				$("#addLoanDialog").html("");
				$.post("http://localhost:8080/TM_UI/app/loan/add",
					{
						'customer.name':$("#name").val().trim(),
						'customer.secondaryName':$("#secondaryName").val().trim(),
						'customer.id':$("#id").val().trim(),
						'customer.address':$("#address").val().trim(),
						'customer.post':$("#post").val().trim(),
						'customer.pin':$("#pin").val().trim(),
						'customer.phone':$("#phone").val().trim(),
						amount:$("#amount").val().trim(),
						item:$("#item").val().trim(),
						weight:$("#weight").val().trim()
					},
					function(result){
						$("#addLoanDialog").append(result);
// 						$("#addLoanDialog").append("</br><button onclick=\"$(\"#addLoanDialog\").dialog(\"close\")\">Close</button>");
					}					
				)
				$("#addLoanDialog" ).dialog("open");
			}
			function fillSecondaryName() {
				if ($("#name")!=null&&$("#name").val().includes('-')){
					var nameDetail = $("#name").val().trim();
					nameList = nameDetail.split('-');
					document.getElementById('name').value=nameList[0].trim();
					document.getElementById('secondaryName').value=nameList[1].trim();
					$.getJSON("http://localhost:8080/TM_UI/app/customer/find",
						{
							name:nameList[0],
							secondaryName:nameList[1]
						},
						function(result){
							customerList = result;
			        	});
				}
			}
			function selectAddress(){
// 				assign value if one address is present
				$("#addressSelectDialog").html("");
				$.each(customerList, function(i, customer){
					htmlButton="<button onclick=\"selectedCustomer("+(customer.id)+")\">"+(customer.address)+"</button> ";
            		$("#addressSelectDialog").append(htmlButton);
        		});
				$("#addressSelectDialog").dialog( "open" );
			}
			function selectedCustomer(id) {
				$("#addressSelectDialog").dialog( "close" );
				$.each(customerList, function(i, customer){
					if (id == customer.id){
						document.getElementById("id").value=customer.id;
						document.getElementById("post").value=customer.post;
						document.getElementById("pin").value=customer.pin;
						document.getElementById("phone").value=customer.phone;
					}
				});
			}
		</script>
	</body>
</html>