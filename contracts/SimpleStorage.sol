// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; //^0.8.8 means this one or above 

contract SimpleStorage { // like class in java
    //boolean (true-false), uint(unsigned integer), int(postive or negative), address(like metamask address), bytes
    //uint8-uint256 means 8 bits. default version is 256
    uint256 public favoriteNumber = 0; //auto init is internal
    //People public person = People({favoriteNumber: 2, name: "Sena"});
    
    mapping(string => uint256) public nameToFavItem; //like dictionary
    struct People {
        uint favoriteNumber;
        string name;
    }
    //uint256[] public numberList;
    People[] public people; //dynamic array because size  is not fixed
    function store (uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        //favoriteNumber += 1; // more things causes more gas consumption
    }
    //view and pure functions disallow modification of a state, they dont cost gas
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
    // calldata, memory means data is temporary also calldata variables cant be modified but memory can
    // storage exist even outside of function, perminant variables
    // only use for string, array or struct 
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavItem[_name] = _favoriteNumber;
    }

}