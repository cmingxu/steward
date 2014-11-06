'use strict';

/**
 * @ngdoc overview
 * @name frontendApp
 * @description
 * # frontendApp
 *
 * Main module of the application.
 */
angular
  .module('frontendApp', ['ngAnimate', 'ngCookies', 'ngResource', 'ngSanitize', 'ngTouch'])
  .run(function($rootScope) {
    $rootScope.mainViewLayout = [
        {
            'name': 'User',
            'sidebar': [
                {
                    'name': 'DAU',
                    'url': '/dau'
                },
            ]
        },
    ];
  });
