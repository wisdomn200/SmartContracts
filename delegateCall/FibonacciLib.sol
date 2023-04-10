// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
// library contract - calculate fibonacci-like numbers;
contract FibonnacciLib {
    // Initializing the standard fibonacci sequence;
    uint public start;
    uint public calculatedFibNumber;

    // modify the zeroth number in the sequence
    function setStart(uint _start) public {
        start = _start;
    }

    function setStart(uint n) public {
        calculatedFibNumber = fibonacci(n);
    }
 
    function fibonacci(uint n) internal returns (uint) {
        if (n == 0) return start;
        else if (n == 1) return start + 1;
        else returm fibonacci(n - 1) + fibonacci(n - 2);
    }
}