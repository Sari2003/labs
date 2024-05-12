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
        uint tokenId;


    }
    address payable private owner;
    mapping(address => suggest) public suggestions;
    uint256 max;
    bool start=false;
    uint end;
    address[] public stack;    
    uint256 public constant SEVEN_DAYS = 604800;// שבעה ימים בשניות של קיום המכירה

     constructor() {
        owner = payable(msg.sender);
        end = block.timestamp + SEVEN_DAYS;
        start = true;
       
    }
    modifier onlyOwner(){
        require(
            owner == msg.sender ,
            "Only the owner and the gabaim allowed to withdraw Ether");
            _;
    }

    //הכנסת הצעה חדשה
    function addSuggest(uint amount, uint tokenId) public {

        require(start , "The auction doesnt start");
        if(block.timestamp < end){
            //הכנסת הצעה חדשה רק במקרה שההצעה הקודמת קטנה ממנה
            require (suggestions[stack[stack.length]].amount < amount, "You should offer a higher amount");
              
                //במקרה שהמציע כבר קיים
            if (suggestions[msg.sender].amount > 0 ){ 

                uint lastSuggest = suggestions[msg.sender].amount;
                require(msg.sender.balance >= amount , "you do not have enough money");
                suggestions[msg.sender].amount = amount;
                suggestions[msg.sender].tokenId = tokenId;
                 //קבלת הכסף של ההצעה החדשה של לקוח קיים
                 transferFrom(msg.sender,address(this),amount);
                 //החזרת הכסף של ההצעה הקודמת
                payable(suggestions[msg.sender]).transfer(lastSuggest);                     
                stack.push(msg.sender);
            }
            else {//משתמש חדש

                require(msg.sender.balance >=amount , "you do not have enough money");
                suggestions[msg.sender].amount= amount;
                suggestions[msg.sender].tokenId = tokenId;
                suggestions[msg.sender].flag = true;
                transferFrom(msg.sender, address(this) , amount);
                stack.push(msg.sender);
            }
       }
       else{
            start=false;
            endAuction();
        }

    }
    //הסרת הצעה
    function removeSugget() public {

        require(start , "The auction doesnt start");
        require(block.timestamp < end , "The Auction is over");
        require(suggestions[msg.sender].flag == true, "");

            payable(suggestions[msg.sender]).transfer(suggestions[msg.sender].amount);    
            suggestions[msg.sender].flag = false;
        }


    // פונקציה שמתבצעת רק כאשר עוברים שבעה ימים מהפעלת החוזה
    function endAuction() external onlyOwner{

        uint i= stack.length; 
        for(;i>=0 && suggestions[stack[i]].flag == false; i--){}
        //ERC721.transferfrom(address(this), stack[i], suggestions[stack[i]].tokenId);
        IERC721(stack[i]).transferFrom(address(this), suggestions[stack[i]].tokenId);
        for(uint j= i-1; j>=0; j--){
            if(suggestions[stack[i]].flag)
            //החזרת הכסף לכל ההצעות שלא זכו לאחר סיום המכירה
             payable(suggestions[stack[j]]).transfer(suggestions[stack[j]].amount);         
        }

    }
}