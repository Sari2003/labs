// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ViewAndPure{
    
    uint public x=0;
    function addTox(uint y)public view returns(uint){
        return x+y;
    }

    function add(uint t, uint r)public pure returns(uint){
      
      return t+r;
    }
}