var app=angular.module('manjuApp',[ 'topstatusbar',                                    
                                    'mainnav',
                                   	'header',
                                   	'bizzgrid',
                                   	'footerextra',
                                   	'footer',
                                   	'restangular']);

//Configure Restangular at app level
app.config(function(RestangularProvider){
	RestangularProvider.setBaseUrl('/content'); 
	
});

//Define AppService - global app service for manju
app.factory('AppService', function(){
	return {
		name : 'Manju App',
		title: 'Title for manju app'		
	}
});


//Define appController - global app controller for manju
app.controller('appController',function($scope,AppService,Restangular){
	$scope.data=Restangular.all(content).getList();	
});