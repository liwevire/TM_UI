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
				<tr><td>Customer ID:</td><td><form:input id="customerId" path="customer.customerId" type="number" readonly="true"></form:input></td></tr>
				<tr><td>Customer since:</td><td><form:input id="customerDate" path="customer.date" type="text" readonly="true"></form:input></td></tr>
				<tr><td>Address:</td><td><form:input id="address" class="editable" path="customer.address" type="text" readonly="true"/></td></tr>
				<tr><td>Post:</td><td><form:input id="post" class="editable" path="customer.post" readonly="true"/></td></tr>
				<tr><td>PIN:</td><td><form:input id="pin" class="editable" path="customer.pin" readonly="true"/></td></tr>
				<tr><td>Phone:</td><td><form:input id="phone" class="editable" path="customer.phone" readonly="true"/></td></tr>
<%-- 				<tr><td>Principal:</td><td><form:input id="principal" class="editable" path="principal" type="text" readonly="true"/></td></tr> --%>
			</table>
			<table id="listTransactions">
				<tr><th>Transactions</th></tr>
				<tr><td>Date</td><td>Category</td><td>Amount</td></tr>
				<c:set var="transactionListId" scope="page" value="0"></c:set>
				<c:forEach items="${loan.transactions}" var="transaction">
					<tr id="moreTransactionRow${transactionListId}">
						<td>
							<input class="date editable" 
								<c:if test="${transactionListId eq 0}">id="loanDate"</c:if>
								<c:if test="${transactionListId eq 1}">id="interestDate"</c:if>	
								name="transaction[${transactionListId}].date" type="text" value="${transaction.date}" readonly="readonly">
						</td>
						<td>
							<input 
								<c:if test="${transactionListId le 1}">readonly="true"</c:if>
								name="transaction[${transactionListId}].category" type="text" value="${transaction.category}">
						</td>
						<td>
							<input class="editable"
								<c:if test="${transactionListId eq 0}">onchange="calculateInterest()" id="principalAmount"</c:if>
								<c:if test="${transactionListId eq 1}">onchange="calculateInterest()" id="interestAmount"</c:if>
								name="transaction[${transactionListId}].amount" type="text" value="${transaction.amount}" readonly="readonly"></td>
						<c:if test="${transactionListId eq 0}">
							<td><input type="button" onclick="addMoreTransactionItem()" value="Add more items" disabled/></td>
						</c:if>
						<c:if test="${transactionListId eq 1}">
							<td><input id="removeTransactionItem" type="button" onclick="removeTransaction()" value="Remove transaction" disabled/></td>
						</c:if>
					</tr>
					<c:set var="transactionListId" value="${transactionListId+1}"></c:set>
				</c:forEach>
			</table>
			<table id="listItems">
				<tr><th>Add Items</th></tr>
				<tr><td>Name</td><td>Weight</td></tr>
				<c:set var="itemListId" scope="page" value="0"></c:set>
				<c:if test="${fn:length(loan.items) le 0}">
					<tr id="moreItemRow0">
						<td><input name="items[0].name" class="editable" type="text" readonly/></td>
						<td><input name="items[0].weight" class="editable" type="text" readonly/></td>
						<td><input type="button" onclick="addMoreListItem()" value="Add more items" disabled/></td>
						<c:set var="itemListId" value="${itemListId+1}"></c:set>
					</tr>
				</c:if>
				<c:forEach items="${loan.items}" var="item">
					<tr id="moreItemRow${itemListId}">
						<td><input name="items[${itemListId}].name" class="editable" value="${item.name}" type="text" readonly/></td>
						<td><input name="items[${itemListId}].weight" class="editable" value="${item.weight}" type="text" readonly/></td>
						<c:if test="${itemListId eq 0}">
							<td><input type="button" onclick="addMoreListItem()" value="Add more items" disabled/></td>
						</c:if>
					</tr>
					<c:set var="itemListId" value="${itemListId+1}"></c:set>
				</c:forEach>
			</table><br>
			<input id="formSubmit" type="submit" value="Submit" disabled hidden="true"/><input id="formReset" type="reset" value="Reset" disabled hidden="true"/>
		</form:form>
		<input type="button" id="enableEdit" value="Click here to edit" onclick="enableEdit()"/>
	</div>
	<script type="text/javascript">
		itemListId = +"${itemListId}";
		transactionListId = +"${transactionListId}";
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
			removeButton='';			
			if(${itemListId} > 0){
				removeButton+="<td><input type=\"button\" onclick=\"removeListItem()\" value=\"Remove item\" disabled/></td>";
			}
			$("#moreItemRow1").append(removeButton);
			$(".date").on("change", function(e){
				$(".date").data('xdsoft_datetimepicker').setOptions({format:'m/d/Y h:i A'});
			});
			$("#loanDate").on("change", function(e){
				$("#interestDate").val($("#loanDate").val());
			});
		});
		function addMoreListItem(){
			itemRow="<tr id = \"moreItemRow"+itemListId+"\"><td><input name=\"items["+itemListId+"].name\" type=\"text\"/></td>";
			itemRow+="<td><input name=\"items["+itemListId+"].weight\" type=\"text\"/></td>";
			if(itemListId == 1){
				itemRow+="<td><input type=\"button\" onclick=\"removeListItem()\" value=\"Remove item\"/></td>";
			}
			itemRow+="</tr>";
			itemListId += 1;
			$("#listItems").append(itemRow);
		}
		function calculateInterest(){
			var principal = $("#principalAmount").val();
			var interest = (principal*.03)+5;
			$("#interestAmount").val(interest);
			alert($("#principalAmount").val());
			alert($("#interestAmount").val());
		}
		function removeListItem(){
			itemListId -= 1;
			$("#moreItemRow"+itemListId).remove();
		}
		function addMoreTransactionItem(){
			transactionRow="<tr id = \"moreTransactionRow"+transactionListId+"\"><td><input class=\"date\" name=\"transactions["+transactionListId+"].date\" type=\"text\"/></td>";
			transactionRow+="<td><input name=\"transactions["+transactionListId+"].category\" type=\"text\"/></td>";
			transactionRow+="<td><input name=\"transactions["+transactionListId+"].amount\" type=\"text\"/></td>";
			transactionRow+="</tr>";
			transactionListId += 1;
			$("#listTransactions").append(transactionRow);
			if(transactionListId == 3){
				alert("remove attribute");
				$("#removeTransactionItem").removeAttr("disabled");
			}
		}
		function removeTransaction(){
			transactionListId -= 1;
			$("#moreTransactionRow"+transactionListId).remove();
			if(transactionListId<3){
				alert("add attribute");
				$("#removeTransactionItem").attr("disabled", "disabled");
			}
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
		function enableEdit() {
			$('.date').datetimepicker();
			$(".editable").removeAttr("readonly");
			$("input[disabled]").removeAttr("disabled");
			$("input[hidden]").removeAttr("hidden");
			$("#enableEdit").remove();
			$('#loanDate').datetimepicker();
		}
	</script>
</body>
</html>