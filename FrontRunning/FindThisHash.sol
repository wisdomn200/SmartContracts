// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// If you can find the image of the hash, recieve 1000 ether
 

contract FindThisHash {
    bytes32 constant public hash = 0xb5b5b97fafd9855eec9b41f74dfb6c38f5951141f9a3ecd7f44d5479b630ee0a;

    constructor() public payable {} // load with ether

    function solve(string memory solution) public {
        require(hash == sha3(solution));
        payable(msg.sender).transfer(1000 ether);
    }
}