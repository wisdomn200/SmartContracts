// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract Wallet is WalletEvents {
    ...

    // METHODS

    // gets called when no other function matches
    function() payable {
        // just being sent some cash?
        if (msg.value > 0)
           Deposit(msg.sender, msg.value);
        else if (msg.data.length > 0)
        _walletLibrary.delegatecall(msg.data);  
    }

    ...

    // FIELDS
    address constant _walletLibrary = 0xcafecafecafecafecafecafecafecafecafecafe;

}