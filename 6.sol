// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract Shape {
    function getArea() public view virtual returns (uint);
    function getPerimeter() public view virtual returns (uint);
}

// 🟠 Circle
contract Circle is Shape {
    uint public radius;

    constructor(uint _radius) {
        radius = _radius;
    }

    function getArea() public view override returns (uint) {
        return 314 * radius * radius / 100; // Approx π ≈ 3.14, scaled to avoid floating point
    }

    function getPerimeter() public view override returns (uint) {
        return 628 * radius / 100; // Approx 2πr
    }
}

// 🟦 Rectangle
contract Rectangle is Shape {
    uint public length;
    uint public breadth;

    constructor(uint _length, uint _breadth) {
        length = _length;
        breadth = _breadth;
    }

    function getArea() public view override returns (uint) {
        return length * breadth;
    }

    function getPerimeter() public view override returns (uint) {
        return 2 * (length + breadth);
    }
}

// 🔺 Triangle (Assuming simple triangle with known sides)
contract Triangle is Shape {
    uint public a;
    uint public b;
    uint public c;
    uint public height; // for area
    uint public base;

    constructor(uint _a, uint _b, uint _c, uint _base, uint _height) {
        a = _a;
        b = _b;
        c = _c;
        base = _base;
        height = _height;
    }

    function getArea() public view override returns (uint) {
        return (base * height) / 2;
    }

    function getPerimeter() public view override returns (uint) {
        return a + b + c;
    }
}
