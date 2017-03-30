<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<title>TM - Update Loan</title>
	
	<!-- Bootstrap -->
    <link href="/TM_UI/package/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/TM_UI/package/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/TM_UI/package/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/TM_UI/package/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="/TM_UI/package/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="/TM_UI/package/build/css/custom.min.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
	<style>
	  .ui-autocomplete-loading {
	    background: white url("/TM_UI/resources/imagfes/ui-anim_basic_16x16.gif") right center no-repeat;
	  }
	</style>
</head>
<body class='nav-md'>
	<div class = 'container body'>
		<div class="main_container">
<!-- 		left column -->
        	<div class="col-md-3 left_col">
          		<div class="left_col scroll-view">
            		<div class="navbar nav_title" style="border: 0;">
            			<a href="../home" class="site_title"><i class="fa fa-paw"></i> <span>Thirumurugan Bankers</span></a>
            		</div>
            		<div class="clearfix"></div>
            		<br/>
            		
<!-- 				sidebar menu -->
            		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
	            		<div class="menu_section">
		            		<h3>Entry/Changes</h3>
			                <ul class="nav side-menu">
								<li><a><i class="fa fa-home"></i> Loan <span class="fa fa-chevron-down"></span></a>
			                    	<ul class="nav child_menu">
			                      		<li><a href="add">Add loan</a></li>
			                      		<li><a href="select">Edit loan</a></li>
			                    	</ul>
		                  		</li>
		                	</ul>
	            		</div>
	            		<div class='menu_section'>
            				<h3>Reports</h3>
            			</div>
           			</div>
<!-- 				/sidebar menu        		 -->
				</div>
			</div>
<!-- 		/left column -->
<!-- 		top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
					<nav>
						<div class="nav toggle">
                			<a id="menu_toggle"><i class="fa fa-bars"></i></a>
              			</div>
					</nav>
				</div>
			</div>
