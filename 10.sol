// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library MathLib {
    function max(uint a, uint b) internal pure returns (uint) {
        return a > b ? a : b;
    }

    function min(uint a, uint b) internal pure returns (uint) {
        return a < b ? a : b;
    }

    function factorial(uint n) internal pure returns (uint) {
        uint result = 1;
        for (uint i = 2; i <= n; i++) {
            result *= i;
        }
        return result;
    }

    function power(uint base, uint exp) internal pure returns (uint result) {
        result = 1;
        for (uint i = 0; i < exp; i++) {
            result *= base;
        }
    }

    function isArmstrong(uint number) internal pure returns (bool) {
        uint original = number;
        uint sum = 0;
        uint digits = 0;
        uint temp = number;

        while (temp != 0) {
            digits++;
            temp /= 10;
        }

        temp = number;
        while (temp != 0) {
            uint digit = temp % 10;
            sum += power(digit, digits);
            temp /= 10;
        }

        return sum == original;
    }

    function fibonacci(uint n) internal pure returns (uint[] memory) {
        uint[] memory series = new uint[](n);
        if (n == 0) return series;
        if (n >= 1) series[0] = 0;
        if (n >= 2) series[1] = 1;

        for (uint i = 2; i < n; i++) {
            series[i] = series[i - 1] + series[i - 2];
        }

        return series;
    }
}
pragma solidity ^0.8.0;

import "./MathLib.sol"; // Only needed if you're using multiple files

contract MyMathContract {
    using MathLib for uint;

    function testMax(uint a, uint b) public pure returns (uint) {
        return MathLib.max(a, b);
    }

    function testFactorial(uint n) public pure returns (uint) {
        return MathLib.factorial(n);
    }

    function testArmstrong(uint n) public pure returns (bool) {
        return MathLib.isArmstrong(n);
    }

    function testFibonacci(uint n) public pure returns (uint[] memory) {
        return MathLib.fibonacci(n);
    }
}

