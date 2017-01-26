<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>TM - View Loan</title>
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
		<form:form action ="/TM_UI/app/loan/update" method="post" modelAttribute="editLoanForm">
			<table>
				<tr><th>Edit Loan</th></tr>
				<tr><td>Loan Id:</td><td><form:input id="loanId" path="loanId" value="${loan.loanId}" type="text"/></td></tr>
				<tr><td>Date:</td><td><form:input id="loanDate" class="editable" path="date" value="${loan.date}" type="text"/></td></tr>
				<tr><td>Name:</td><td><form:input id="name" class="editable" path="customer.name" value="${loan.customer.name}" type="text" readonly="true"/></td></tr>
				<tr><td>Secondary Name:</td><td><form:input class="editable" id="secondaryName" path="customer.secondaryName" value="${loan.customer.secondaryName}" type="text" readonly="true"/></td></tr>
				<tr><td>Customer ID:</td><td><form:input id="customerId" path="customer.customerId" value="${loan.customer.customerId}" type="number" readonly="true"></form:input></td></tr>
				<tr><td>Customer since:</td><td><form:input id="customerDate" path="customer.date" value="${loan.customer.date}" type="text" readonly="true"></form:input></td></tr>
				<tr><td>Address:</td><td><form:input id="address" class="editable" path="customer.address" value="${loan.customer.address}" type="text" readonly="true"/></td></tr>
				<tr><td>Post:</td><td><form:input id="post" class="editable" path="customer.post" value="${loan.customer.post}" readonly="true"/></td></tr>
				<tr><td>PIN:</td><td><form:input id="pin" class="editable" path="customer.pin" value="${loan.customer.pin}" readonly="true"/></td></tr>
				<tr><td>Phone:</td><td><form:input id="phone" class="editable" path="customer.phone" value="${loan.customer.phone}" readonly="true"/></td></tr>
				<tr><td>Amount:</td><td><form:input id="amount" class="editable" path="amount" value="${loan.amount}" type="text" readonly="true"/></td></tr>
			</table>
			<table id="listItems">
				<tr><th>Add Items</th></tr>
				<tr><td>Name</td><td>Weight</td></tr>
				<c:set var="itemListId" scope="page" value="0"></c:set>
				<c:forEach items="${loan.items}" var="item">
					<c:if test="${itemListId eq 0}">
						<tr>
							<td><input class="editable" name="items[${itemListId}].name" type="text" value="${item.name}" readonly/></td>
							<td><input class="editable" name="items[${itemListId}].weight" type="text" value="${item.weight}" readonly/></td>
							<td><input type="button" onclick="addMoreItem()" value="Add more items" disabled/></td>
						</tr>
					</c:if>
					<c:if test="${itemListId ne 0}">
						<tr id="moreRow${itemListId}">
							<td><input class="editable" name="items[${itemListId}].name" type="text" value="${item.name}" readonly/></td>
							<td><input class="editable" name="items[${itemListId}].weight" type="text" value="${item.weight}" readonly/></td>
						</tr>
					</c:if>
					<c:set var="itemListId" value="${itemListId+1}"></c:set>
				</c:forEach>
			</table><br>
			<input id="formSubmit" type="submit" value="Submit" disabled hidden="true"/>
		</form:form>
		<input type="button" id="enableEdit" value="Click here to edit" onclick="enableEdit()"/>
	</div>
	<script type="text/javascript">
		itemListId = +"${itemListId}";
		$(document).ready(function(){
			removeButton='';			
			if(${itemListId} > 0){
				removeButton+="<td><input type=\"button\" onclick=\"removeItem()\" value=\"Remove item\" disabled/></td>";
			}
			$("#moreRow1").append(removeButton);
		});
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
		function enableEdit() {
			$(".editable").removeAttr("readonly");
			$("input[disabled]").removeAttr("disabled");
			$("input[hidden]").removeAttr("hidden");
			$("#enableEdit").remove();
		}
	</script>
</body>
</html>