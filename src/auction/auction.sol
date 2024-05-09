// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/console.sol";
import "@openzeppelin/ERC20/IERC20.sol";
import "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "./SafeMath.sol";

contract Auction is ERC20, ERC721 {
    using SafeMath for uint256;

    
    struct suggest{

        bool flag = false;
        uint amount;

    }

    address payable private owner;
    mapping(address => suggest) public suggestions;
    uint256 max;
    uint start;
    uint end;
    address[] public stack;
    uint256 public activationTime;//זמן ההפעלה של החוזה
    uint256 public constant SEVEN_DAYS = 7 days;// זמן קיום המכירה



     constructor() {
        owner = payable(msg.sender);
        end = block.timestamp() + 7;
        start = block.timestamp;
       
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
        require(block.timestamp < end , "The Auction is over");
        //הכנסת הצעה חדשה רק במקרה שההצעה הקודמת קטנה ממנה
        require (suggestions(stack[stack.length]).amoumt < msg.sender, "You should offer a higher amount"){  
            
            //במקרה שהבן אדם כבר קיים
            if (suggestions[msg.sender].amoumt > 0 ){ 

            uint lastSuggest = suggestions[msg.sender].amoumt;
            require(msg.sender.balance >=msg.value , "you do not have enough money");
            suggestions[msg.sender].amoumt = msg.value;
            ERC20.transferFrom(msg.sender, address(this) , msg.value);
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

    }
    //הסרת הצעה
    function removeSugget() public {

        require(start , "The auction doesnt start");
        require(block.timestamp < end , "The Auction is over");
        require(suggestions[msg.sender].flag == true){

            ERC20.transfer(msg.sender, lastSuggest);
            suggestions[msg.sender].flag = false;
        }
    }



    
    // פונקציה זו מפעילה את החוזה ומקבעת את זמן ההפעלה
    function activateContract() external {
        activationTime = block.timestamp;
    }

    // פונקציה זו מאפשרת לבדוק האם עברו כבר שבעה ימים מאז הפעלת החוזה
    function isSevenDaysPassed() public view returns (bool) {
        return block.timestamp >= activationTime.add(SEVEN_DAYS);
    }

    // פונקציה שמתבצעת רק כאשר עוברים שבעה ימים מהפעלת החוזה
    function myFunction() external {
        require(isSevenDaysPassed(), "Seven days have not passed yet.");
        // הכנס כאן את הפעולות שברצונך לבצע
    }
}