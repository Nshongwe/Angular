﻿(function () {
    'use strict';
//create angularjs controller
var app = angular.module('app', []);//set and get the angular module
app.controller('customerController', ['$scope', '$http', customerController]);

//angularjs controller method
function customerController($scope, $http) {

    //declare variable for mainain ajax load and entry or edit mode
    $scope.loading = true;
    $scope.addMode = false;

    //get all customer information
    $http.get('/api/Customer/').success(function (data) {
        $scope.customers = data;
        $scope.loading = false;
    })
    .error(function () {
        $scope.error = "An Error has occured while loading Customers!";
        $scope.loading = false;
    });

    //by pressing toggleEdit button ng-click in html, this method will be hit
    $scope.toggleEdit = function () {
        this.customer.editMode = !this.customer.editMode;
    };

    //by pressing toggleAdd button ng-click in html, this method will be hit
    $scope.toggleAdd = function () {
        $scope.addMode = !$scope.addMode;
    };

    //Insert Customer
    $scope.add = function () {
        $scope.loading = true;
        $http.post('/api/Customer/', this.newcustomer).success(function (data) {
            alert("Added Successfully!!");
            $scope.addMode = false;
            $scope.customers.push(data);
            $scope.loading = false;
        }).error(function (data) {
            $scope.error = "An Error has occured while Adding Customer! " + data;
            $scope.loading = false;
        });
    };

    //Edit Customer
    $scope.save = function () {
        alert("Edit");
        $scope.loading = true;
        var frien = this.customer;
        alert(frien);
        $http.put('/api/Customer/' + frien.CustomerID, frien).success(function (data) {
            alert("Saved Successfully!!");
            frien.editMode = false;
            $scope.loading = false;
        }).error(function (data) {
            $scope.error = "An Error has occured while Saving customer! " + data;
            $scope.loading = false;
        });
    };

    //Delete Customer
    $scope.deletecustomer = function () {
        $scope.loading = true;
        var Id = this.customer.CustomerID;
        $http.delete('/api/Customer/' + CustomerID).success(function (data) {
            alert("Deleted Successfully!!");
            $.each($scope.customers, function (i) {
                if ($scope.customers[i].id === Id) {
                    $scope.customers.splice(i, 1);
                    return false;
                }
            });
            $scope.loading = false;
        }).error(function (data) {
            $scope.error = "An Error has occured while Saving Customer! " + data;
            $scope.loading = false;
        });
    };

}
})();