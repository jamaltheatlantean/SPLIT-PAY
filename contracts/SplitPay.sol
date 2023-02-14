// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract SplitPay {
    event PaymentRecieved(uint indexed payLoad);
    event PaymentReleased(uint indexed payLoad);
    event PayeeAdded(address indexed _payee, uint timestamp);
    event PayeeRemoved(address indexed _payeeToRemove, uint timestamp);

    uint public approvalCount;
    uint public numOfConfirmations;

    uint public approvalToRemove;

    address payable [] public payees;

    mapping(address => bool) public isPayee;
    mapping(address => bool) public hasApproved;
    mapping(address => bool) public votedToRemove;

    modifier onlyPayees() {
        require(isPayee[msg.sender], "error: not payee");
        _;
    }
    
    constructor(uint _numOfConfirmations, address payable [] memory _payees) {
        require(_numOfConfirmations > 0, "error: invalid number of required confirmations");
        for (uint i = 0; i < _payees.length; i++) {
            address payee = _payees[i];

            require(payee != address(0), "error: invalid address");
            require(!isPayee[payee], "error: payee already exists");

            isPayee[payee] = true;
        }
        payees = _payees; 
        numOfConfirmations = _numOfConfirmations;
    }

    /* PUBLIC FUNCTIONS */
    function addPayee(address payable _payee) public onlyPayees {
        require(_payee != address(0), "error: invalid address");
        require(isPayee[_payee] != true, "error: payee already exists");
        require(hasApproved[msg.sender] != true, "error: msg.sender has already approved");
        approvalCount += 1;
        if(approvalCount >= numOfConfirmations) {
            isPayee[_payee] = true;
            payees.push(_payee);
        }

        hasApproved[msg.sender] = true;
        // emit event
        emit PayeeAdded(_payee, block.timestamp);
    }

    function removePayee(address _payeeToRemove) public onlyPayees {
        require(votedToRemove[msg.sender] != true, "error: already voted to remove");
        if(approvalToRemove >= numOfConfirmations) {
        address payable[] memory newPayees = new address payable [](payees.length - 1);
        uint j = 0;
        for(uint i = 0; i < payees.length; i ++) {
            if(payees[i] != _payeeToRemove) {
                newPayees[j] = payees[i];
                j++;
            }
        }
        payees = newPayees;
        isPayee[_payeeToRemove] = false;
        }
        approvalToRemove += 1;
        votedToRemove[msg.sender] = true;

        // emit event
        emit PayeeRemoved(_payeeToRemove, block.timestamp);
    }

    receive() payable external {
        uint256 payLoad = msg.value / payees.length;
        for(uint i; i < payees.length; i++) {
            payees[i].transfer(payLoad);
        }

        emit PaymentRecieved(msg.value);
        emit PaymentReleased(msg.value);
    }

    /* GETTER FUNCTIONS */
    
    function getNumOfPayees() public view returns(uint256) {
        return payees.length;
    }

    function getPayee(uint256 index) public view returns(address payable) {
        return payees[index];
    }

    function getPayees() public view returns (address payable [] memory) {
        return payees;
    }
}
