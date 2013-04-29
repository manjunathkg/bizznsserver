angular.module('lafAdmin' , []).directive('lafAdmin',function(){
	
	return{
		
		restrict 	: 'E',
		templateUrl : '/libs/lookandfeel/admin/template.html', 
		replace 	: true,
		scope 		: {},
		link 		: function(scope,element, attrs){
			console.log("******* INside Link func");
		}		
	}	
})
