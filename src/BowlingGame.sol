// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./Frame.sol";

contract BowlingGame {
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
            playFirstRoll(pinsKnockedDown);
        } else if (allFrames[currentFrameNumber].notTakenSecondRoll()) {
            playSecondRoll(pinsKnockedDown);
        } else {
            allFrames[currentFrameNumber].setThirdRoll(pinsKnockedDown);
            proceedToNextFrame();
        }
    }

    function gameScoreForFirstPlayer() public view returns (uint256) {
        return allFrames[0].scoreForFrame() +
        allFrames[2].scoreForFrame() +
        allFrames[4].scoreForFrame() +
        allFrames[6].scoreForFrame() +
        allFrames[8].scoreForFrame() +
        allFrames[10].scoreForFrame() +
        allFrames[12].scoreForFrame() +
        allFrames[14].scoreForFrame() +
        allFrames[16].scoreForFrame() +
        allFrames[18].scoreForFrame();
    }

    function gameScoreForSecondPlayer() public view returns (uint256) {
        return allFrames[1].scoreForFrame() +
        allFrames[3].scoreForFrame() +
        allFrames[5].scoreForFrame() +
        allFrames[7].scoreForFrame() +
        allFrames[9].scoreForFrame() +
        allFrames[11].scoreForFrame() +
        allFrames[13].scoreForFrame() +
        allFrames[15].scoreForFrame() +
        allFrames[17].scoreForFrame() +
        allFrames[19].scoreForFrame();
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

    function isFinalRound() private view returns (bool) {
        return currentFrameNumber > 17;
    }

    function playFirstRoll(uint256 pinsKnockedDown) private {
        allFrames[currentFrameNumber].setFirstRoll(pinsKnockedDown);
        if (isSecondRoundOrHigher() && allFrames[previousFrameNumberForSamePlayer()].gotSpareOrStrike()) {
            allFrames[previousFrameNumberForSamePlayer()].setThirdRoll(pinsKnockedDown);
        }
        if (notFinalRoundAndGotStrike()) {
            proceedToNextFrame();
        }
    }

    function playSecondRoll(uint256 pinsKnockedDown) private {
        allFrames[currentFrameNumber].setSecondRoll(pinsKnockedDown);
        if (isSecondRoundOrHigher() && allFrames[previousFrameNumberForSamePlayer()].gotStrike()) {
            allFrames[previousFrameNumberForSamePlayer()].setFourthRoll(pinsKnockedDown);
        }
        if (!isFinalRound() || isFinalRoundAndNoStrikeOrSpare()) {
            proceedToNextFrame();
        }
    }

    function proceedToNextFrame() private {
        currentFrameNumber++;
    }

    function notFinalRoundAndGotStrike() private view returns (bool) {
        return !isFinalRound() && allFrames[currentFrameNumber].gotStrike();
    }

    function isFinalRoundAndNoStrikeOrSpare() private view returns (bool) {
        return isFinalRound() && !allFrames[currentFrameNumber].gotSpareOrStrike();
    }
}
