// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MatrixOperator {
    
    // Add two matrices
    function addMatrices(uint[][] memory A, uint[][] memory B) public pure returns (uint[][] memory) {
        require(A.length == B.length && A[0].length == B[0].length, "Dimension mismatch");

        uint rows = A.length;
        uint cols = A[0].length;

        uint[][] memory result = new uint[][](rows);

        for (uint i = 0; i < rows; i++) {
            result[i] = new uint[](cols);
            for (uint j = 0; j < cols; j++) {
                result[i][j] = A[i][j] + B[i][j];
            }
        }

        return result;
    }

    // Subtract two matrices
    function subtractMatrices(uint[][] memory A, uint[][] memory B) public pure returns (uint[][] memory) {
        require(A.length == B.length && A[0].length == B[0].length, "Dimension mismatch");

        uint rows = A.length;
        uint cols = A[0].length;

        uint[][] memory result = new uint[][](rows);

        for (uint i = 0; i < rows; i++) {
            result[i] = new uint[](cols);
            for (uint j = 0; j < cols; j++) {
                result[i][j] = A[i][j] - B[i][j];
            }
        }

        return result;
    }

    // Multiply two matrices
    function multiplyMatrices(uint[][] memory A, uint[][] memory B) public pure returns (uint[][] memory) {
        require(A[0].length == B.length, "Matrix multiplication not possible");

        uint rows = A.length;
        uint cols = B[0].length;
        uint innerDim = B.length;

        uint[][] memory result = new uint[][](rows);

        for (uint i = 0; i < rows; i++) {
            result[i] = new uint[](cols);
            for (uint j = 0; j < cols; j++) {
                for (uint k = 0; k < innerDim; k++) {
                    result[i][j] += A[i][k] * B[k][j];
                }
            }
        }

        return result;
    }
}