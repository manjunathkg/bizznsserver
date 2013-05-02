angular.module('topstatusbar' , []).directive('topStatusBar',function(){	
	return{		
		restrict 	: 'E',
		templateUrl : '/libs/components/topStatusBar/template.html', 
		replace 	: true,
		scope 		: {},
		link 		: function(scope,element, attrs){
			console.log("******* INside topStatusBar Link func");
		}	
		
	}	
})
