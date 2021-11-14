// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./Frame.sol";

contract BowlingGame {
    // The game can interrogate the previous frame about whether it is waiting due
    // to a spare or strike, then give the next rolls to it.

    Frame[2] allFrames = [new Frame(0), new Frame(1)];
    Frame currentFrame = allFrames[0];

    function roll(uint256 pinsKnockedDown) public {
        if (currentFrame.firstRoll() == 0) {
            currentFrame.setFirstRoll(pinsKnockedDown);
        } else if (currentFrame.secondRoll() == 0) {
            currentFrame.setSecondRoll(pinsKnockedDown);
        } else {
            currentFrame.setThirdRoll(pinsKnockedDown);
        }
    }

    function isFrameFinished() public view returns (bool) {
        return currentFrame.isFrameFinished();
    }

    function getFrameNumber() public view returns (uint) {
        return currentFrame.frameNumber();
    }

    function scoreForFrame(uint256 frameNumber) public view returns (uint) {
        return allFrames[frameNumber].scoreForFrame();
    }
}
