//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.20;
import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";
import "@openzeppelin/ERC721/ERC721.sol";

contract AuctionTest in Test {

    Auction auction;
   
    function setUp() public{

      auction = new Auction();     
      
    }

    function testAddSuggest()public{

        uint amount = 1000;
        address userAddress= vm.addr(1234);
        vm.startPrank(userAddress);
        vm.deal(userAddress,amount);
        auction.addSuggest(amount);
        assertEq(auction.stack[auction.stack.length].amount, 1000, "the amount is not equal);
        vm.stopPrank();
    }

    function testRemoveSuggest(){

    }


}