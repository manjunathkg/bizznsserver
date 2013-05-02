var app=angular.module('manjuApp',[ 'topstatusbar',                                    
                                    'mainnav',
                                   	'header',
                                   	'footerextra',
                                   	'footer',
                                   	'restangular']);

//Configure Restangular at app level
app.config(function(RestangularProvider){
	RestangularProvider.setBaseUrl('/');
	
	 RestangularProvider.setExtraFields(['name']);
	 RestangularProvider.setResponseExtractor(function(response, operation) {
	        return response.data;
	 });

	 RestangularProvider.setListTypeIsArray(true);

	 // In this case we configure that the id of each element will be the __id field and we change the Restangular route. We leave the default value for parentResource
	 RestangularProvider.setRestangularFields({
	      id: "__id",
	      route: "restangularRoute"
	    });

	RestangularProvider.setRequestSuffix('tidy.5.json');
	
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