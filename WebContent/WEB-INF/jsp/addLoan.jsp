<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    
		<title>TM - Add Loan</title>
		
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
		    background: white url("/TM_UI/resources/images/ui-anim_basic_16x16.gif") right center no-repeat;
		  }
		</style>
	</head>
	<body class='nav-md'>
		<div class = 'container body'>
			<div class="main_container">
	<!-- 		left column -->
	        	<div class="col-md-3 left_col menu_fixed">
	          		<div class="left_col scroll-view">
	            		<div class="navbar nav_title" style="border: 0;">
	            			<a href="../home" class="site_title"><i class="fa fa-paw"></i> <span>TM</span></a>
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
			                  		<li><a><i class="fa fa-bar-chart-o"></i> Reports <span class="fa fa-chevron-down"></span></a>
					                    <ul class="nav child_menu">
					                      	<li><a href="./reports/daily">Daily</a></li>
			                      			<li><a href="./reports/monthly">Monthly</a></li>
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
		                <h3>Add Loan</h3>
		              </div>
		            </div>
		            <div class="clearfix"></div>
		            <br/>
		            <div class='row'>
						<div class="col-md-12 col-sm-12 col-xs-12">
							<form:form modelAttribute="addLoanForm">
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
					                    				<%-- 				<div><form:input id="name" path="customer.name" type="text" class='autocomplete' onfocus="clearDetails()"/> First Name </div> --%>
									                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">First Name
									                        </label>
									                        <div class="col-md-6 col-sm-6 col-xs-12">
									                        	<form:input id="name" path="customer.name" type="text" class="autocomplete form-control col-md-7 col-xs-12" onfocus="clearDetails()"/>
									                        </div>
								                      	</div>
								                      	<div class="form-group">
								                      	<%-- 				<div><form:input id="secondaryName" path="customer.secondaryName" type="text"/> Secondary Name </div> --%>
									                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="secondaryName">Secondary Name
									                        </label>
									                        <div class="col-md-6 col-sm-6 col-xs-12">
									                        	<form:input id="secondaryName" path="customer.secondaryName" type="text" class="form-control col-md-7 col-xs-12"/>
									                        </div>
								                      	</div>
								                      	<div class="form-group">
								                      	<%-- 				<div><form:input id="customerId" path="customer.customerId" type="number" readonly="true"></form:input> Customer ID </div> --%>
									                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="loanId">Customer ID
									                        </label>
									                        <div class="col-md-6 col-sm-6 col-xs-12">
									                        	<form:input id="customerId" path="customer.customerId" type="number" class="form-control col-md-7 col-xs-12" readonly="true"/>
									                        </div>
								                      	</div>
								                      	<div class="form-group">
								                      	<%-- 				<div><form:input id="customerDate" path="customer.date" type="text" readonly="true"></form:input> Customer since </div> --%>
									                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="loanId">Customer since
									                        </label>
									                        <div class="col-md-6 col-sm-6 col-xs-12">
									                        	<form:input id="customerDate" path="customer.date" type="text" class="form-control col-md-7 col-xs-12" readonly="true"/>
									                        </div>
								                      	</div>
								                      	<div class="form-group">
								                      	<%-- 				<div><form:input id="address" path="customer.address" type="text"/> Address </div> --%>
									                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="loanId">Address
									                        </label>
									                        <div class="col-md-6 col-sm-6 col-xs-12">
									                        	<form:input id="address" path="customer.address" type="text" class="form-control col-md-7 col-xs-12"/>
									                        </div>
								                      	</div>
								                      	<div class="form-group">
								                      	<%-- 				<div><form:input id="post" path="customer.post"/> Post </div> --%>
									                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="loanId">Post
									                        </label>
									                        <div class="col-md-6 col-sm-6 col-xs-12">
									                        	<form:input id="post" path="customer.post" type="text" class="form-control col-md-7 col-xs-12"/>
									                        </div>
								                      	</div>
								                      	<div class="form-group">
								                      	<%-- 				<div><form:input id="post" path="customer.post"/> Post </div> --%>
									                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="loanId">Pin
									                        </label>
									                        <div class="col-md-6 col-sm-6 col-xs-12">
									                        	<form:input id="pin" path="customer.pin" type="text" class="form-control col-md-7 col-xs-12"/>
									                        </div>
								                      	</div>
								                      	<div class="form-group">
								                      	<%-- 				<div><form:input id="phone" path="customer.phone"/> Phone </div> --%>
									                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="loanId">Phone
									                        </label>
									                        <div class="col-md-6 col-sm-6 col-xs-12">
									                        	<form:input id="phone" path="customer.phone" type="text" class="form-control col-md-7 col-xs-12"/>
									                        </div>
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
														<label class="col-md-3 col-sm-3 col-xs-4">Date</label>
								                        <label class="col-md-3 col-sm-3 col-xs-4">Category</label>
								                        <label class="col-md-3 col-sm-3 col-xs-4">Amount</label>
													</div>
													<div class="form-group">
														<div class="col-md-4 col-sm-4 col-xs-4">
															<form:input id="loanDate" class="date form-control col-md-3 col-sm-3 col-xs-4" path="transactions[0].date" type="text" onchange="setInterestDate()"/>
														</div>
														<div class="col-md-4 col-sm-4 col-xs-4">
															<form:input id="principalCat" path="transactions[0].category" class="form-control col-md-3 col-sm-3 col-xs-4" type="text" value="principal" hidden="true"/>
														</div>
														<div class="col-md-4 col-sm-4 col-xs-4">
															<form:input id="principalAmount" path="transactions[0].Amount" class="form-control col-md-3 col-sm-3 col-xs-4" type="number" value="0" onchange="calculateInitialInterest()"/>
														</div>
														<div class="col-md-4 col-sm-4 col-xs-4">
															<form:input id="interestDate" path="transactions[1].date" class="form-control col-md-3 col-sm-3 col-xs-4" type="text" readonly="true"/>
														</div>
														<div class="col-md-4 col-sm-4 col-xs-4">
															<form:input id="interestCat" path="transactions[1].category" class="form-control col-md-3 col-sm-3 col-xs-4" type="text" value="first_month_interest" hidden="true"/>
														</div>
														<div class="col-md-4 col-sm-4 col-xs-4">
															<form:input id="interestAmount" path="transactions[1].Amount" class="form-control col-md-3 col-sm-3 col-xs-4" type="number" value="0" readonly="true"/>
														</div>
														<div class="col-md-4 col-sm-4 col-xs-4">
															<form:input id="appraisalDate" path="transactions[2].date" class="form-control col-md-3 col-sm-3 col-xs-4" type="text" readonly="true"/>
														</div>
														<div class="col-md-4 col-sm-4 col-xs-4">
															<form:input id="appraisalCat" path="transactions[2].category" class="form-control col-md-3 col-sm-3 col-xs-4" type="text" value="appraisal_charges" hidden="true"/>
														</div>
														<div class="col-md-4 col-sm-4 col-xs-4">
															<form:input id="appraisalAmount" path="transactions[2].Amount" class="form-control col-md-3 col-sm-3 col-xs-4" type="number" value="0" readonly="true"/>
														</div>
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
														<label class="col-md-8 col-sm-8 col-xs-8">Name
								                        </label>
								                        <label class="col-md-4 col-sm-4 col-xs-4">Quantity
								                        </label>
													</div>
													<div id="listItems">
														<div class="form-group">
															<div class="col-md-8 col-sm-8 col-xs-8"> 
																<input name="items[0].name" class="form-control col-md-3 col-sm-3 col-xs-4" type="text"/>
															</div>
															<div class="col-md-4 col-sm-4 col-xs-4"> 
																<input name="items[0].quantity" class="form-control col-md-3 col-sm-3 col-xs-4" type="number"/>
															</div>
														</div>
													</div>
													<div class="form-group">
														<div class="col-md-6 col-sm-6 col-xs-6">
															<input class="btn btn-primary" type="button" onclick="addMoreListItem()" value="Add more items"/>
														</div>
														<div class="col-md-6 col-sm-6 col-xs-6">
															<input id="removeItem" class="btn btn-primary" type="button" onclick="removeListItem()" value="Remove item"/>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-6 col-sm-6 col-xs-8">Total Weight
								                        </label>
								                        <div class="col-md-6 col-sm-6 col-xs-4">
								                        	<form:input id="weight" path="weight" class="editable form-control col-md-3 col-sm-3 col-xs-4"/>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="form-group">
					                        <div class="col-md-3 col-sm-3 col-xs-12">
												<label >Loan Status:</label>
											</div>
											<div class="col-md-3 col-sm-3 col-xs-12">	
												<form:radiobutton path="loanStatus" class="flat" value="open" checked="checked"/> Open
												<form:radiobutton path="loanStatus" class="flat" value="closed"/> Closed
											</div>
										</div>
										<div class="clearfix"></div><br/>
										<div class="ln_solid"></div>
										<div class="form-group">
					                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
											  <button class="btn btn-primary" type="reset">Reset</button>
					                          <button class="btn btn-success" type="submit">Submit</button>
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

		                    	
		                    	
