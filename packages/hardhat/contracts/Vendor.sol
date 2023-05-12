pragma solidity 0.8.19; //Do not change the solidity version as it negativly impacts submission grading
// SPDX-License-Identifier: MIT

// learn more: https://docs.openzeppelin.com/contracts/4.x/api/access#Ownable
// @TODO: Vendor should inherit Ownable
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

// @TODO: Implement the Vendor smart contract
contract Vendor is Ownable {
    uint256 public constant tokensPerEth = 100;
    
    YourToken public yourToken;

    constructor(address tokenAddress) {
        yourToken = YourToken(tokenAddress);
    }

event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);

    function buyTokens() public payable {
        uint256 tokenAmount = msg.value * tokensPerEth;
        yourToken.transfer(msg.sender, tokenAmount);
        emit BuyTokens(msg.sender, msg.value, tokenAmount);
    }

    function withdraw() public onlyOwner(){
        payable(owner()).transfer(address(this).balance);
    }

    function sellTokens(uint256 amount) public payable {
    uint256 ethAmount = amount / tokensPerEth;
        yourToken.transferFrom(msg.sender, address(this), amount); //transfer tokens from user to contract
        payable(msg.sender).transfer(ethAmount);
    }
}
