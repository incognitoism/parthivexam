// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vehicle {
    string public make;
    string public model;
    uint public year;
    string public fuelType;

    constructor(string memory _make, string memory _model, uint _year, string memory _fuelType) {
        make = _make;
        model = _model;
        year = _year;
        fuelType = _fuelType;
    }

    function fuelEfficiency() public pure virtual returns (uint) {}
    function distanceTravelled() public pure virtual returns (uint) {}
    function maxSpeed() public pure virtual returns (uint) {}
}

contract Car is Vehicle {
    constructor(string memory _make, string memory _model, uint _year, string memory _fuelType)
        Vehicle(_make, _model, _year, _fuelType) {}

    function fuelEfficiency() public pure override returns (uint) {
        return 15; // km/l
    }

    function distanceTravelled() public pure override returns (uint) {
        return 500;
    }

    function maxSpeed() public pure override returns (uint) {
        return 200;
    }
}

contract Truck is Vehicle {
    constructor(string memory _make, string memory _model, uint _year, string memory _fuelType)
        Vehicle(_make, _model, _year, _fuelType) {}

    function fuelEfficiency() public pure override returns (uint) {
        return 5;
    }

    function distanceTravelled() public pure override returns (uint) {
        return 800;
    }

    function maxSpeed() public pure override returns (uint) {
        return 120;
    }
}

contract Motorcycle is Vehicle {
    constructor(string memory _make, string memory _model, uint _year, string memory _fuelType)
        Vehicle(_make, _model, _year, _fuelType) {}

    function fuelEfficiency() public pure override returns (uint) {
        return 40;
    }

    function distanceTravelled() public pure override returns (uint) {
        return 300;
    }

    function maxSpeed() public pure override returns (uint) {
        return 180;
    }
}
