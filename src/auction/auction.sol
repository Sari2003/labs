// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/console.sol";
import "@openzeppelin/ERC721/ERC721.sol";
import "@openzeppelin/ERC20/ERC20.sol";

//import "./SafeMath.sol";

contract Auction is ERC20, ERC721 {
  
    struct suggest{

        bool flag;
        uint amount;

    }
    address payable private owner;
    mapping(address => suggest) public suggestions;
    uint256 max;
    bool start=false;
    uint end;
    address[] public stack;
    uint256 public activationTime;//זמן ההפעלה של החוזה
    uint256 public constant SEVEN_DAYS = 7 days;// זמן קיום המכירה

     constructor() {
        owner = payable(msg.sender);
        end = block.timestamp() + 7;
        start = true;
       
    }
    modifier onlyOwner(){
        require(
            owner == msg.sender ,
            "Only the owner and the gabaim allowed to withdraw Ether");
            _;
    }

    //הכנסת הצעה חדשה
    function addSuggest() public {

        require(start , "The auction doesnt start");
        if(block.timestamp < end){
            //הכנסת הצעה חדשה רק במקרה שההצעה הקודמת קטנה ממנה
            require (suggestions[stack[stack.length]].amoumt < msg.sender, "You should offer a higher amount");
                
                //במקרה שהבן אדם כבר קיים
            if (suggestions[msg.sender].amoumt > 0 ){ 

                uint lastSuggest = suggestions[msg.sender].amoumt;
                require(msg.sender.balance >=msg.value , "you do not have enough money");
                suggestions[msg.sender].amoumt = msg.value;
               // payable(transferFrom(msg.sender, address(this) , msg.value));
                ERC20.transfer(msg.sender, lastSuggest);
                stack.push(msg.sender);
            }
            else {//משתמש חדש

                require(msg.sender.balance >=msg.value , "you do not have enough money");
                suggestions[msg.sender].amoumt= msg.value;
                suggestions[msg.sender].flag = true;
                ERC20.transferFrom(msg.sender, address(this) , msg.value);
                stack.push(msg.sender);
            }
       }
       else{
            start=false;
            //endAuction();
        }

    }
    //הסרת הצעה
    function removeSugget() public {

        require(start , "The auction doesnt start");
        require(block.timestamp < end , "The Auction is over");
        require(suggestions[msg.sender].flag == true, "");

            //ERC20.transfer(msg.sender, lastSuggest);
            suggestions[msg.sender].flag = false;
        }


    // פונקציה שמתבצעת רק כאשר עוברים שבעה ימים מהפעלת החוזה
    function endAuction() external onlyOwner{

        uint i= stack.length; 
        for(;i>=0 && suggestions[stack[i]].flag == false; i--){}
        ERC721.transfer(suggestions[stack[i]], 1);
        for(uint j= i-1; j>=0; j--){
            if(suggestions[stack[i]].flag)
                ERC20.transfer(suggestions[stack[j]], suggestions[stack[j]].amoumt);
        }

    }
}