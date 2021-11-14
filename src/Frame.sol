// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Frame {
    uint256 public frameNumber;
    uint256 public firstRoll;
    uint256 public secondRoll;
    uint256 public thirdRoll;
    uint256 public fourthRoll;

    constructor(uint _frameNumber) {
        frameNumber = _frameNumber;
    }

    function setFirstRoll(uint value) public {
        firstRoll = value;
    }

    function setSecondRoll(uint value) public {
        secondRoll = value;
    }

    function setThirdRoll(uint value) public {
        thirdRoll = value;
    }

    function setFourthRoll(uint value) public {
        fourthRoll = value;
    }

    function notTakenFirstRoll() public view returns (bool) {
        return firstRoll == 0;
    }

    function isFrameFinished() public view returns (bool) {
        require(firstRoll != 0);
        return firstRoll == 10 || secondRoll != 0 ? true : false;
    }

    function scoreForFrame() public view returns (uint) {
        return firstRoll + secondRoll + thirdRoll + fourthRoll;
    }

    function gotSpareOrStrike() public view returns (bool) {
        return firstRoll + secondRoll > 9;
    }

    function gotStrike() public view returns (bool) {
        return firstRoll == 10;
    }
}
