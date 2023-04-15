// This contract shows a vulnerability that occurs from
// wrongly implemented integer types. 
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FunWithNumbers {
    uint constant public tokensPerEth = 10;
    uint constant public weiPerEth = 1e18;
    mapping(address => uint) public balances;

    function buyTokens() public payable {
       uint tokens = msg.value/weiPerEth*tokensPerEth; // convert wei to eth, then multiply by token rate
       balances[msg.sender] += tokens;
    }

     function sellTokens(uint tokens) public {
        require(balances[msg.sender] >= tokens);
        uint eth = tokens/tokensPerEth;
        balances[msg.sender] -= tokens;
        payable(msg.sender).transfer(eth*weiPerEth);
    }
}

// Solution: encsure that any ratio you use allows large numerators
// in fractions. Also be mindful of the order of the operations. 
// mul before div.  