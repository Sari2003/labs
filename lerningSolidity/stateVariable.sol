// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StateVariable{

    uint public num=20;

    function Set(uint _num)public{
        num = _num;
    }

    function Get()public view returns(uint){

        return num;
    }
}