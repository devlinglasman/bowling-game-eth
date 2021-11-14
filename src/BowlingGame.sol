// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./Frame.sol";

contract BowlingGame {
    // The game can interrogate the previous frame about whether it is waiting due
    // to a spare or strike, then give the next rolls to it.

    Frame[20] allFrames;
    uint256 currentFrameNumber;

    constructor() {
        allFrames = [
        new Frame(0),
        new Frame(1),
        new Frame(2),
        new Frame(3),
        new Frame(4),
        new Frame(5),
        new Frame(6),
        new Frame(7),
        new Frame(8),
        new Frame(9),
        new Frame(10),
        new Frame(11),
        new Frame(12),
        new Frame(13),
        new Frame(14),
        new Frame(15),
        new Frame(16),
        new Frame(17),
        new Frame(18),
        new Frame(19)
        ];
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
