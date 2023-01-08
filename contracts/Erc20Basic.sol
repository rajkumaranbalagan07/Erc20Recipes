// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/*
2 Ways of creating the contract using inheritence 
*/

contract Erc20Basic1 is ERC20("YOUTOKEN", "YOU") {

}

contract Erc20Basic2 is ERC20 {
    constructor() ERC20("YOUTOKEN", "YOU") {}
}
