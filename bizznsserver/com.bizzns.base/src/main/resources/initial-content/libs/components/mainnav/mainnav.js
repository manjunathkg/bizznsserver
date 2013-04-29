angular.module('mainnav' , []).directive('mainNav',function(){
	
	return{
		
		restrict 	: 'E',
		templateUrl : '/libs/components/mainnav/template.html', 
		replace 	: true,
		scope 		: {},
		link 		: function(scope,element, attrs){
			console.log("******* INside Link func");
		}		
	}	
})
