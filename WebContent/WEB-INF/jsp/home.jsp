<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title>TM - Dashboard</title>
		
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
	</head>
	<body class='nav-md'>
		<div class = 'container body'>
			<div class="main_container">
	<!-- 		left column -->
	        	<div class="col-md-3 left_col menu_fixed">
	          		<div class="left_col scroll-view">
	            		<div class="navbar nav_title" style="border: 0;">
	            			<a href="home" class="site_title"><i class="fa fa-paw"></i> <span>TM</span></a>
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
					                      	<li><a href="../Reports/daily">Daily</a></li>
			                      			<li><a href="../Reports/monthly">Monthly</a></li>
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
		                <h3>Dashboard</h3>
		              </div>
		            </div>
		            <div class="clearfix"></div>
		            <br/>
		            <div class='row'>
		            	<a href="/TM_UI/app/loan/add">Add Loan</a><br>
						<a href="/TM_UI/app/loan/select">Update Loan</a>	
		            </div>
		         </div>
	<!-- 		/right column|page content -->
			</div>
			</div>
	
		<!-- Theme import statements -->
		<!-- jQuery -->
		<script src="/TM_UI/package/vendors/jquery/dist/jquery.min.js"></script>
		<script src="/TM_UI/resources/js/jquery-ui.min.js"
			type="text/javascript"></script>
		<script src="/TM_UI/resources/js/jquery-dateFormat.min.js"
			type="text/javascript"></script>
	
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
		<script
			src="/TM_UI/package/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
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
		<script
			src="/TM_UI/package/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
		<script
			src="/TM_UI/package/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
		<script src="/TM_UI/package/vendors/flot.curvedlines/curvedLines.js"></script>
		<!--     DateJS -->
		<script src="/TM_UI/package/vendors/DateJS/build/date.js"></script>
		<!--     JQVMap -->
		<script src="/TM_UI/package/vendors/jqvmap/dist/jquery.vmap.js"></script>
		<script
			src="/TM_UI/package/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
		<script
			src="/TM_UI/package/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
		<!--     bootstrap-daterangepicker -->
		<script src="/TM_UI/package/vendors/moment/min/moment.min.js"></script>
		<script
			src="/TM_UI/package/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
	
		<!-- Custom Theme Scripts -->
		<script src="/TM_UI/package/build/js/custom.min.js"></script>
	</body>
</html>
