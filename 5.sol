// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MatrixMax {
    uint[][] public matrix;

    function addRow(uint[] memory row) public {
        matrix.push(row);
    }

    function findMax() public view returns (uint) {
        require(matrix.length > 0, "Matrix is empty");
        uint max = matrix[0][0];

        for (uint i = 0; i < matrix.length; i++) {
            for (uint j = 0; j < matrix[i].length; j++) {
                if (matrix[i][j] > max) {
                    max = matrix[i][j];
                }
            }
        }

        return max;
    }
}
