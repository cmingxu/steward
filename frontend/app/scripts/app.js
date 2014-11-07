'use strict';

/**
 * @ngdoc overview
 * @name frontendApp
 * @description
 * # frontendApp
 *
 * Main module of the application.
 */
console.log("starting app.js")
angular
  .module('frontendApp', ['ngCookies', 'ngResource', 'ngSanitize', 'ui.router'])
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
    $rootScope.menuIndex = [0, 0];

    console.log($rootScope);
    console.log("Finish app.js")
  });
