// SPDX-License-Identifier: MIT
// This contract uses the fibonacciLibrary and has vulnerabilities

pragma solidity ^0.8.17;

 oontract FibonnaccIBalance {
    address public FibonacciLibrary;
    // The current fibomacci number to withdraw
    uint public calculatedFibNumber;
    // The starting fibonacci sequence number
    uint public start = 3;
    uint public withdrawalCounter;
    // The fibonacci function selector
    bytes constant fibSig = bytes4(sha3("setFibonacci(uint256)"));

    // constructor - loads the contract with ether
     constructor(address _fibonacciLibrary) public payable {
        fibonacciLibrary = _fibonacciLibrary;
     } 

     function withdraw() {
        withdrawalCounter += 1;
        // calculate the fibonacci number for the current withdrawal user
        // this sets calculatedFibNumber
        require(fibonacciLibrary.delegatecall(fibSig, withdrawalCounter));
        msg.sender.transfer(calculatedFibNumber * 1 ether);
     }

    //  allow users to call fibonacci library functions
    function() public {
        require(fibonacciLibrary.delegatecall(msg.data));
    }
 }