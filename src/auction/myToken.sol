// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "../../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "../../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
contract Bond is ERC20 {
    constructor() ERC20("Auction", "AUC") {}
    function mint(address add, uint256 amount) public {
        _mint(add, amount);
    }
  
}