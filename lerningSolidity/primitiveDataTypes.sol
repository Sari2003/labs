pragma solidity ^0.8.20;

contract Primitve{

    bool public boo = true;

    uint8 public u8 = 1;
    uint256 public u256 = 123;

    int8 public i8=-1;
    int256 public i256 = -123;

    int256 public maxVal = type(int256).max;
    int256 public minVal = type(int256).min;

    address public add = '1234';
    
    bytes1 a = 0xb5;
    
    bool public defaultBoo; // false
    uint256 public defaultUint; // 0
    int256 public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
}