pragma solidity ^0.8.20;

contract Functions{

    function returnMany()external pure returns(uint, bool, uint){

        return (1,true, 55);
    }

    function assigned()external pure returns(uint x,bool bo, string memory s ){
        x=40;
        bo=false;
        s="vvv";
    }
    function named()external pure returns(uint x, bool bo, uint y){
        return(8,true,2);
    }

    function destructuringAssignments()external pure returns(uint, bool, uint, bool, uint){

        (uint x, bool b, uint y)=returnMany();
        (uint b1, uint z)=(true,,6);
        return(x,b,y,b1,z);
    }

    function arrInput(uint [] memory)public{}
    
    uint256[] public arr;
    function arrOutput()public view returns(uint [] memory){
        return arr;
    }

}

contract XYZ{

 function someFuncWithManyInputs(uint256 x,
        uint256 y,uint256 z,address a,bool b,string memory c ) public pure returns (uint256) 
        {}

    function callFunc() external pure returns (uint256) {
        return someFunc(1, 2, 3, address(0), true, "c");
    }

    function callFuncWithKeyValue() external pure returns (uint256) {
        return someFunc({ a: address(0), b: true, c: "c", x: 1,y: 2,z: 3});
    }

}

 