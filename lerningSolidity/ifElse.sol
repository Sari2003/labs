pragma solidity ^0.8.20;

contract IfElses{

    function foo(uint x)public pure returns(uint)
    {
        return x<10?1:2;
    }
    function foo2(uint x)public pure returns(uint)
    {
        if(x<10)
          return 1;
        else
           if(x<20)
              return 2;

           
    }
}