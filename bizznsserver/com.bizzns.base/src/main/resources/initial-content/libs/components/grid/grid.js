angular.module('bizzgrid' , ['restangular' ])
	.directive('bizzGrid',function(){
	
		    // I am the controller for this directive.
		    function Controller( $scope, $element, $attrs, Restangular ) {		  
		    	$scope.data = Restangular.all('bizzns').customGET('apps.tidy.2.json'); 		        
		    }
		    
		    // I bind the $scope to the DOM behaviors.
		    function linkFunction( $scope, element, attributes, controllers ) {
		    	console.log("************  I'm HEREE   ***********************");
		        console.log("data should be promise here == " +   $scope.data );  
		        
		    }
			
			
			return{		
				restrict 	: 'E',
				templateUrl : '/libs/components/grid/template.html', 
				replace 	: true,
				controller  : Controller,
				require     : ['bizzGrid'],
				link 		:  linkFunction
			}	
})
