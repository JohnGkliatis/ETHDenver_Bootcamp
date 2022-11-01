// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

// import https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract VolcanoNFT is ERC721 {

    constructor() ERC721(string memory _name, string memory _symbol){

    }

   
}
