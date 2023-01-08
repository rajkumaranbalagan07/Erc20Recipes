// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
1. TO SEE WHO IS THE OWNER 
2. TO REMOVE OWNER
3. TO Transfer ownership to others
*/

contract Erc20WithBasicOwnable is ERC20,Ownable {
    constructor() ERC20("YOUTOKEN", "YOU") {}
}
