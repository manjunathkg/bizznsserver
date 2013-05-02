angular.module('header' , []).directive('header',function(){
	
	return{
		
		restrict 	: 'E',
		templateUrl : '/libs/components/header/template.html', 
		replace 	: true,
		scope 		: {},
		link 		: function(scope,element, attrs){
			console.log("******* INside header Link func");
		}		
	}	
})