<!-- 		/top navigation -->
<!-- 		right column|page content -->
			<div class="right_col" role="main">
				
				<div class="page-title">
	              <div class="title_left">
	                <h3>Update Loan</h3>
	              </div>
	            </div>
	            <div class="clearfix"></div>
	            <br/>
	            <div class='row'>
					<div class="col-md-12 col-sm-12 col-xs-12">
						<form:form action ="/TM_UI/app/loan/update" method="post" modelAttribute="editLoanForm">
						<div class="x_panel">
						<div class="x_title">
							<h2>Loan details</h2>
							<div class="clearfix"></div><br/>
						</div>
						<div class="x_content">
							<div class="form-horizontal form-label-left input_mask">
							<div class="x_panel">
								<div class="x_title">
									<h2>Customer details</h2>
				                    <ul class="nav navbar-right panel_toolbox">
				                      <li><a class="collapse-link"><i class="fa fa-chevron-up pull-right"></i></a></li>
				                    </ul>
				                    <div class="clearfix"></div><br />
								</div>
								<div class="x_content">
	                    			<div class="form-horizontal form-label-left input_mask">
		                    			<div class="form-group">
					                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="loanId">Loan Id
					                        </label>
					                        <div class="col-md-6 col-sm-6 col-xs-12">
					                        	<form:input id="loanId" path="loanId" type="text" readonly="true" class="form-control col-md-7 col-xs-12"/>
					                        </div>
				                      	</div>
				                      	<div class="form-group">
					                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Name
					                        </label>
					                        <div class="col-md-6 col-sm-6 col-xs-12">
					                        	<form:input id="name" class="editable form-control col-md-7 col-xs-12" path="customer.name" onchange="clearDetails()" type="text" readonly="true"/>
					                        </div>
				                      	</div>
				                      	<div class="form-group">
					                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="secondaryName">Secondary name
					                        </label>
					                        <div class="col-md-6 col-sm-6 col-xs-12">
					                        	<form:input class="editable form-control col-md-7 col-xs-12" id="secondaryName" path="customer.secondaryName" type="text" readonly="true"/>
					                        </div>
				                      	</div>
				                      	<div class="form-group">
					                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="customerId">Customer ID
					                        </label>
					                        <div class="col-md-6 col-sm-6 col-xs-12">
					                        	<form:input id="customerId" path="customer.customerId" class="form-control col-md-7 col-xs-12" type="number" readonly="true"></form:input>
					                        </div>
				                      	</div>
				                      	<div class="form-group">
					                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="customerId">Customer Since
					                        </label>
					                        <div class="col-md-6 col-sm-6 col-xs-12">
					                        	<form:input id="customerDate" path="customer.date" type="text" class="form-control col-md-7 col-xs-12" readonly="true"></form:input>
					                        </div>
				                      	</div>
				                      	<div class="form-group">
					                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="customerId">Address
					                        </label>
					                        <div class="col-md-6 col-sm-6 col-xs-12">
					                        	<form:input id="address" path="customer.address" class="editable form-control col-md-7 col-xs-12" type="text" readonly="true"/>
					                        </div>
				                      	</div>
				                      	<div class="form-group">
					                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="customerId">Post
					                        </label>
					                        <div class="col-md-6 col-sm-6 col-xs-12">
					                        	<form:input id="post" path="customer.post" class="editable form-control col-md-7 col-xs-12" readonly="true"/>
					                        </div>
				                      	</div>
				                      	<div class="form-group">
					                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="customerId">PIN
					                        </label>
					                        <div class="col-md-6 col-sm-6 col-xs-12">
					                        	<form:input id="pin" path="customer.pin" class="editable form-control col-md-7 col-xs-12" readonly="true"/>
					                        </div>
				                      	</div>
				                      	<div class="form-group">
					                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="customerId">Phone
					                        </label>
					                        <div class="col-md-6 col-sm-6 col-xs-12">
					                        	<form:input id="phone" path="customer.phone" class="editable form-control col-md-7 col-xs-12" readonly="true"/>
					                        </div>
				                      	</div>
			                      	</div>
	                    		</div>
							</div>
							<div class="x_panel">
								<div class="x_title">
									<h2>Transaction details</h2>
									<ul class="nav navbar-right panel_toolbox">
					                      <li><a class="collapse-link"><i class="fa fa-chevron-up pull-right"></i></a></li>
					                </ul>
					                <div class="clearfix"></div><br />
								</div>
								<div class="x_content">
									<div class="form-horizontal form-label-left input_mask">
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-4">Date
					                        </label>
					                        <label class="control-label col-md-3 col-sm-3 col-xs-4">Category
					                        </label>
					                        <label class="control-label col-md-3 col-sm-3 col-xs-4">Amount
					                        </label>
										</div>
										<div id="listTransactions" class="form-group">
											<c:set var="transactionListId" scope="page" value="0"></c:set>
											<c:forEach items="${loan.transactions}" var="transaction">
												<div id="moreTransactionRow${transactionListId}" class="form-group"> 
													<div class="col-md-4 col-sm-4 col-xs-4">
														<input  
															<c:if test="${transactionListId ne 1 && transactionListId ne 2}">class="form-control date editable col-md-3 col-sm-3 col-xs-4"</c:if>
															<c:if test="${transactionListId eq 1 || transactionListId eq 2}">class="form-control dateFormat col-md-3 col-sm-3 col-xs-4"</c:if>
															id="date${transactionListId}" name="transactions[${transactionListId}].date" type="text" value="${transaction.date}" readonly="readonly">
													</div>
													<div class="col-md-4 col-sm-4 col-xs-4">
														<input 
															<c:if test="${transactionListId le 2}">readonly="true"</c:if>
															id="category${transactionListId}" name="transactions[${transactionListId}].category" class="form-control col-md-3 col-sm-3 col-xs-4" type="text" value="${transaction.category}">
													</div>
													<div class="col-md-4 col-sm-4 col-xs-4">
														<input class="editable form-control col-md-3 col-sm-3 col-xs-4"
															onchange="calculateInitialInterest()" id="transaction${transactionListId}"
															name="transactions[${transactionListId}].amount" type="text" value="${transaction.amount}" readonly="readonly">
													</div>			
													<c:if test="${transactionListId eq 0}">
														<div class="col-md-12 col-sm-12 col-xs-12">
															<input type="button" class="btn btn-primary" onclick="addMoreTransactionItem()" value="Add more transactions"/>
														</div>
													</c:if>
													<c:if test="${transactionListId eq 1}">
														<div class="col-md-12 col-sm-12 col-xs-12">
															<input type="button" class="btn btn-primary" id="removeTransactionItem" onclick="removeTransaction()" value="Remove transaction" disabled/>
														</div>
													</c:if>
												</div>
												<c:set var="transactionListId" value="${transactionListId+1}"></c:set>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
							<div class="x_panel">
								<div class="x_title">
									<h2>Item details</h2>
									<ul class="nav navbar-right panel_toolbox">
					                      <li><a class="collapse-link"><i class="fa fa-chevron-up pull-right"></i></a></li>
					                </ul>
					                <div class="clearfix"></div><br />
								</div>
								<div class="x_content">
									<div class="form-horizontal form-label-left input_mask">
										<div class="form-group">
											<label class="control-label col-md-6 col-sm-6 col-xs-12">Name
					                        </label>
					                        <label class="control-label col-md-6 col-sm-6 col-xs-12">Quantity
					                        </label>
										</div>
										<div id="listItems">
											<c:set var="itemListId" scope="page" value="0"></c:set>
											<c:forEach items="${loan.items}" var="item">
												<div class="form-group">
													<div id="moreItemRow${itemListId}">
														<div class="col-md-6 col-sm-6 col-xs-12">
															<input name="items[${itemListId}].name" class="editable form-control col-md-3 col-sm-3 col-xs-4" value="${item.name}" type="text" readonly/>
														</div>
														<div class="col-md-6 col-sm-6 col-xs-12">
															<input name="items[${itemListId}].quantity" class="editable form-control col-md-3 col-sm-3 col-xs-4" value="${item.quantity}" readonly/>
														</div>
														<c:if test="${itemListId eq 0}">
															<div class="col-md-6 col-sm-6 col-xs-6">
																<input class="btn btn-primary" type="button" onclick="addMoreListItem()" value="Add more items" disabled/>
															</div>
															<div class="col-md-6 col-sm-6 col-xs-6">
																<input id="removeItem" class="btn btn-primary" type="button" onclick="removeListItem()" value="Remove item" disabled/>
															</div>
														</c:if>
													</div>
												</div>
												<c:set var="itemListId" value="${itemListId+1}"></c:set>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
							<div class="ln_solid"></div>
								<div class="form-group">
			                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
									  <button class="btn btn-primary" type="reset">Reset</button>
			                          <button type="submit" class="btn btn-success">Submit</button>
			                        </div>
								</div>							
							</div>
							</div>
							</div>
						</form:form>
					</div>	            
	            </div>
			</div>
