// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract NestedMapping{
    
     mapping(address => mapping(uint256 => bool)) public nested;

     function get(address add, uint num)public view return(bool)
     {
        return nested[address][num];
     }

     function set(address add,uint num, bool boo)public{

        nested[add][num]=boo;
     }
     function remove(address add,uint num)public{
        
       delete nested[add][num];
     }
}