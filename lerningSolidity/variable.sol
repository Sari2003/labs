// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Variables{

    string public text= "hello";
    uint num = 2;

    function SomeThing()public{

        uint i=256;
       
    }
    uint timeStamp= block.timestamp;//Current block timestamp
    address sender= msg.sender;
}