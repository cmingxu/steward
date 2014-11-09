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
  .module('frontendApp', ['ngCookies', 'ngResource', 'ngSanitize', 'ui.router', 'angularBootstrapNavTree'])
  // .constant("NAV_TREE_URL", 'http://localhost:3000/nav_tree')
  .run(function($rootScope, $http) {
    $rootScope.navData = []
    // console.log(NAV_TREE_URL);
    $http.get('http://localhost:3000/nav_tree').success(function(data){
        console.log("finished query nav tree");
        console.log(data);
        $rootScope.navData = data
    })
    $rootScope.navTreeSelectHandler = function(branch) {
        console.log(branch.label)
        console.log(branch.data);
    }
    console.log($rootScope);
    console.log("Finish app.js")
  });
