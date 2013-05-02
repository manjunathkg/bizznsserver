angular.module('footer' , []).directive('footer',function(){
	
	return{
		
		restrict 	: 'E',
		templateUrl : '/libs/components/footer/template.html', 
		replace 	: true,
		scope 		: {},
		link 		: function(scope,element, attrs){
			console.log("******* INside footer Link func");
		}		
	}	
})
