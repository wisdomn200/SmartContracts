// This contract shows how to perform an airdrop with one smart contract
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


function redeem(uint256 index, address recipient,
                uint256 amount, bytes32[] merkleProof) public {
                
                // Make sure this has not been redeemed
                uint256 redeemBlock = _redeemed[index / 256];
                uint256 redeemMask = (uint256(1) << uint256(index % 256));
                require((redeemBlock & redeemMask) == 0);

                // Mark it as redeemed (if we fail, we revert)
                _redeemed[index / 256] = redeemBlock | redeemMask;

                // Compute the merkle root from the merkle proof
                bytes32 node = keccak256(index, recipient, amount);
                uint256 path = index;
                for (uint16 i = 0; i < merkleProof.length; i++) {
                    if ((path & 0x01) == 1) {
                        node = keccak256(merkleProof[i], node);
                    } else {
                        node = keccak256(node, merkleProof[i]);
                    }
                    path /= 2;
                }

                // Check the resolved merkle proof matches our merkle root
                require(node == _rootHash);

                // Redeem!
                _balances[recipient] += amount;
                _totalSupply += amount;
                Tranfer(0, recipient, amount)
            }