// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayInsert {
    uint[] public dataArray;

    // Function to insert a value at a given position
    function insertAt(uint position, uint value) public {
        require(position <= dataArray.length, "Invalid position");

        dataArray.push(0); // Increase array size by 1

        // Shift elements to the right starting from the end
        for (uint i = dataArray.length - 1; i > position; i--) {
            dataArray[i] = dataArray[i - 1];
        }

        dataArray[position] = value;
    }

    // Get the entire array
    function getArray() public view returns (uint[] memory) {
        return dataArray;
    }

    // Utility: get element at specific index
    function getElement(uint index) public view returns (uint) {
        require(index < dataArray.length, "Index out of bounds");
        return dataArray[index];
    }
}