<%-- 		<form:form modelAttribute="addLoanForm"> --%>
<!-- 				<h5>Add Loan</h5> -->
<!-- 				<b>Customer details</b> -->
<%-- 				<div><form:input id="name" path="customer.name" type="text" class='autocomplete' onfocus="clearDetails()"/> First Name </div> --%>
<%-- 				<div><form:input id="secondaryName" path="customer.secondaryName" type="text"/> Secondary Name </div> --%>
<%-- 				<div><form:input id="customerId" path="customer.customerId" type="number" readonly="true"></form:input> Customer ID </div> --%>
<%-- 				<div><form:input id="customerDate" path="customer.date" type="text" readonly="true"></form:input> Customer since </div> --%>
<%-- 				<div><form:input id="address" path="customer.address" type="text"/> Address </div> --%>
<%-- 				<div><form:input id="post" path="customer.post"/> Post </div> --%>
<%-- 				<div><form:input id="pin" path="customer.pin"/> PIN </div> --%>
<%-- 				<div><form:input id="phone" path="customer.phone"/> Phone </div> --%>
<!-- 				<br> -->
<!-- 				<b>Transactions</b> -->
<%-- 				<div><form:input id="loanDate" class="date" path="transactions[0].date" type="text" onchange="setInterestDate()"/> Date </div> --%>
<%-- 				<div><form:input id="principalCat" path="transactions[0].category" type="text" value="principal" hidden="true"/> Category </div> --%>
<%-- 				<div><form:input id="principalAmount" path="transactions[0].Amount" type="text" value="0" onchange="calculateInitialInterest()"/> Amount </div> --%>
<%-- 				<div><form:input id="interestDate" path="transactions[1].date" type="text" readonly="true"/> Date </div> --%>
<%-- 				<div><form:input id="interestCat" path="transactions[1].category" type="text" value="first_month_interest" hidden="true"/> Category </div> --%>
<%-- 				<div><form:input id="interestAmount" path="transactions[1].Amount" type="text" value="0" readonly="true"/> Amount </div> --%>
<%-- 				<div><form:input id="appraisalDate" path="transactions[2].date" type="text" readonly="true"/> Date </div> --%>
<%-- 				<div><form:input id="appraisalCat" path="transactions[2].category" type="text" value="appraisal_charges" hidden="true"/> Category </div> --%>
<%-- 				<div><form:input id="appraisalAmount" path="transactions[2].Amount" type="text" value="0" readonly="true"/> Amount </div>	 --%>
<!-- 				<br> -->
<!-- 				<b>Add Items</b> -->
<!-- 				<div id="listItems"> -->
<!-- 					<div>Name</div><div>Quantity</div> -->
<!-- 					<div><input name="items[0].name" type="text"/></div> -->
<!-- 					<div><input name="items[0].quantity" type="text"/></div> -->
<!-- 					<div><input type="button" onclick="addMoreItem()" value="Add more items"/></div> -->
<!-- 				</div> -->
<%-- 				<div><form:input path="weight"/> Weight </div> --%>
<%-- 				<form:input path="loanStatus" value = "open" hidden="true"/> --%>
<!-- 			<div><input id="formSubmit" type="submit" value="Submit"/></div> -->
<!-- 			<div><input id="formReset" type="reset" value="Reset"/></div> -->
<%-- 		</form:form> --%>

