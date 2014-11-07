'use strict';

angular.module('frontendApp')
.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider
  .state('main', {
    url: '/',
    views: {
      'menuContent' :{
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      }
    }
  })

  .state('about', {
    url: '/about',
    views: {
      'menuContent' :{
        templateUrl: 'views/about.html',
        controller: 'AboutCtrl'
      }
    }
  });

  $urlRouterProvider.otherwise('/');

  console.log("Finish Loading Routes.")
})