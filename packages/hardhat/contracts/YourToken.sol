pragma solidity 0.8.19; //Do not change the solidity version as it negativly impacts submission grading
import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
// SPDX-License-Identifier: MIT

// learn more: https://docs.openzeppelin.com/contracts/4.x/erc20
// @TODO: YourToken should inherit ERC20


// @TODO: Implement the YourToken smart contract

contract YourToken is ERC20 {
    constructor() ERC20("PandaToken", "PANDA") {
        _mint(msg.sender, 1000*10**decimals());
    }
}
