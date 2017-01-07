<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>TM_UI</title>
  		<script src="/TM_UI/resources/js/jquery-3.1.1.min.js"></script>
  		<script src="/TM_UI/resources/js/jquery-ui.min.js"></script>
		
		<link rel="stylesheet" type="text/css" href="/TM_UI/resources/js/jquery-ui.min.css" />
		
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
					<tr><td>Name:</td><td><form:input id="name" path="customer.name" type="text"/></td></tr>
					<tr><td>Secondary Name:</td><td><form:input id="secondaryName" path="customer.secondaryName" type="text"/></td></tr>
					<tr><td>Customer ID:</td><td><form:input id="customerId" path="customer.customerId" disabled="true"></form:input></td></tr>
					<tr><td>Address:</td><td><form:input id="address" path="customer.address" type="text"/></td></tr>
					<tr><td>Post:</td><td><form:input id="post" path="customer.post"/></td></tr>
					<tr><td>PIN:</td><td><form:input id="pin" path="customer.pin"/></td></tr>
					<tr><td>Phone:</td><td><form:input id="phone" path="customer.phone"/></td></tr>
					<tr><td>Amount:</td><td><form:input id="amount" path="amount" type="text"/></td></tr>
				</table>
				<table id="addItems">
						<tr><th>Add Items</th></tr>
						<tr><td>Name</td><td>Weight</td></tr>
						<tr><td><input name="items[0].name" type="text"/></td><td><input name="items[0].weight" type="text"/></td><td><input type="button" onclick="addMoreItem()" value="Add more items"/></td></tr>
				</table>
				<input type="submit" value="Submit"/>
			</form:form>
		</div>
		
		<script type="text/javascript">
			//var customerList = new Array();
			//var itemListId = 0;
			$(document).ready(function(){
				$("#name").autocomplete({
					source: '${pageContext.request.contextPath}/app/customer/getNameList',
					select: function(event, ui) {
						$('#name').val(ui.item.name);
						$('#secondaryName').val(ui.item.secondaryName);
						$('#customerId').val(ui.item.customerId);
						$('#address').val(ui.item.address);
						$('#post').val(ui.item.post);
						$('#pin').val(ui.item.pin);
						$('#phone').val(ui.item.phone);
						return false;
					}
				}).autocomplete( "instance" )._renderItem = function( ul, item ) {
				      return $( "<li>" )
				        .append( "<div>" + item.name +' - '+ item.secondaryName+  "<br>" + item.address+"<br>" + item.post+ "</div>" )
				        .appendTo( ul );
				};
			});
			function addMoreItem(){
				itemListId += 1;
				itemRow="<tr><td><input name=\"items["+itemListId+"].name\" type=\"text\"/></td>";
				itemRow+="<td><input name=\"items["+itemListId+"].weight\" type=\"text\"/></td></tr>";
 				$("#addItems").append(itemRow);
			}
			$('#date').datepicker({defaultDate:new Date()});
		</script>
	</body>
</html>