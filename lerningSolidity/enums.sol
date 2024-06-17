// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Enums{
    enum Colors{
        red, blue, yellow, green
    }

    Colors public color;

    function get()public view returns(Colors){

        return color;
    }

    function set(Colors c)public{

        color=c;
    }

    function green()public{

        color=Colors.green;
    }

    function reset()public{
        delete color;
    }
}