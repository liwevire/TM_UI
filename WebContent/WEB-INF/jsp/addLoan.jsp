<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>TM_UI</title>
  		<script type="text/javascript" src="/TM_UI/resources/js/jquery-3.1.1.min.js"></script>
  		<script type="text/javascript" src="/TM_UI/resources/js/jquery-ui.min.js"></script>
		<script type="text/javascript" src="/TM_UI/resources/js/jquery.datetimepicker.full.min.js" defer></script>
		<script type="text/javascript" src="/TM_UI/resources/js/jquery-dateFormat.min.js" defer></script> 
		<script type="text/javascript" src="/TM_UI/resources/js/materialize.min.js" defer></script>
		
		<link rel="stylesheet" type="text/css" href="/TM_UI/resources/js/jquery-ui.min.css"/>
		<link rel="stylesheet" type="text/css" href="/TM_UI/resources/js/jquery.datetimepicker.min.css" />
		
      	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      	<link type="text/css" rel="stylesheet" href="/TM_UI/resources/css/materialize.min.css"  media="screen,projection"/>
		
		<style>
		  .ui-autocomplete-loading {
		    background: white url("/TM_UI/resources/images/ui-anim_basic_16x16.gif") right center no-repeat;
		  }
		</style>
	</head>
	<body style="overflow: hidden; width: 565px;">
		<header>
			<div class="navbar-fixed">
			<nav>
				<div class="nav-wrapper">
					<a href="#" id="hamburger-menu-button" data-activates="sideBar" class="button-collapse show-on-large"><i class="material-icons">menu</i></a>						
					<a href="/TM_UI/app/home" class="brand-logo center">TM</a>
				</div>
			</nav>
			</div>
			<ul id="sideBar" class="side-nav">
	        	<li class="bold"><a href="about.html" class="waves-effect waves-teal">About</a></li>
	        	<li class="bold"><a href="getting-started.html" class="waves-effect waves-teal">Getting Started</a></li>
	        	<li class="bold"><a href="http://materializecss.com/mobile.html" class="waves-effect waves-teal">Mobile</a></li>
	        	<li class="bold"><a href="showcase.html" class="waves-effect waves-teal">Showcase</a></li>
	        	<li class="bold"><a href="themes.html" class="waves-effect waves-teal">Themes</a></li>
			</ul>
			
		</header>	
<!--     ------------------------------------------------------ -->
		
		<main><div class='container'>
		<div class='row '>
			<form:form modelAttribute="addLoanForm">
					<h5>Add Loan</h5>
					
					<br>
						<div class='col s12'><b>Customer details</b></div>
						<div class='input-field col s6'><form:input id="name" path="customer.name" type="text" class='autocomplete' onfocus="clearDetails()"/><label class="active" for="name">First Name</label></div>
						<div class='input-field col s6'><form:input id="secondaryName" path="customer.secondaryName" type="text"/><label class="active" for="secondaryName">Secondary Name</label></div>
						<div class='input-field col s6'><form:input id="customerId" path="customer.customerId" type="number" readonly="true"></form:input><label class="active" for="customerId">Customer ID</label></div>
						<div class='input-field col s6'><form:input id="customerDate" path="customer.date" type="text" readonly="true"></form:input><label class="active" for="customerDate">Customer since</label></div>
						<div class='input-field col s12'><form:input id="address" path="customer.address" type="text"/><label class="active" for="address">Address</label></div>
						<div class='input-field col s6'><form:input id="post" path="customer.post"/><label class="active" for="post">Post</label></div>
						<div class='input-field col s6'><form:input id="pin" path="customer.pin"/><label class="active" for="pin">PIN</label></div>
						<div class='input-field col s6'><form:input id="phone" path="customer.phone"/><label class="active" for="phone">Phone</label></div>
						<br>
						<div class='col s12'><b>Transactions</b></div>
						<div class='input-field col s6'><form:input id="loanDate" class="date" path="transactions[0].date" type="text" onchange="setInterestDate()"/><label class="active" for="loanDate">Date</label></div>
						<div class='input-field col s6'><form:input id="principalCat" path="transactions[0].category" type="text" value="principal" hidden="true"/><label class="active" for="principalCat">Category</label></div>
						<div class='input-field col s6'><form:input id="principalAmount" path="transactions[0].Amount" type="text" value="0" onchange="calculateInitialInterest()"/><label class="active" for="principalAmount">Amount</label></div>
						<div class='input-field col s6'><form:input id="interestDate" path="transactions[1].date" type="text" readonly="true"/><label class="active" for="interestDate">Date</label></div>
						<div class='input-field col s6'><form:input id="interestCat" path="transactions[1].category" type="text" value="return_on_interest" hidden="true"/><label class="active" for="interestCat">Category</label></div>
						<div class='input-field col s6'><form:input id="interestAmount" path="transactions[1].Amount" type="text" value="0" readonly="true"/><label class="active" for="interestAmount">Amount</label></div>
						<br>
						<div class='col s12'><b>Add Items</b></div>
						<div id="listItems">
							<div class='col s5'>Name</div><div class='col s5'>Weight</div>
							<div class='col s5'><input name="items[0].name" type="text"/></div>
							<div class='col s5'><input name="items[0].weight" type="text"/></div>
							<div class='col s2'><input class="waves-effect waves-light btn" type="button" onclick="addMoreItem()" value="Add more items"/></div>
						</div>
					<div class='col s3 btn waves-effect waves-light'><input id="formSubmit" type="submit" value="Submit"/></div><div class='col s1'></div>
					<div class='col s3 btn waves-effect waves-light'><input id="formReset" type="reset" value="Reset"/></div>
				</form:form>
			</div>
			</div></main>
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
				$('.date').datetimepicker({format:'m/d/Y h:i A'});
				$(".button-collapse").sideNav();
			});
			function setInterestDate(){
				$("#interestDate").val($("#loanDate").val());
			}
			function calculateInitialInterest(){
				$.ajax({
					  method: "POST",
					  url: "/TM_UI/app/loan/calculateInitialInterest",
					  data: { principal: $("#principalAmount").val() }
					})
					  .done(function( interest ) {
						  $("#interestAmount").val(interest);
					  });
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