<!-- 		/right column|page content -->				
		</div>
	</div>
	<!-- 		<input type="button" id="enableEdit" value="Click here to edit" onclick="enableEdit()"/> -->
	
<!-- Theme import statements -->
<!-- 	<!-- jQuery --> 
    <script src="/TM_UI/package/vendors/jquery/dist/jquery.min.js"></script>
    
<!--     <script src="/TM_UI/resources/js/jquery-3.1.1.min.js" type="text/javascript"></script> -->
	<script src="/TM_UI/resources/js/jquery-ui.min.js" type="text/javascript"></script>
	<script src="/TM_UI/resources/js/jquery-dateFormat.min.js" type="text/javascript"></script>
	
<!--     Bootstrap -->
    <script src="/TM_UI/package/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!--     FastClick -->
    <script src="/TM_UI/package/vendors/fastclick/lib/fastclick.js"></script>
<!--     NProgress -->
    <script src="/TM_UI/package/vendors/nprogress/nprogress.js"></script>
<!--     Chart.js -->
    <script src="/TM_UI/package/vendors/Chart.js/dist/Chart.min.js"></script>
<!--     gauge.js -->
    <script src="/TM_UI/package/vendors/gauge.js/dist/gauge.min.js"></script>
<!--     bootstrap-progressbar -->
    <script src="/TM_UI/package/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!--     iCheck -->
    <script src="/TM_UI/package/vendors/iCheck/icheck.min.js"></script>
<!--     Skycons -->
    <script src="/TM_UI/package/vendors/skycons/skycons.js"></script>
<!--     Flot -->
    <script src="/TM_UI/package/vendors/Flot/jquery.flot.js"></script>
    <script src="/TM_UI/package/vendors/Flot/jquery.flot.pie.js"></script>
    <script src="/TM_UI/package/vendors/Flot/jquery.flot.time.js"></script>
    <script src="/TM_UI/package/vendors/Flot/jquery.flot.stack.js"></script>
    <script src="/TM_UI/package/vendors/Flot/jquery.flot.resize.js"></script>
<!--     Flot plugins -->
    <script src="/TM_UI/package/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="/TM_UI/package/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="/TM_UI/package/vendors/flot.curvedlines/curvedLines.js"></script>
<!--     DateJS -->
    <script src="/TM_UI/package/vendors/DateJS/build/date.js"></script>
<!--     JQVMap -->
    <script src="/TM_UI/package/vendors/jqvmap/dist/jquery.vmap.js"></script>
    <script src="/TM_UI/package/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="/TM_UI/package/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
