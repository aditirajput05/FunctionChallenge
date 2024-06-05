// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract FunctionChallenge {
    address payable public owner;
    uint256 public balance;

    event Deposit(uint256 amount);
    event Withdraw(uint256 amount);

    constructor(uint initBalance) payable {
        owner = payable(msg.sender);
        balance = initBalance;
    }

    function getBalance() public view returns(uint256){
        return balance;
    }

    function deposit(uint256 _amount) public payable {
        require(msg.sender == owner, "You are not the owner of this account");

        balance += _amount;

        emit Deposit(_amount);
    }

    function withdraw(uint256 _withdrawAmount) public {
        require(msg.sender == owner, "You are not the owner of this account");
        require(_withdrawAmount >= 500, "Withdraw amount must be at least 500");
        require(_withdrawAmount <= 20000, "Withdraw amount exceeds maximum limit");

        require(balance >= _withdrawAmount, "Insufficient balance");

        balance -= _withdrawAmount;

        emit Withdraw(_withdrawAmount);
    }
}
