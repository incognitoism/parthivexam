// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRecords {
    struct Student {
        uint roll;
        string name;
        uint marksInPhysics;
        uint marksInChemistry;
        uint marksInMathematics;
        uint totalMarks;
    }

    Student[] public students;

    function addStudent(
        uint _roll,
        string memory _name,
        uint _phy,
        uint _chem,
        uint _math
    ) public {
        uint total = _phy + _chem + _math;
        students.push(Student(_roll, _name, _phy, _chem, _math, total));
    }

    function sortStudentsByTotalMarks() public {
        for (uint i = 0; i < students.length; i++) {
            for (uint j = i + 1; j < students.length; j++) {
                if (students[j].totalMarks > students[i].totalMarks) {
                    Student memory temp = students[i];
                    students[i] = students[j];
                    students[j] = temp;
                }
            }
        }
    }

    function getAllStudents() public view returns (Student[] memory) {
        return students;
    }
}
