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
  .module('frontendApp', ['ngCookies', 'ngResource', 'ngSanitize', 'ui.router', 'angularBootstrapNavTree'])
  .run(function($rootScope, $http) {
    $rootScope.navData = [
        {
            'label': 'User',
            'children': [
                {
                    'label': 'DAU',
                    'children': [
                        'test1', 'test2', 'test3'
                    ]
                },
            ]
        },
    ];

    console.log($rootScope);
    console.log("Finish app.js")
  });
