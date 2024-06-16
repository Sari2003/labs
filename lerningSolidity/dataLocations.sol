pragma solidity ^0.8.20;


contract DataLocations{

    uint256[] public arr;
    mapping(uint256 => address) map;
    struct MyStruct{
       
       uint num;
    }
    mapping(address=>MyStruct) myStructs;
    
}