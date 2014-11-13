'use strict';

/**
 * @ngdoc directive
 * @name frontendApp.directive:charts
 * @description
 * # charts
 */
 angular.module('frontendApp')
 .directive('kpiControls', function () {
  return {
    templateUrl: 'views/templates/kpi_controls.html',
    restrict: 'E',
    scope: {
      controlsData: '=',
      queryUrl: '='
    },
    link: function postLink(scope, element, attrs) {
      scope.kpiQueryParams = {};
    },
    controller: function($scope, $http, $rootScope) {
      $scope.queryKpi = function() {
        console.log("Query params:", $scope.kpiQueryParams);
        $http.get($scope.queryUrl, { query: $scope.kpiQueryParams }).success(function(data) {
          console.log(data);
          $rootScope.kpiViewsData = data;
        });

      };
    },
  };
});
