// SPDX-License-Identifier: UNLICENCED

// Homework 7
// Adding more functionality to the Volcano Coin contract
// 1. We made a payment mapping, but we haven’t added all the functionality for it yet.
// Write a function to view the payment records, specifying the user as an input.
// What is the difference between doing this and making the mapping public ?
// 2. For the payments record mapping, create a function called recordPayment that
// takes
// 1. the sender’s address,
// 2. the receiver’s address and
// 3. the amount
// as an input, then creates a new payment record and adds the new record to the
// user’s payment record.
// 3. Each time we make a transfer of tokens, we should call the this recordPayment
// function to record the transfer.

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract VolcanoCoin is Ownable {
    

    uint256 totalSupply = 10000;

    constructor() Ownable () {
        balances[owner()] = totalSupply;
        totalSupply = 0; 
    }



    function retrieveTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    event currentSupply(uint256);

    function addAmount() public onlyOwner {
        totalSupply += 1000;
        emit currentSupply(totalSupply);
    }

    mapping(address => uint256) public balances;

    event transfer(address , uint256);

    function transferFunds(address _recipient, uint256 _amount) public payable {
        require(_amount > 0,"Amount must be > 0");
        require(balances[msg.sender] >= _amount,"Insufficient funds");
        balances[_recipient] += _amount;
        balances[msg.sender] -= _amount;
        emit transfer(_recipient, _amount);

        recordPayment(msg.sender, _recipient, _amount);
    }

    struct Payment {
        address recipient;
        uint amount;
    }

    mapping (address => Payment[]) public paymentsHistory;

    function getpaymentsHistory(address _user) public view returns(Payment[] memory) {
        return paymentsHistory[_user];
    }


    function recordPayment ( address _sender , address _receiver, uint256 _amount) public payable{

        paymentsHistory[_sender].push(Payment({recipient:_receiver, amount:_amount }));
    }


}
