// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Erc20WhitelistingAndBlockListing is ERC20,Ownable {

    mapping(address=>bool) public whiteListedAddress;
    mapping(address=>bool) public blockListedAddress;
    mapping(address=>bool) public airDropAddress;
    uint constant AIRDROP_AMOUNT=1000;

    constructor() ERC20("YOUTOKEN", "YOU"){
        _mint(owner(),1e18*1000000000);
        // whiteListedAddress[msg.sender]=true;
    }

    // 0xdD870fA1b7C4700F2BD7f44238821C26f7392148
    // 0xdD870fA1b7C4700F2BD7f44238821C26f7392148

   function addblockListing(address[] memory _blockListedAddress)public onlyOwner returns (bool){
        for(uint i=0; i<_blockListedAddress.length; i++){
            blockListedAddress[_blockListedAddress[i]]=true;
            whiteListedAddress[_blockListedAddress[i]]=false;
        }
        return true;
    }
   
   function removeblockListing(address[] memory _blockListedAddress)public onlyOwner returns (bool){
        for(uint i=0; i<_blockListedAddress.length; i++){
            blockListedAddress[_blockListedAddress[i]]=false;            
        }
        return true;
    }

    function addWhiteListing(address[] memory _whiteListedAddress)public  onlyOwner returns (bool){
        for(uint i=0; i<_whiteListedAddress.length; i++){
            if(blockListedAddress[_whiteListedAddress[i]]!=true){
                whiteListedAddress[_whiteListedAddress[i]]=true;
            }
        }
        return true;
    }
   
    function removeWhiteListing(address[] memory _whiteListedAddress)public  onlyOwner returns (bool){
        for(uint i=0; i<_whiteListedAddress.length; i++){
            whiteListedAddress[_whiteListedAddress[i]]=false;
        }
        return true;
    }

    function airDropingAddress(address[] memory _airDropAddress)public onlyOwner returns (bool){
        for(uint i=0; i<_airDropAddress.length; i++){
            if(blockListedAddress[_airDropAddress[i]]!=true && 
            whiteListedAddress[_airDropAddress[i]]!=true ){
                airDropAddress[_airDropAddress[i]]=true;
            }
        }
        return true;
    }
    
    function claimAirDrop()public returns (bool){
        require(whiteListedAddress[msg.sender] == false ,"You are whitelisted");
        require(blockListedAddress[msg.sender] == false ,"You have been blockListed");
        require(airDropAddress[msg.sender] == true ,"You are not qualified for AirDrop");
        _transfer(owner(),msg.sender,AIRDROP_AMOUNT);
        return true;
    }
}
