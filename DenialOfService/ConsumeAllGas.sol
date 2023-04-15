// This contract consumes all the gas im TrickleWallet.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ConsumeAllGas {
    function () payable {
        // an assert consumes all transaction gas, unlike a
        // revert which returns the remaining gas
        assert(1==2);
    }
}


// Solution is to linit gas stipend

partner.call.gas(50000).vakue(amountToSend);
