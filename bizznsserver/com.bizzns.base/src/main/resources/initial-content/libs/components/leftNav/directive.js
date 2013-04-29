//the following will declare a new directive that
// may be used like <my-directive name="foo"></my-directive>
// where foo is a property on a controller's scope.
angular.directive('bizznsLeftnav', function(){
  // The above name 'myDirective' will be parsed out as 'my-directive'
  // for in-markup uses.
  return {
    // restrict to an element (A = attribute, C = class, M = comment)
    // or any combination like 'EACM' or 'EC'
    restrict: 'E',
    scope: {
      name: '=name', 												// set the name on the directive's scope
                    												// to the name attribute on the directive element.
      directiveURL='@data-directive-url'     	  
    },
    //the template for the directive.
    templateUrl: '/libs/components/leftnav/template.html',
    //the controller for the directive
    controller: function($scope) {
      $scope.reverseName = function(){
         
      };
    },
    replace: true, //replace the directive element with the output of the template.
    //the link method does the work of setting the directive
    // up, things like bindings, jquery calls, etc are done in here
    link: function(scope, elem, attr) {
      // scope is the directive's scope,
      // elem is a jquery lite (or jquery full) object for the directive root element.
      // attr is a dictionary of attributes on the directive element.
      elem.bind('dblclick', function() {
        scope.name += '!';
        scope.$apply();
      });
    }
  };
});