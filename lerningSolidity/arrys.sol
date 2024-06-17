// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Arrays{

    uint [] arr=[1,2,3,4,5];

    function remove(uint index)public()
    {
        require(index>arr.length-1,"the index is invalid");
        for(uint i=index; i<arr.length; i++){
            arr[i]=arr[i+1]
        }
        arr.pop();
    }

    function test()external{

        arr=[1,2,3,4,5];
        remove(2);
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);
    }


}