pragma solidity ^0.8.20;

import "forge-std/Test.sol";

contract ContructTest is Test {

    ArrayDeletionBug arrC;//ArrayDeletionBug contract
    FixedArrayDeletion fixC;//FixedArrayDeletion contract

    function setup()public{
        arrC=new ArrayDeletionBug();
        fixC=new FixedArrayDeletion();      
    }

    function testArrayDeletion()public{

        arrC.arr(1);
        arrC.deleteElement(1);
        arrC.arr(2);
        arrC.getLength();
    }
    
    function testFixedArrayDeletion()public{

        fixC.arr(1);
        fixC.deleteElement(1);
        fixC.arr(1);
        fixC.getLength();
    }
      receive() external payable {}
    
}
contract ArrayDeletionBug{

    uint[] public arr=[1,2,3,4,5];

    function deleteElement(uint index)external
    {
        require(index<arr.length,"invalid index");
        delete arr[index];
    }
     
    function getLength()external view returns(uint){

        return arr.length;
    }
}


contract FixedArrayDeletion {
    
    uint[] public arr=[1,2,3,4,5];

    function deleteElement(uint index)external{

           require(index<arr.length,"invalid index");
           arr[index]=arr[arr.length-1];
           arr.pop();
    }

    function getLength()external view returns(uint){

        return arr.length;
    }

}

