// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";


contract Erc20WithAutoBurn is ERC20,Ownable,ERC20Burnable {
    constructor() ERC20("YOUTOKEN", "YOU") {}
}
