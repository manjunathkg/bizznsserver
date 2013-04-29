<!DOCTYPE html>

<html lang="en" ng-app="mainnav">
 
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Dashboard :: Base Admin</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">    
    
    <link href="/libs/lookandfeel/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="/libs/lookandfeel/admin/css/bootstrap-responsive.min.css" rel="stylesheet">
    
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
    <link href="/libs/lookandfeel/admin/css/font-awesome.min.css" rel="stylesheet">        
    
    <link href="/libs/lookandfeel/admin/css/ui-lightness/jquery-ui-1.10.0.custom.min.css" rel="stylesheet">
    
    <link href="/libs/lookandfeel/admin/css/base-admin-2.css" rel="stylesheet">
    <link href="/libs/lookandfeel/admin/css/base-admin-2-responsive.css" rel="stylesheet">
    
    <link href="/libs/lookandfeel/admin/css/pages/dashboard.css" rel="stylesheet">   

    <link href="/libs/lookandfeel/admin/css/custom.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>

 


<body>
<div class="subnavbar">

	<div class="subnavbar-inner">
	
		<div class="container">
			
			<a class="btn-subnavbar collapsed" data-toggle="collapse" data-target=".subnav-collapse">
				<i class="icon-reorder"></i>
			</a>

			<div class="subnav-collapse collapse"> 
				<main-nav> </main-nav> 
			</div> <!-- /.subnav-collapse -->

		</div> <!-- /container -->
	
	</div> <!-- /subnavbar-inner -->

</div> <!-- /subnavbar -->    
    
 
    

<jsp:directive.include file="/apps/bizzns/admin/main/includes/bottom_extra.jsp" />
<jsp:directive.include file="/apps/bizzns/admin/main/includes/footer.jsp" />


    
    
 



    

<!-- Javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/libs/base/js/angular/latest/angular.min.js"></script> 

<script src="/libs/admin/js/jquery-1.8.3.min.js"></script>
<script src="/libs/admin/js/jquery-ui-1.10.0.custom.min.js"></script>
<script src="/libs/admin/js/bootstrap.min.js"></script>

<script src="/libs/admin/js/plugins/flot/jquery.flot.js"></script>
<script src="/libs/admin/js/plugins/flot/jquery.flot.pie.js"></script>
<script src="/libs/admin/js/plugins/flot/jquery.flot.resize.js"></script>

<script src="/libs/admin/js/Application.js"></script>

<script src="/libs/admin/js/charts/area.js"></script>
<script src="/libs/admin/js/charts/donut.js"></script>



<script src="/libs/components/mainnav/mainnav.js"></script> 
  

<a id="back-to-top" href="/bizzns/admin/main/index.html#top" style="display: none;"><i class="icon-chevron-up"></i></a></body></html>