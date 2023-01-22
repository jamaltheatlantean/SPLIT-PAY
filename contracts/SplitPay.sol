// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

// ---> Error <---
error SplitPay__NotOwner();

contract SplitPay {

    // ---> Events <---
    
    event PaymentRecieved(address _from, uint _amount);
    event PayeeAdded(address account, uint shares);
    
    // ---> State Variables <---
    address payable [] public payees;
    address payable public owner;
    
    // ---> Modofier <---
    modifier onlyOwner() {
        if(msg.sender != owner) revert SplitPay__NotOwner();
        _;
    }

    constructor() {
        owner = payable(msg.sender);
    }

    receive() payable external {
        require(payees.length != 0, "No payee");
        uint256 share = msg.value / payees.length;

        for(uint i; i < payees.length; i++) {
            payees[i].transfer(share);
        }

        emit PaymentRecieved(msg.sender, msg.value);
    }

    function transferOwnership(address payable newOwner) external onlyOwner {
        owner = newOwner;
    }

    function addPayee(address payable [] memory _payees) external onlyOwner {
        for(uint i; i < _payees.length; i++) {
            payees.push(_payees[i]);
        }
    }

    function endContract() external onlyOwner {
        selfdestruct(owner);
    }
  
}
