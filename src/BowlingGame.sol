// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract BowlingGame {
    uint256 firstRoll;
    uint256 secondRoll;

    function roll(uint256 pinsKnockedDown) public {
        firstRoll != 0 ? secondRoll = pinsKnockedDown : firstRoll = pinsKnockedDown;
    }

    function isFrameFinished() public view returns (bool) {
        require(firstRoll != 0);
        return firstRoll == 10 || secondRoll != 0 ? true : false;
    }
}
