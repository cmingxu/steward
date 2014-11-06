'use strict';

/**
 * @ngdoc directive
 * @name frontendApp.directive:charts
 * @description
 * # charts
 */
angular.module('frontendApp')
  .directive('charts', function () {
    return {
      template: '<div></div>',
      restrict: 'E',
      link: function postLink(scope, element, attrs) {
        element.text('this is the charts directive');
      }
    };
  });
