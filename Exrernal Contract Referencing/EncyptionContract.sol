// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "ROT13Encryption.sol";

// encrypt your top secret info
contract EncryptionContract {
    // library for encryption
    ROT13Encryption encryptionLibrary;

    // constructor - initialise the library
    constructor(ROT13Encryption _encryptionLibrary) {
        encryptionLibrary = _encryptionLibrary;
    }

    function encryptPrivateData(string privateInfo) {
        // Potentially do some operations here
        encryptionLibrary.ROT13Encrypt(privateInfo);
    }
}