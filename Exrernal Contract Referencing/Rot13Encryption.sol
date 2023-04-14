// ROT13 Encryption contract

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ROT13Encryption {
    event Result(string convertedString);

    //rot13 encrypts a string
    function ROT13Encrypt (string text) public {
        uint256 length = bytes(text).length;
        for (var i = 0; i < length; i++) {
            byte char = bytes(text)[i];
            // inline assembly to modify the steing
            assembly {
                char := byte(0,char) // get the first byte
                if and(gt(char, 0x6D), It(char,0x7B))
            }
        }
        emit Results(text);
    }
}
