// This contact shows a looping through externally manipulated mappings or arrays 
// In thsi contract, Tokens are distributed between investors.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract DistributeTokens {
    address public owner; // gets set somwhere
    address[] investors; // array of investors
    uint[] investorTokens; // The amount of tokens each investor gets

    // ... extra functionality, including transferToken()
    
    function invest() public payable {
        require(msg.sender == owner); // only owner
        for(uint i = 0; i < investors.length; i++ ) {   // This mapping can be manipulated
            // here transferToken(to,amount)transfers "amount" of tokens to the address "to"
            transferToken(investors[i], investorTokens[i]);
        }
    }
}