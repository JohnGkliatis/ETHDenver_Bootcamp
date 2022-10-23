// SPDX-License-Identifier: UNLICENCED

pragma solidity ^0.8.0;

contract VolcanoCoin {
    address owner;

    uint256 totalSupply = 10000;

    constructor() {
        owner = msg.sender;
        balances[owner] = totalSupply;
        totalSupply = 0;
    }

    modifier onlyOwner() {
        if (msg.sender == owner) {
            _;
        }
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

    function transferFunds(address _recipient, uint256 _amount) public {
        require(_amount > 0,"Amount must be > 0");
        require(balances[msg.sender] >= _amount,"Insufficient funds");
        balances[_recipient] += _amount;
        balances[msg.sender] -= _amount;
        paymentsHistory[msg.sender].push(Payment({recipient:_recipient, amount:_amount }));
        emit transfer(_recipient, _amount);
    }

    struct Payment {
        address recipient;
        uint amount;
    }

    mapping (address => Payment[]) public paymentsHistory;

    function getpaymentsHistory(address _user) public view returns(Payment[] memory) {
        return paymentsHistory[_user];
    }
}
