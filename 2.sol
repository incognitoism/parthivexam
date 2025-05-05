// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface College {
    function display() external view returns (string memory, uint);
}

contract Department {
    string public deptName;
    string public deptHead;

    function setDepartment(string memory _name, string memory _head) public {
        deptName = _name;
        deptHead = _head;
    }

    function getDepartment() public view returns (string memory, string memory) {
        return (deptName, deptHead);
    }
}

contract Student is Department, College {
    string public CollegeName;
    uint public CollegeCode;
    string public studentName;
    uint public regNo;
    uint public Marks;

    constructor(string memory _collegeName, uint _collegeCode) {
        CollegeName = _collegeName;
        CollegeCode = _collegeCode;
    }

    function setStudent(string memory _name, uint _regNo, uint _marks) public {
        studentName = _name;
        regNo = _regNo;
        Marks = _marks;
    }

    function display() public view override returns (string memory, uint) {
        return (CollegeName, CollegeCode);
    }

    function getReportCard() public view returns (string memory, uint, uint) {
        return (studentName, regNo, Marks);
    }
}
