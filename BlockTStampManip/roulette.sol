// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Roulette {
    uint public pasteBlockTime;  // Forces one bet per block

    constructor() public payable {} // initially fund contract

    // fallback function used to make a bet
    function () public payable {
        require(msg.value == 10 ether); // must send 10 wther to play
        require(now != pasteBlockTime); // only 1 transaction per block
        pasteBlockTime = now;
        if(now % 15 == 0) {  // winner
            msg.sender.transfer(this.balance);
        }
    }
}