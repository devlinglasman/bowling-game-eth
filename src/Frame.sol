// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Frame {
    // The frame maintains its state - it will ultimately tell you its score including
    // strikes and spares, calculated by rolls in the next frame. The game has to add
    // values to it.

    uint256 public frameNumber;
    uint256 public firstRoll;
    uint256 public secondRoll;

    function setFirstRoll(uint value) public {
        firstRoll = value;
    }

    function setSecondRoll(uint value) public {
        secondRoll = value;
    }

    function isFrameFinished() public view returns (bool) {
        require(firstRoll != 0);
        return firstRoll == 10 || secondRoll != 0 ? true : false;
    }

    function scoreForFrame() public view returns (uint) {
        return firstRoll + secondRoll;
    }
}
