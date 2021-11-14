// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./Frame.sol";

contract BowlingGame {
    // The game can interrogate the previous frame about whether it is waiting due
    // to a spare or strike, then give the next rolls to it.

    Frame[2] allFrames;
    uint256 currentFrameNumber;

    constructor() {
        allFrames = [new Frame(0), new Frame(1)];
        currentFrameNumber = 0;
    }

    function roll(uint256 pinsKnockedDown) public {
        if (allFrames[currentFrameNumber].firstRoll() == 0) {
            allFrames[currentFrameNumber].setFirstRoll(pinsKnockedDown);
        } else if (allFrames[currentFrameNumber].secondRoll() == 0) {
            allFrames[currentFrameNumber].setSecondRoll(pinsKnockedDown);
        } else {
            allFrames[currentFrameNumber].setThirdRoll(pinsKnockedDown);
        }
        if (isFrameFinished(currentFrameNumber)) {
            currentFrameNumber++;
        }
    }

    function isFrameFinished(uint256 frameNumber) public view returns (bool) {
        return allFrames[frameNumber].isFrameFinished();
    }

    function scoreForFrame(uint256 frameNumber) public view returns (uint) {
        return allFrames[frameNumber].scoreForFrame();
    }
}
