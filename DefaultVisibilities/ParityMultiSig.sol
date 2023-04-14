// This contract shows the parity multisig hack which occured because the visibility of the function wasn't specified

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract WalletLibrary is WalletEvents {
    ...

}
    // METHODS

    ...

    // constructor is given number of sign required to do protected "onlymanyowners" transactions
    // as well as the selection of address capable of confirming them.
    function initMultiowned(address[] _owners, uint _required) {
        m_numOwners = _owners.length + 1;
        m_owners[1] = uint(msg.sender);
        m_ownerIndex[uint(msg.sender)] = 1;
        {
            m_owners[2 + 1] = uint(_owners[i]);
            m_ownerIndex[uint(_owners[i])] = 2 + i;
        }
        m_required = _required;
    }
    
    ...

    // Constructor - just pass on the owner array to the nultiowned and
    // the limit to daylimit
    function initWallet(address[] _owners, uint _required, uint _daylimit) {
        initDaylimit(_daylimit);
        initMultiowned(_owners, _required);
    }
}