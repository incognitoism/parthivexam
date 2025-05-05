// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LibrarySystem {
    struct Book {
        string name;
        string author;
        string publisher;
        uint price;
        string branch;
    }

    Book[] public books;

    function addBook(
        string memory _name,
        string memory _author,
        string memory _publisher,
        uint _price,
        string memory _branch
    ) public {
        books.push(Book(_name, _author, _publisher, _price, _branch));
    }

    function getBooksByPublisher(string memory _publisher) public view returns (Book[] memory) {
        uint count = 0;
        for (uint i = 0; i < books.length; i++) {
            if (keccak256(bytes(books[i].publisher)) == keccak256(bytes(_publisher))) {
                count++;
            }
        }

        Book[] memory result = new Book[](count);
        uint index = 0;
        for (uint i = 0; i < books.length; i++) {
            if (keccak256(bytes(books[i].publisher)) == keccak256(bytes(_publisher))) {
                result[index++] = books[i];
            }
        }

        return result;
    }

    function getBooksByBranch(string memory _branch) public view returns (Book[] memory) {
        uint count = 0;
        for (uint i = 0; i < books.length; i++) {
            if (keccak256(bytes(books[i].branch)) == keccak256(bytes(_branch))) {
                count++;
            }
        }

        Book[] memory result = new Book[](count);
        uint index = 0;
        for (uint i = 0; i < books.length; i++) {
            if (keccak256(bytes(books[i].branch)) == keccak256(bytes(_branch))) {
                result[index++] = books[i];
            }
        }

        return result;
    }
}