<!--     bootstrap-daterangepicker -->
    <script src="/TM_UI/package/vendors/moment/min/moment.min.js"></script>
    <script src="/TM_UI/package/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="/TM_UI/package/build/js/custom.min.js"></script>
    
	<script type="text/javascript">
		var loanStatus='${loan.loanStatus}';
		var credit=0;
		var interest=0;
		var principal=0;	
		var roi;
		var serviceCharge;
		var itemListId = +${itemListId};
		var transactionListId = +${transactionListId};
		$(document).ready(function(){
			$("#name").autocomplete({
				source: '${pageContext.request.contextPath}/app/customer/getNameList',
				select: function(event, ui) {
					$('#name').val(ui.item.name);
					$('#secondaryName').val(ui.item.secondaryName);
					$('#customerId').val(ui.item.customerId);
					$('#customerDate').val($.format.date(new Date(ui.item.date), 'dd-MM-yyyy'));
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
			$("#date0").on("change", function(e){
				$("#date1").val($("#date0").val());
			});
			enableEdit();
// 			getInterestRates();
			$('.date').datepicker({dateFormat:'dd-mm-yy'});
		});
		function addMoreListItem(){
			itemRow="<div id = \"moreItemRow"+itemListId+"\" class=\"form-group\"><div class=\"col-md-6 col-sm-6 col-xs-6\"><input class=\"editable form-control col-md-3 col-sm-3 col-xs-4\" name=\"items["+itemListId+"].name\" type=\"text\"/></div>";
			itemRow+="<div class=\"col-md-6 col-sm-6 col-xs-6\"><input name=\"items["+itemListId+"].quantity\" class=\"editable form-control col-md-3 col-sm-3 col-xs-4\" /></div>";
			itemRow+="</div>";
			itemListId += 1;
			$("#listItems").append(itemRow);
			if(itemListId == 2){
				$("#removeItem").removeAttr("disabled");
			}
		}
		function removeListItem(){
			itemListId -= 1;
			$("#moreItemRow"+itemListId).remove();
			if(itemListId<2){
				$("#removeItem").attr("disabled", "disabled");
			}
		}
		function addMoreTransactionItem(){
			transactionRow="<div id = \"moreTransactionRow"+transactionListId+"\" class=\"form-group\"><div class=\"col-md-4 col-sm-4 col-xs-4\"><input class=\"date form-control col-md-3 col-sm-3 col-xs-4\" name=\"transactions["+transactionListId+"].date\" type=\"text\"/></div>";
			transactionRow+="<div class=\"col-md-4 col-sm-4 col-xs-4\"><input name=\"transactions["+transactionListId+"].category\" class=\"form-control col-md-3 col-sm-3 col-xs-4\" type=\"text\"/></div>";
			transactionRow+="<div class=\"col-md-4 col-sm-4 col-xs-4\"><input name=\"transactions["+transactionListId+"].amount\" class=\"form-control col-md-3 col-sm-3 col-xs-4\"/></div>";
			transactionRow+="</div>";
			transactionListId += 1;
			$("#listTransactions").append(transactionRow);
			if(transactionListId == 4){
				$("#removeTransactionItem").removeAttr("disabled");
			}
			$('.date').datepicker({dateFormat:'dd-mm-yy'});
		}
		function removeTransaction(){
			transactionListId -= 1;
			$("#moreTransactionRow"+transactionListId).remove();
			if(transactionListId<4){
				$("#removeTransactionItem").attr("disabled", "disabled");
			}
		}
		function calculateInitialInterest(){
			$.ajax({
				  method: "POST",
				  url: "/TM_UI/app/loan/calculateInitialInterest",
				  data: { principal: $("#transaction0").val() }
				})
				  .done(function( initialInterest ) {
					  $("#transaction1").val(initialInterest);
				  });
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
		function enableEdit() {
			$('.date').val(function(i, oldVal) {
			    return $.format.date(oldVal, 'dd-mm-yyyy')});
			$('.dateFormat').val(function(i, oldVal) {
			    return $.format.date(oldVal, 'dd-mm-yyyy')});
			$(".editable").removeAttr("readonly");
			$("input[disabled]").removeAttr("disabled");
			$("input[hidden]").removeAttr("hidden");
// 			$("button[disabled]").removeAttr("disabled");
// 			$("button[hidden]").removeAttr("hidden");
			$("#enableEdit").remove();
			if(transactionListId == 3){
				$("#removeTransactionItem").attr("disabled", "disabled");
			}
		}
	</script>
</body>
</html>