<!-- Theme import statements -->
	<!-- jQuery --> 
    <script src="/TM_UI/package/vendors/jquery/dist/jquery.min.js"></script>
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
				$.ajax({
					  method: "POST",
					  url: "/TM_UI/app/loan/calculateInitialInterest",
					  data: { principal: $("#principalAmount").val() }
					})
					  .done(function( interestRates ) {
						  if(interestRates != null)
							initialInterest = interestRates[0];
						  	appraisalCharge = interestRates[1];
						  	$("#interestAmount").val(initialInterest);
						  	$("#appraisalAmount").val(appraisalCharge);
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
				$.ajax({
					  method: "POST",
					  url: "/TM_UI/app/loan/calculateInitialInterest",
					  data: { principal: $("#transaction0").val() }
					})
					  .done(function( interestRates ) {
						  if(interestRates != null)
							initialInterest = interestRates[0];
						  	appraisalCharge = interestRates[1];
						  	$("#interestAmount").val(initialInterest);
						  	$("#appraisalAmount").val(appraisalCharge);
					  });
			}
			function addMoreListItem(){
				itemRow="<div id = \"moreItemRow"+itemListId+"\" class=\"form-group\"><div class=\"col-md-8 col-sm-8 col-xs-8\"><input class=\"editable form-control col-md-3 col-sm-3 col-xs-4\" name=\"items["+itemListId+"].name\" type=\"text\"/></div>";
				itemRow+="<div class=\"col-md-4 col-sm-4 col-xs-4\"><input name=\"items["+itemListId+"].quantity\" class=\"editable form-control col-md-3 col-sm-3 col-xs-4\" type=\"number\"/></div>";
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
