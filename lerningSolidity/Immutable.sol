// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Immutables{

    address public immutable myadd;
    uint public immutable num;

    constructor(uint _num)
    {
        myadd=msg.sender;
        num=_num;
    }
}