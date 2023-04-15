// This contract shows how an uninitialised local storage var can point to unexpected storage var
// A locked Name Registrar
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract NameRegistrar {
        bool public unlocked = false; // registrar locked, no name updates

        struct NameRecord { // map hashed to address
            bytes32 name;
            address mappedAddress;
        }
        mapping(address => NameRecord) public registeredNameRecord; // records who registered names
        mapping(bytes32 => address) public resolve; // resolves hashes to addresses
    
    function register(bytes32 _name, address _mappedAddress) public {
        // set up the new NameRecord
        NameRecord storage newRecord = registeredNameRecord[_mappedAddress];
        newRecord.name = _name;
        newRecord.mappedAddress = _mappedAddress;
        resolve[_name] = _mappedAddress;
        registeredNameRecord[msg.sender] = newRecord;

        require(unlocked); // only allow registration if contract is unlocked

    }

}