// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Lotto {
    bool public payedOut = false;
    address public winner;
    uint public winAmount;

    // ... extra functionality here
    
    function sendToWinner() public {
        require(!payedOut);
        winner.send(winAmount); // Use Tranfer() instead.
        // Transfer() reverts if the contact fails
        payedOut = true;
    }

    function withdrawLeftOver() public {
        require(payedOut);
        msg.sender.send(this.balance);        
    }
}