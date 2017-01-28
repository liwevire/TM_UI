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
				<tr><td>Date:</td><td><form:input id="loanDate" class="editable" path="date" type="text" readonly="true"/></td></tr>
				<tr><td>Name:</td><td><form:input id="name" class="editable" path="customer.name" onchange="clearDetails()" type="text" readonly="true"/></td></tr>
				<tr><td>Secondary Name:</td><td><form:input class="editable" id="secondaryName" path="customer.secondaryName" type="text" readonly="true"/></td></tr>
				<tr><td>Customer ID:</td><td><form:input id="customerId" path="customer.customerId" type="number" readonly="true"></form:input></td></tr>
				<tr><td>Customer since:</td><td><form:input id="customerDate" path="customer.date" type="text" readonly="true"></form:input></td></tr>
				<tr><td>Address:</td><td><form:input id="address" class="editable" path="customer.address" type="text" readonly="true"/></td></tr>
				<tr><td>Post:</td><td><form:input id="post" class="editable" path="customer.post" readonly="true"/></td></tr>
				<tr><td>PIN:</td><td><form:input id="pin" class="editable" path="customer.pin" readonly="true"/></td></tr>
				<tr><td>Phone:</td><td><form:input id="phone" class="editable" path="customer.phone" readonly="true"/></td></tr>
				<tr><td>Principal:</td><td><form:input id="principal" class="editable" path="principal" type="text" readonly="true"/></td></tr>
			</table>
			<table id="listItems">
				<tr><th>Add Items</th></tr>
				<tr><td>Name</td><td>Weight</td></tr>
				<c:set var="itemListId" scope="page" value="0"></c:set>
				<c:if test="${fn:length(loan.items) le 0}">
					<tr id="moreRow0">
						<td><input name="items[0].name" class="editable" type="text" readonly/></td>
						<td><input name="items[0].weight" class="editable" type="text" readonly/></td>
						<td><input type="button" onclick="addMoreItem()" value="Add more items" disabled/></td>
						<c:set var="itemListId" value="${itemListId+1}"></c:set>
					</tr>
				</c:if>
				<c:forEach items="${loan.items}" var="item">
					<tr id="moreRow${itemListId}">
						<td><input name="items[${itemListId}].name" class="editable" value="${item.name}" type="text" readonly/></td>
						<td><input name="items[${itemListId}].weight" class="editable" value="${item.weight}" type="text" readonly/></td>
						<c:if test="${itemListId eq 0}">
							<td><input type="button" onclick="addMoreItem()" value="Add more items" disabled/></td>
						</c:if>
					</tr>
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
				removeButton+="<td><input type=\"button\" onclick=\"removeItem()\" value=\"Remove item\" disabled/></td>";
			}
			$("#moreRow1").append(removeButton);
			$("#loanDate").on("change", function(e){
				$("#loanDate").data('xdsoft_datetimepicker').setOptions({format:'m/d/Y h:i A'});
			});
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
			$(".editable").removeAttr("readonly");
			$("input[disabled]").removeAttr("disabled");
			$("input[hidden]").removeAttr("hidden");
			$("#enableEdit").remove();
			$('#loanDate').datetimepicker({formatTime:'H'});
		}
	</script>
</body>
</html>