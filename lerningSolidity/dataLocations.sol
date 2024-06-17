// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract DataLocations{

    uint256[] public arr;

    mapping(uint => address) map;
    struct MyStruct{
       
       uint num;
    }
    mapping(address=>MyStruct) myStructs;
   
    function f1()public{
              
      f2(myStructs[1],arr, map);
      MyStruct storage myS=myStructs[1];
      MyStruct memory mySM=myStructs(1);

    }

    function f2(MyStruct storage _myStructs ,uint [] storage _arr, mapping(uint=>address)storage _map)internal{

        //...
    }
    function g(uint256[] memory _arr) public returns (uint256[] memory) {
        //...
    }

    function h(uint256[] calldata _arr) external {
        // ...
    }
   


}