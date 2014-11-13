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
  .module('frontendApp', ['ngCookies', 'ngResource', 'ngSanitize', 'ui.router', 'angularBootstrapNavTree', 'ngTable'])
  // .constant("NAV_TREE_URL", 'http://localhost:3000/nav_tree')
  .run(function($rootScope, $http) {
    $rootScope.navData = [];
    // console.log(NAV_TREE_URL);
    $http.get('http://localhost:3000/nav_tree').success(function(data) {
        console.log('finished query nav tree');
        console.log(data);
        $rootScope.navData = data;
    });
    $rootScope.navTreeSelectHandler = function(branch) {
        $rootScope.pageTitle = branch.label;
        if(branch.children.length === 0) {
          $rootScope.kpiControlsData = branch.data.controls;
          $rootScope.kpiQueryUrl = branch.data.url;
        }
        console.log(branch.label);
        console.log(branch.data);
        console.log(branch);
    };
    console.log($rootScope);
    console.log('Finish app.js');
  });
