// SPDX-License-Identifier: MIT

//set the version of the compiler to use
pragma solidity ^0.6.0;

contract SimpleStorage {

    //this initialises the variable to 0
    uint256 favoritNumber;

    struct People {
        uint256 favoritNumber;
        string name;
    }

    //create a People array from the struct People
    //name it people
    People[] public people;
    mapping(string => uint256) public nameToFavoriteNumber;

    //this is a function
    function store(uint256 _favoriteNumber) public {
        favoritNumber = _favoriteNumber;
    }

    function retreive() public view returns(uint256){
        return favoritNumber;

    }

    function addPerson (string memory _name, uint256 _favoriteNumber) public {
        people.push(People({favoritNumber: _favoriteNumber,
                            name: _name}));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

}