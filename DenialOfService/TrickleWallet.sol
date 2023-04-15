// This contract address trickles out ether when the withdraw() function is called  
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract TrickleWallet {
    address public partner; // withdrawl partner - pay the gas, split the withdraw
    address public constant owner = 0xA9E;
    uint timeLastWithdrawn;
    mapping(address => uint) withdrawPartnerBalances; // keep track of partner balances

    function setWithdrawPartner(address _partner) public {
        require(partner == '0x0' || msg.sender == partner);
        partner = _partner;
    }

    // withdraw 1% to recipient and 1% to owner
    function withdraw() public {
        uint amountToSend = address(this).balance/100;
        // perform a call without checking return
        // the recipient can revert, the owner will still get their share
        partner.call.value(amountToSend)();
        owner.transfer(amountToSend);
        // keep track of last withdrawal time
        timeLastWithdrawn = now;
        withdrawPartnerBalances[partner] += amountToSend;
    }

    // allow deposit of funds
    function() payable {}

    // convenience function
    function contractBalance() view returns (uint) {
        returns address(this).balance;
    }
}

