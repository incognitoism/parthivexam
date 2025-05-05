// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract ThreeDObject {
    function surfaceArea() public view virtual returns (uint);
    function volume() public view virtual returns (uint);
}

contract Cube is ThreeDObject {
    uint side;

    constructor(uint _side) {
        side = _side;
    }

    function surfaceArea() public view override returns (uint) {
        return 6 * side * side;
    }

    function volume() public view override returns (uint) {
        return side * side * side;
    }
}

contract Cylinder is ThreeDObject {
    uint radius;
    uint height;

    constructor(uint _r, uint _h) {
        radius = _r;
        height = _h;
    }

    function surfaceArea() public view override returns (uint) {
        return 2 * 314 * radius * (radius + height) / 100;
    }

    function volume() public view override returns (uint) {
        return 314 * radius * radius * height / 100;
    }
}

contract Cone is ThreeDObject {
    uint radius;
    uint height;

    constructor(uint _r, uint _h) {
        radius = _r;
        height = _h;
    }

    function surfaceArea() public view override returns (uint) {
        uint l = sqrt(height**2 + radius**2);
        return (314 * radius * (radius + l)) / 100;
    }

    function volume() public view override returns (uint) {
        return (314 * radius * radius * height) / (3 * 100);
    }

    function sqrt(uint x) private pure returns (uint y) {
        y = x;
        uint z = (x + 1) / 2;
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
    }
}

contract MainContract {
    Cube public cube = new Cube(3);
    Cylinder public cylinder = new Cylinder(2, 5);
    Cone public cone = new Cone(2, 5);
}
