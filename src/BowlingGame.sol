// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./Frame.sol";

contract BowlingGame {
    // The game can interrogate the previous frame about whether it is waiting due
    // to a spare or strike, then give the next rolls to it.

    Frame currentFrame = new Frame();

    function roll(uint256 pinsKnockedDown) public {
        currentFrame.firstRoll() != 0 ? currentFrame.setSecondRoll(pinsKnockedDown) :
        currentFrame.setFirstRoll(pinsKnockedDown);
    }

    function isFrameFinished() public view returns (bool) {
        //        require(firstRoll != 0);
        return currentFrame.isFrameFinished();
    }
    //
    //    function scoreForFrame(uint256 frameNumber) public view returns (uint) {
    //        return firstRoll + secondRoll;
    //    }
}
