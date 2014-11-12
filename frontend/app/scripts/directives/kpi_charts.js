'use strict';

/**
 * @ngdoc directive
 * @name frontendApp.directive:charts
 * @description
 * # charts
 */
 angular.module('frontendApp')
 .directive('kpiCharts', function () {
  return {
    templateUrl: 'views/templates/kpi_charts.html',
    restrict: 'E',
    scope: {
      kpiViewsData: '=',
      kpiChartType: '='
    }
  };
});
