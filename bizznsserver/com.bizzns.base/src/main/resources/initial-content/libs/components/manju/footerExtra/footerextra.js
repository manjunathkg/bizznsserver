angular.module('footerextra' , []).directive('footerExtra',function(){
	
	return{
		
		restrict 	: 'E',
		templateUrl : '/libs/components/manju/footerExtra/template.html', 
		replace 	: true,
		scope 		: {},
		link 		: function(scope,element, attrs){
			console.log("******* INside Footer Extra Link func");
		}		
	}	
})
