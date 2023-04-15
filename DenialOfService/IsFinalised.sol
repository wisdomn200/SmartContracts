// Giving owners specific priveledges can be a vulnerability. 
// In this contract, the ICO requires the owner to finalize() 
// the contract which then allows tokens to be transferable.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

bool public IsFinalized = false;
address public owner; // gets set somewhere

function finalize() public {
    require(msg.sender == owner || now > unlockTime); // "|| now" prevents DOS from inactibe owner  
    IsFinalized == true;
}

// ... extra ICO functionality

// overloaded transfer function
function transfer(address _to, uint _value) returns (bool) {
    require(IsFinalized);
    super.transfer(_to,_value)
}

...