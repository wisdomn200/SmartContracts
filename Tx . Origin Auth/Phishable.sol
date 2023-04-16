// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Phishable {
    address public owner;

    constructor (address _owner) {
        owner = _owner;
    }

    function () public payable {} // collect eth

    function withdrawAll(address _recipient) public {
        require(tx.origin == owner); // tx.origin is vulnerable
        _recipient.transfer(this.balance);
    }
}