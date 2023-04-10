// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract WalletLibrary is WalletEvents {
   
    ...

    // throw unless contract is not yet initialized;
    modifier only_uninitialized { if (m_numOwners > 0) throw; _; }

    // constructor - just pass on the owner array to the multiowned and
    // the limit to daylimit
    function initWallet(address[] _owners, uint _required, uint _daylimit) only_uninitialized {
        initDaylimit(_daylimit);
        initMultiowned(_owners, _required);
    }

    // Kills the contract sending everything to `_to`.
    function kill(address _to) onlymanyowners(sha3(msg.data)) external {
        suicide(_to);
    }

    ...
    
}