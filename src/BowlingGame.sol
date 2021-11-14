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
        if (allFrames[currentFrameNumber].notTakenFirstRoll()) {
            allFrames[currentFrameNumber].setFirstRoll(pinsKnockedDown);
            if (isSecondRoundOrHigher() && allFrames[previousFrameNumberForSamePlayer()].gotSpareOrStrike()) {
                allFrames[previousFrameNumberForSamePlayer()].setThirdRoll(pinsKnockedDown);
            }
        } else {
            allFrames[currentFrameNumber].setSecondRoll(pinsKnockedDown);
            if (isSecondRoundOrHigher() && allFrames[previousFrameNumberForSamePlayer()].gotStrike()) {
                allFrames[previousFrameNumberForSamePlayer()].setFourthRoll(pinsKnockedDown);
            }
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

    function previousFrameNumberForSamePlayer() private view returns (uint256) {
        return currentFrameNumber - 2;
    }

    function isSecondRoundOrHigher() private view returns (bool) {
        return currentFrameNumber > 1;
    }
}
