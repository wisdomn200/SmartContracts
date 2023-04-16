// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract KeylessEth {
    uint public currentContractNonce = 1; // Keep track of the contract's nonce publicly (it's also found in the contract's state)

    // determine future addresses which can hide eth
    function futureAddresses(uint8 nonce) public view returns (address) {
        if(nonce == 0) {
            return address(keccak256(0xd6, 0x94, this, 0x80));
        }
        return address(keccak256(0xd6, 0x94, this, nonce));
        // Implement rlp encoding properly for a full range of nonces
    }

    // Increment the contract nonce or retrieve eth from a hidden/key-less account
    // provided the nonce is correct
    function retrieveHiddenEth(address beneficiary) public returns (address) {
        currentContractNonce +=1;
        return new RecoverContract(beneficiary);
        function () payable {} // Allow eth transfers. (Good for remix)
    }
    contract RecoverContract {
        constructor(address beneficiary) {
            selfDestruct(beneficiary); // Don't deploy code. Return the eth stored here to beneficiary
        }
    }
}