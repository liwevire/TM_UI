<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<style>
		  .ui-autocomplete-loading {
		    background: white url("/TM_UI/resources/images/ui-anim_basic_16x16.gif") right center no-repeat;
		  }
		</style>
	</head>
	<body>
		<div>
			<form:form modelAttribute="loanForm">
				<table>
					<tr><th>Add Loan</th></tr>
					<tr><td>Date:</td><td><form:input id="date" path="date" type="text"/></td></tr>
					<tr><td>Name:</td><td><form:input id="name" path="customer.name" type="text" onblur="fillSecondaryName()"/></td></tr>
					<tr><td>Secondary Name:</td><td><form:input id="secondaryName" path="customer.secondaryName" type="text" onblur="selectAddress()"/></td></tr>
					<tr><td>Customer ID:</td><td><form:input id="id" path="customer.customerId" disabled="true"></form:input></td></tr>
					<tr><td>Address:</td><td><form:input id="address" path="customer.address" type="text"/></td></tr>
					<tr><td>Post:</td><td><form:input id="post" path="customer.post"/></td></tr>
					<tr><td>PIN:</td><td><form:input id="pin" path="customer.pin"/></td></tr>
					<tr><td>Phone:</td><td><form:input id="phone" path="customer.phone"/></td></tr>
					<tr><td>Amount:</td><td><form:input id="amount" path="amount" type="text"/></td></tr>
<%-- 					<tr><td>Item:</td><td><form:input path="item" type="text"/></td></tr> --%>
<%-- 					<tr><td>Weight:</td><td><form:input path="weight" type="text"/></td></tr> --%>

				</table>
				<table id="addItems">
						<tr><th>Add Items</th></tr>
						<tr><td>Name</td><td>Weight</td></tr>
						<tr><td><input name="items[0].name" type="text"/></td><td><input name="items[0].weight" type="text"/></td><td><input type="button" onclick="addMoreItem()" value="Add more items"/></td></tr>
				</table>
				<input type="submit" value="Submit"/>
			</form:form>
		</div>
<!-- 		Hidden divs during page load -->
		<div id="addressSelectDialog" title="Select address"></div>
		<div id="addLoanDialog" title="Loan Status"></div>
		
		<script type="text/javascript">
			var customerList = new Array();
			var itemListId = 0;
			$(document).ready(function(){
				$("#name").autocomplete({
					source: '${pageContext.request.contextPath}/app/customer/getNameList',
				});
				$("#addressSelectDialog").dialog({
		               autoOpen: false,  
		        });
				$("#addLoanDialog").dialog({
		               autoOpen: false,  
		        });
			})
			function fillSecondaryName() {
				if ($("#name")!=null&&$("#name").val().includes('-')){
					var nameDetail = $("#name").val().trim();
					nameList = nameDetail.split('-');
					document.getElementById('name').value=nameList[0].trim();
					document.getElementById('secondaryName').value=nameList[1].trim();
					$.getJSON("http://localhost:6080/TM_UI/app/customer/find",
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
// 				TODO: assign value if one address is present
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
			function addMoreItem(){
				itemListId += 1;
				itemRow="<tr><td><input name=\"items["+itemListId+"].name\" type=\"text\"/></td>";
				itemRow+="<td><input name=\"items["+itemListId+"].weight\" type=\"text\"/></td></tr>";
// 				itemRow="<tr><td><input type=\"button\" onclick=\"addMoreItem("+id+")\">Add more items</input></td></tr>";
 				$("#addItems").append(itemRow);
			}
			$('#date').datepicker({defaultDate:new Date()});
		</script>
	</body>
</html>