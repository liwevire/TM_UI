<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    
		<title>TM - Add misc. transaction</title>
		
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
									<li><a><i class="fa fa-inr"></i> Loans <span class="fa fa-chevron-down"></span></a>
				                    	<ul class="nav child_menu">
				                      		<li><a href="../loan/add">Add loan</a></li>
				                      		<li><a href="../loan/select">Edit loan</a></li>
				                    	</ul>
			                  		</li>
			                  		<li><a><i class="fa fa-line-chart"></i> Reports <span class="fa fa-chevron-down"></span></a>
					                    <ul class="nav child_menu">
					                      	<li><a href="../reports/daily">Daily</a></li>
			                      			<li><a href="../reports/monthly">Monthly</a></li>
					                    </ul>
				                 	 </li>
				                 	 <li><a><i class="fa fa-users"></i> Customers <span class="fa fa-chevron-down"></span></a>
					                    <ul class="nav child_menu">
					                      	<li><a href="add">Add customer</a></li>
			                      			<li><a href="select">Edit customer</a></li>
					                    </ul>
				                 	 </li>
		                		</ul>
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
		                <h3>Miscellaneous Transactions</h3>
		              </div>
		            </div>
		            <div class="clearfix"></div>
		            <br/>
		            <div class='row'>
						<div class="col-md-12 col-sm-12 col-xs-12">
							<form:form modelAttribute="addMiscTransactionForm">
								<div class="x_panel">
									<div class="x_title">
										<h2>Misc. Transaction details</h2>
										<ul class="nav navbar-right panel_toolbox">
											<li><a class="collapse-link"><i
													class="fa fa-chevron-up pull-right"></i></a></li>
										</ul>
										<div class="clearfix"></div>
										<br />
									</div>
									<div class="x_content">
										<div class="form-horizontal form-label-left input_mask">
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12"
													for="transactionId">Transaction Id</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<form:input id="transactionId" path="transactionId" type="number" class="form-control col-md-7 col-xs-12" readonly="true"/>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12"
													for="date">Date</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<form:input id="date" path="date"
														 class="form-control col-md-7 col-xs-12 date" />
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12"
													for="description">Description </label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<form:input id="description" path="description"
														type="text" class="form-control col-md-7 col-xs-12"/>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12"
													for="amount">Amount </label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<form:input id="amount" path="amount"
														type="number" class="form-control col-md-7 col-xs-12"/>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12"
													for="transactionType">Transaction type </label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<form:input id="transactionType" path="transactionType" type="text"
														class="form-control col-md-7 col-xs-12" />
												</div>
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
			$(document).ready(function(){
				$('.date').datepicker({dateFormat:'dd-mm-yy'});
			});
		</script>
	</body>
</html>
