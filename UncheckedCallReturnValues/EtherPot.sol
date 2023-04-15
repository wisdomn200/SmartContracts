// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// EtherKing's contract had incorrectly used block hashes
// and an unchecked call value.

...
function cash(uint roundIndex, uint subpotIndex) {
    var subpotsCount = getSubpotsCount(roundIndex);

    if(subpotIndex>= subpotsCount)
        return;

    var decisionBlockNumber = getDecisionBlockNumber(roundIndex, subpotIndex);

    if(decisionBlockNumber>block.number)
        return;
    
    if(rounds[roundIndex].isCashed[subpotIndex])
        return;
    //Subpots can only be cashed once. This is to prevent double payouts

    var winner = calculatedWinner(roundIndex,subpotIndex);
    var subpot = getSubpot(roundIndex);

    winner.send(subpot); // Use Transfer() instead of send()

    rounds[roundIndex].isCashed[subpotIndex] = true;
    // Mark the rounds as cashed
}
...