// SPDX-License-Identifier: GPL-3.0

// learning the basics

pragma solidity >=0.7.0 <0.9.0;


contract Score {

    uint score=5;
    address owner;

    modifier onlyOwner(){
        if ( msg.sender == owner) {
            _;
        }
    }

    constructor() {
        owner = msg.sender;
    }

    function setScore(uint newScore) public {
        score = newScore;
    }

    function getScore() public view returns (uint) {
        return score;
    }

}
