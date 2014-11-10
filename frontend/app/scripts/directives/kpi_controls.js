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
      },
      link: function postLink(scope, element, attrs) {
        scope.kpiQueryParams = {}
      },
      controller: function($scope) {
        $scope.queryKpi = function() {
            console.log($scope.kpiQueryParams)
        }
      },
    };
  });
