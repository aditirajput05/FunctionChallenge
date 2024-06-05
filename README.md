# FunctionChallenge
The FunctionChallenge contract is a Solidity smart contract that allows for depositing and withdrawing funds. It includes functions to check the balance, deposit funds, and withdraw funds from the contract.

## Description
This contract consists of the following components:

owner: An address variable representing the owner of the contract.
balance: A uint256 variable representing the current balance of the contract.
Deposit event: An event emitted when funds are deposited into the contract.
Withdraw event: An event emitted when funds are withdrawn from the contract.
The contract includes the following functions:

constructor: Initializes the contract with an initial balance provided by the deployer.
getBalance(): Returns the current balance of the contract.
deposit(uint256 _amount): Allows the owner to deposit Ether into the contract.
withdraw(uint256 _withdrawAmount): Allows the owner to withdraw Ether from the contract, subject to certain conditions.

## Getting Started
To interact with the contract, follow these steps:

Deploy the contract to the Ethereum blockchain, specifying an initial balance.
Call the deposit function to add funds to the contract.
Call the withdraw function to withdraw funds from the contract, ensuring that the withdrawal amount is between 500 and 20,000 Ether and does not exceed the contract balance.
### Executing program
To run this program, you can utilize Remix, an online Solidity IDE. Begin by navigating to the Remix website at Remix Ethereum.

Once you're on the Remix website, initiate a new file by selecting the "+" icon in the left-hand sidebar. Save the file with a .sol extension (for instance, MyToken.sol). Then, copy and paste the provided code into the file.
```
javascript
solidity
Copy code
// SPDX-License-Identifier: MIT
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
```
To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile MyToken.sol" (or whatever the file name is) button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "MyToken" contract from the dropdown menu, and then click on the "Deploy" button.

After deployment, you can interact with the contract using the default addresses provided. You can mint new tokens to an address and burn tokens from an address. Each address acts as a different user, allowing you to perform various operations on it.

## Authors

Aditi Rajput
[@Chandigarh University](https://www.linkedin.com/in/aditi-rajput-b9360720b/)


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
