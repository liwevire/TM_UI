<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>TM_UI</title>
  		<script type="text/javascript" src="/TM_UI/resources/js/jquery-3.1.1.min.js"></script>
  		<script type="text/javascript" src="/TM_UI/resources/js/jquery-ui.min.js"></script>
<!-- 		<script type="text/javascript" src="/TM_UI/resources/js/jquery.datetimepicker.full.min.js" defer></script> -->
		<script type="text/javascript" src="/TM_UI/resources/js/jquery-dateFormat.min.js" defer></script> 
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 		<link rel="stylesheet" type="text/css" href="/TM_UI/resources/js/jquery-ui.min.css"/> -->
<!-- 		<link rel="stylesheet" type="text/css" href="/TM_UI/resources/js/jquery.datetimepicker.min.css" /> -->
		<style>
		  .ui-autocomplete-loading {
		    background: white url("/TM_UI/resources/images/ui-anim_basic_16x16.gif") right center no-repeat;
		  }
		</style>
	</head>
	<body style="overflow: hidden; width: 565px;">
		<form:form modelAttribute="addLoanForm">
				<h5>Add Loan</h5>
				<b>Customer details</b>
				<div><form:input id="name" path="customer.name" type="text" class='autocomplete' onfocus="clearDetails()"/> First Name </div>
				<div><form:input id="secondaryName" path="customer.secondaryName" type="text"/> Secondary Name </div>
				<div><form:input id="customerId" path="customer.customerId" type="number" readonly="true"></form:input> Customer ID </div>
				<div><form:input id="customerDate" path="customer.date" type="text" readonly="true"></form:input> Customer since </div>
				<div><form:input id="address" path="customer.address" type="text"/> Address </div>
				<div><form:input id="post" path="customer.post"/> Post </div>
				<div><form:input id="pin" path="customer.pin"/> PIN </div>
				<div><form:input id="phone" path="customer.phone"/> Phone </div>
				<br>
				<b>Transactions</b>
				<div><form:input id="loanDate" class="date" path="transactions[0].date" type="text" onchange="setInterestDate()"/> Date </div>
				<div><form:input id="principalCat" path="transactions[0].category" type="text" value="principal" hidden="true"/> Category </div>
				<div><form:input id="principalAmount" path="transactions[0].Amount" type="text" value="0" onchange="calculateInitialInterest()"/> Amount </div>
				<div><form:input id="interestDate" path="transactions[1].date" type="text" readonly="true"/> Date </div>
				<div><form:input id="interestCat" path="transactions[1].category" type="text" value="first_month_interest" hidden="true"/> Category </div>
				<div><form:input id="interestAmount" path="transactions[1].Amount" type="text" value="0" readonly="true"/> Amount </div>
				<div><form:input id="appraisalDate" path="transactions[2].date" type="text" readonly="true"/> Date </div>
				<div><form:input id="appraisalCat" path="transactions[2].category" type="text" value="appraisal_charges" hidden="true"/> Category </div>
				<div><form:input id="appraisalAmount" path="transactions[2].Amount" type="text" value="0" readonly="true"/> Amount </div>	
				<br>
				<b>Add Items</b>
				<div id="listItems">
					<div>Name</div><div>Quantity</div>
					<div><input name="items[0].name" type="text"/></div>
					<div><input name="items[0].quantity" type="text"/></div>
					<div><input type="button" onclick="addMoreItem()" value="Add more items"/></div>
				</div>
				<div><form:input path="weight"/> Weight </div>
				<form:input path="loanStatus" value = "open" hidden="true"/>
			<div><input id="formSubmit" type="submit" value="Submit"/></div>
			<div><input id="formReset" type="reset" value="Reset"/></div>
		</form:form>
	
		<script type="text/javascript">
			itemListId = 1;
			$(document).ready(function(){
				$("#name").autocomplete({
					source: '${pageContext.request.contextPath}/app/customer/getNameList',
					select: function(event, ui) {
						$('#name').val(ui.item.name);
						$('#secondaryName').val(ui.item.secondaryName);
						$('#customerId').val(ui.item.customerId);
						$('#customerDate').val($.format.date(new Date(), 'dd-MM-yyyy'));
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
				$('.date').datepicker({dateFormat:'dd-mm-yy'});
			});
			function setInterestDate(){
				$("#interestDate").val($("#loanDate").val());
				$("#appraisalDate").val($("#loanDate").val());
			}
			function calculateInitialInterest(){
				getInterestRates();
				$.ajax({
					  method: "POST",
					  url: "/TM_UI/app/loan/calculateInitialInterest",
					  data: { principal: $("#principalAmount").val() }
					})
					  .done(function( interest ) {
						  $("#interestAmount").val(interest);
					  });
			}
			function getInterestRates(){
				$.ajax({
					  method: "POST",
					  url: "/TM_UI/app/loan/getInterestRates",
					  data: { principal: $("#principalAmount").val() }
					})
					  .done(function( interestRates ) {
						  if(interestRates != null)
						  	roi = interestRates[0];
						  	$("#appraisalAmount").val(interestRates[1]);
					  });
			}
			function addMoreItem(){
				itemRow="<div id = \"moreRow"+itemListId+"\"><div><input name=\"items["+itemListId+"].name\" type=\"text\"/></div>";
				itemRow+="<div><input name=\"items["+itemListId+"].quantity\" type=\"text\"/></div>";
				if(itemListId == 1){
					itemRow+="<div><input type=\"button\" onclick=\"removeItem()\" value=\"Remove item\"/></div>";
				}
				itemRow+="</div>";
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
				$('#customerDate').val($.format.date(new Date(), 'dd-MM-yyyy'));
				$('#address').val('');
				$('#post').val('');
				$('#pin').val('');
				$('#phone').val('');
			}
		</script>
	</body>
</html>
