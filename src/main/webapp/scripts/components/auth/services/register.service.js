'use strict';

angular.module('ynovApp')
    .factory('Register', function ($resource) {
        return $resource('api/register', {}, {
        });
    });


