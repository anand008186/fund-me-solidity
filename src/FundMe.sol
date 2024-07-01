// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//get funds from users
// withdraw funds 
//set a minimum funding value in USD
import {PriceConverter} from "./PriceConverter.sol";

error NotOwner();
contract FundMe {
    using PriceConverter for uint;
   
    uint256 public constant MIN_USD  = 5e18;
    address[] public funders;
    mapping(address funder => uint256 amountFunded) public Fund;
    address public immutable i_owner;
    constructor(){
        i_owner = msg.sender;
    }

    modifier onlyOwner(){
        if(msg.sender != i_owner){
            revert NotOwner();
        }
       
        _;
    }

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }

    function fund() public payable  {
       require(msg.value.getConversionRate() > MIN_USD ,"Send Enough Ether");
       if(Fund[msg.sender]== 0) {
         funders.push(msg.sender);
       }
       Fund[msg.sender] += msg.value;

    }

    function withdraw() public onlyOwner {
      for (uint index = 0; index <funders.length; index++) 
      {
         Fund[funders[index]] = 0;
      }
      delete funders;
     (bool success,) = payable(msg.sender).call{value: address(this).balance}("");
      require(success, "Transfer call failed");
    }

  

}