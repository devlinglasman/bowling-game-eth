// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./utils/BowlingGameTest.sol";

contract TestBowlingGame is BowlingGameTest {

    function testFail_not_rolled_yet() view public {
        bowlingGame.isFrameFinished();
    }

    function test_frame_not_finished_if_first_roll_less_than_ten() public {
        bowlingGame.roll(9);
        assertTrue(!bowlingGame.isFrameFinished());
    }

    function test_frame_finished_if_first_roll_ten() public {
        bowlingGame.roll(10);
        assertTrue(bowlingGame.isFrameFinished());
    }

    function test_frame_finished_after_second_roll() public {
        bowlingGame.roll(4);
        bowlingGame.roll(1);
        assertTrue(bowlingGame.isFrameFinished());
    }

    function test_score_frames_when_no_tens() public {
        bowlingGame.roll(4);
        bowlingGame.roll(1);
        uint256 frameScore = bowlingGame.scoreForFrame(0);
        assertEq(frameScore, 5);
    }

//    function test_score_frame_when_previous_spare() public {
//        bowlingGame.roll(5);
//        bowlingGame.roll(5);
//        bowlingGame.roll(5);
//        uint256 frameScore = bowlingGame.scoreForFrame();
//        assertEq(frameScore, 15);
//    }
}
