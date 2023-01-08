// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
mint & burn by calling the internal function manually : in 2 ways
*/

contract Erc20WithBasicMintAndBurn is ERC20,Ownable {
    constructor() ERC20("YOUTOKEN", "YOU") {}

    // 1st way
    function mint(address account, uint256 amount)public{
        _mint(account,amount);
    }

    
    // UnComment & use it 
    // 2nd way
    // function _mint(address account, uint256 amount) internal override{
    //     // custom logic
    // }

    //   // 2nd way calling internal function
    // function mymint(address account, uint256 amount)public{
    //     _mint(account,amount);
    // }

    // =========== burn ==========
    
    // 1st way
    function burn(address account, uint256 amount)public{
        _burn(account,amount);
    }

    // UnComment & use it 
    // 2nd way
    // function _burn(address account, uint256 amount) internal override{
    //     // custom logic
    // }

    //   // 2nd way calling internal function
    // function _myburn(address account, uint256 amount)public{
    //     _burn(account,amount);
    // }


}
