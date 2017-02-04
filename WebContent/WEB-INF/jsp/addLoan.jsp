<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>TM_UI</title>
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
			<form:form modelAttribute="addLoanForm">
				<table>
					<tr><th>Add Loan</th></tr>
<%-- 					<tr><td>Date:</td><td><form:input id="loanDate" path="date" type="text"/></td></tr> --%>
					<tr><td>Name:</td><td><form:input id="name" path="customer.name" type="text" onchange="clearDetails()"/></td></tr>
					<tr><td>Secondary Name:</td><td><form:input id="secondaryName" path="customer.secondaryName" type="text"/></td></tr>
					<tr><td>Customer ID:</td><td><form:input id="customerId" path="customer.customerId" type="number" readonly="true"></form:input></td></tr>
					<tr><td>Customer since:</td><td><form:input id="customerDate" path="customer.date" type="text" readonly="true"></form:input></td></tr>
					<tr><td>Address:</td><td><form:input id="address" path="customer.address" type="text"/></td></tr>
					<tr><td>Post:</td><td><form:input id="post" path="customer.post"/></td></tr>
					<tr><td>PIN:</td><td><form:input id="pin" path="customer.pin"/></td></tr>
					<tr><td>Phone:</td><td><form:input id="phone" path="customer.phone"/></td></tr>
<%-- 					<tr><td>Principal:</td><td><form:input id="principal" path="principal" type="text"/></td></tr> --%>
				</table>
				<table>
					<tr><th>Transaction Details</th></tr>
					<tr>
						<td>Date:</td><td><form:input id="loanDate" class="date" path="transactions[0].date" type="text" onchange="setInterestDate()"/></td>
						<td>Category:</td><td><form:input path="transactions[0].category" type="text" value="principal" hidden="true"/></td>
						<td>Amount:</td><td><form:input id="principalAmount" path="transactions[0].Amount" type="text" value="0" onchange="calculateInterest()"/></td>
					</tr>
					<tr>
						<td>Date:</td><td><form:input id="interestDate" path="transactions[1].date" type="text" readonly="true"/></td>
						<td>Category:</td><td><form:input path="transactions[1].category" type="text" value="return_on_interest" hidden="true"/></td>
						<td>Amount:</td><td><form:input id="interestAmount" path="transactions[1].Amount" type="text" value="0" readonly="true"/></td>
					</tr>
				</table>
				<table id="listItems">
						<tr><th>Add Items</th></tr>
						<tr><td>Name</td><td>Weight</td></tr>
						<tr><td><input name="items[0].name" type="text"/></td><td><input name="items[0].weight" type="text"/></td><td><input type="button" onclick="addMoreItem()" value="Add more items"/></td></tr>
				</table>
				<input id="formSubmit" type="submit" value="Submit"/><input id="formReset" type="reset" value="Reset"/>
			</form:form>
		</div>
		
		<script type="text/javascript">
			itemListId = 1;
			$(document).ready(function(){
				$("#name").autocomplete({
					source: '${pageContext.request.contextPath}/app/customer/getNameList',
					select: function(event, ui) {
						$('#name').val(ui.item.name);
						$('#secondaryName').val(ui.item.secondaryName);
						$('#customerId').val(ui.item.customerId);
						$('#customerDate').val($.format.date(new Date(ui.item.date), "MM/dd/yyyy hh:mm a"));
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
				$('.date').datetimepicker();
				$(".date").on("change", function(e){
					$(".date").data('xdsoft_datetimepicker').setOptions({format:'m/d/Y h:i A'});
				});
			});
			function setInterestDate(){
				$("#interestDate").val($("#loanDate").val());
			}
			function calculateInterest(){
				var principal = $("#principalAmount").val();
				var interest = (principal*.03)+5;
				$("#interestAmount").val(interest);
			}
			function addMoreItem(){
				itemRow="<tr id = \"moreRow"+itemListId+"\"><td><input name=\"items["+itemListId+"].name\" type=\"text\"/></td>";
				itemRow+="<td><input name=\"items["+itemListId+"].weight\" type=\"text\"/></td>";
				if(itemListId == 1){
					itemRow+="<td><input type=\"button\" onclick=\"removeItem()\" value=\"Remove item\"/></td>";
				}
				itemRow+="</tr>";
				itemListId += 1;
 				$("#listItems").append(itemRow);
			}
			function removeItem(){
				itemListId -= 1;
 				$("#moreRow"+itemListId).remove();
			}
			function clearDetails(){
				$('#secondaryName').val('');
				$('#customerId').val('0');
				$('#customerDate').val($.format.date(new Date(), "MM/dd/yyyy hh:mm a"));
				$('#address').val('');
				$('#post').val('');
				$('#pin').val('');
				$('#phone').val('');
			}
		</script>
	</body>
</html>
