// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library MathLib {
    function square(uint x) public pure returns (uint) {
        return x * x;
    }

    function sqrt(uint x) public pure returns (uint) {
        if (x == 0) return 0;
        uint z = (x + 1) / 2;
        uint y = x;
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
        return y;
    }

    function abs(int x) public pure returns (uint) {
        return uint(x < 0 ? -x : x);
    }

    function max(uint a, uint b) public pure returns (uint) {
        return a >= b ? a : b;
    }

    function min(uint a, uint b) public pure returns (uint) {
        return a <= b ? a : b;
    }
}


//// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./MathLib.sol";

contract TestMath {
    using MathLib for uint;
    using MathLib for int;

    function testSquare(uint x) public pure returns (uint) {
        return MathLib.square(x);
    }

    function testSqrt(uint x) public pure returns (uint) {
        return MathLib.sqrt(x);
    }

    function testAbs(int x) public pure returns (uint) {
        return MathLib.abs(x);
    }

    function testMax(uint a, uint b) public pure returns (uint) {
        return MathLib.max(a, b);
    }

    function testMin(uint a, uint b) public pure returns (uint) {
        return MathLib.min(a, b);
    }
}
