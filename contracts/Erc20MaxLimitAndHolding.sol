// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Erc20MaxLimitAndHolding is ERC20,Ownable {

    uint public constant MAX_HOLDING_OF_ADDRESS = 100;
    uint public constant MAX_TRANSFER_AMOUNT = 50;

    constructor() ERC20("YOUTOKEN", "YOU"){
        _mint(msg.sender,1000000);
    }

     function transfer(address to, uint256 amount) public  override returns (bool) {
        uint256 receiverHoldingTokens = balanceOf(to);
        if(to != owner()){
        require(receiverHoldingTokens < MAX_HOLDING_OF_ADDRESS, "ERC20: transfer amount exceeds MAX_HOLDING_OF_ADDRESS");
        require(amount < MAX_TRANSFER_AMOUNT, "ERC20: transfer amount exceeds MAX_TRANSFER_AMOUNT");
        require(receiverHoldingTokens+ amount <= MAX_HOLDING_OF_ADDRESS, "ERC20: transfer amount exceeds balance");
        _transfer(owner(), to, amount);
        return true;
        }else{
            _transfer(owner(), to, amount);
            return true;
        }
    }
}
