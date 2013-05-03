<%@ page import="org.apache.sling.api.resource.Resource"%>
<%@ page import="org.apache.sling.api.resource.ResourceResolver"%>
<!doctype html>
<html ng-app>
	<head>
		<title>Test with angular</title>
		<script type="text/javascript" src="/libs/base/angular/v1.0.6/angular.min.js"></script>
		<link rel="stylesheet" href="/libs/base/gumby/v2.1/css/gumby.css" />
		<script>
function Ctrl($scope) {
	$scope.templates = [ {
		name : 'template1.html',
		url : 'template1.html'
	}, {
		name : 'template2.html',
		url : 'template2.html'
	} ];
	$scope.template = $scope.templates[0];
}
		</script>
	</head>
	<body>
		<a href="#" id="loadModule1">Load module 1</a>
		<a href="#" id="loadModule2">Load module 2</a>
		<a href="#" id="loadModule3">Load module 3</a>
		
		<div ng-controller="Ctrl">
			<select ng-model="template" ng-options="t.name for t in templates">
				<option value="">(blank)</option>
			</select> url of the template:
			<tt>{{template.url}}</tt>
			<hr />
			<div ng-include src="template.url"></div>
		</div>
	</body>
</html>