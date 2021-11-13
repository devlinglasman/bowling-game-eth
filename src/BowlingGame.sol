// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract BowlingGame {
    uint256 firstRoll;
    uint256 secondRoll;

    function roll(uint256 pinsKnockedDown) public {
        firstRoll = pinsKnockedDown;
    }

    function isFrameFinished() public view returns (bool) {
        if (firstRoll == 10) {
            return true;
        } else {
            return false;
        }
    }
}
