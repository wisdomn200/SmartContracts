// This Contract shows a vulnerability When the contract name gets modified, or a typo error in the constructor's nane
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract OwnerWallet {
    address public owner;

    // constructor. The constructor name is different from the function name, 
    // which is a vulnerability
    function ownerWallet(address _owner) public {   
        owner = _owner;
    }

    // fallback. Collect ether.
    fallback() external payable {}

    function withdraw() public {
        require(msg.sender == owner);
        payable(msg.sender).transfer(address(this).balance);
    }
}

// Solution: Use the constructor() keyword to specify the constructor