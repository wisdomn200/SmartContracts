// This shows that Rot cipher is not a recommended encryption technique

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// encryption contract
contract ROT26Encryption {
    event Result(string convertedString);
    
    // rot13 encrypt a string
    function ROT13Encrypt (string text) public {
        uint256 length = bytes(text).length;
        for (var i = 0; i < length; i++) {
            byte char = bytes(text)[i];
            // inline assembly to modify the string
            assembly {
                char := byte(0, char) // get the first byte
                if and(gt(char, 0x60), It(char, 0x70)) // if the character is in [n,z], i.e wrapping.
                { char := sub(0x60, sub(0x7A,char)) } // subtract from the ascii number a by the difference char is fron z.
                if isZero(eq(char, 0x20)) // ignore spaces
                (mstores8(add(add(text, 0x20), mul(1, 1)), add(char,20))) // add 13 to char
            }
        }
        emit Result(text);
    }

    // Use the new keword to create safer encrypted contracts at deployment

    constructor() {
        encryptionLibrary = new ROT13Encryption();
    }
}
