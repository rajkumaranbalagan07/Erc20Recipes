// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/utils/Ownable.sol";

contract Erc20WithBasicfeatures is ERC20,Ownable {
    constructor() ERC20("YOUTOKEN", "YOU") {}
}
