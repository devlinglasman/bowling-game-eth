// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./utils/BowlingGameTest.sol";

contract TestBowlingGame is BowlingGameTest {

    function testFail_not_rolled_yet() view public {
        bowlingGame.isFrameFinished(0);
    }

    function test_frame_not_finished_if_first_roll_less_than_ten() public {
        bowlingGame.roll(9);
        assertTrue(!bowlingGame.isFrameFinished(0));
    }

    function test_frame_finished_if_first_roll_ten() public {
        bowlingGame.roll(10);
        assertTrue(bowlingGame.isFrameFinished(0));
    }

    function test_frame_finished_after_second_roll() public {
        bowlingGame.roll(4);
        bowlingGame.roll(1);
        assertTrue(bowlingGame.isFrameFinished(0));
    }

    function test_score_frames_when_no_tens() public {
        bowlingGame.roll(4);
        bowlingGame.roll(1);
        bowlingGame.roll(3);
        bowlingGame.roll(4);

        uint256 frameScore0 = bowlingGame.scoreForFrame(0);
        assertEq(frameScore0, 5);
        uint256 frameScore1 = bowlingGame.scoreForFrame(1);
        assertEq(frameScore1, 7);
    }

    function test_scores_game_1() public {
        bowlingGame.roll(3);
        bowlingGame.roll(3); // F1 - P1 - 6
        bowlingGame.roll(3);
        bowlingGame.roll(4); // F2 - P2 - 7
        bowlingGame.roll(2);
        bowlingGame.roll(2); // F3 - P1 - 10
        bowlingGame.roll(3);
        bowlingGame.roll(3); // F4 - P2 - 13
        bowlingGame.roll(3);
        bowlingGame.roll(3); // F5 - P1 - 16
        bowlingGame.roll(3);
        bowlingGame.roll(4); // F6 - P2 - 20
        bowlingGame.roll(2);
        bowlingGame.roll(2); // F7 - P1 - 20
        bowlingGame.roll(3);
        bowlingGame.roll(3); // F8 - P2 - 26
        bowlingGame.roll(3);
        bowlingGame.roll(3); // F9 - P1 - 26
        bowlingGame.roll(3);
        bowlingGame.roll(4); // F10 - P2 - 33
        bowlingGame.roll(2);
        bowlingGame.roll(2); // F11 - P1 - 30
        bowlingGame.roll(3);
        bowlingGame.roll(3); // F12 - P2 - 39
        bowlingGame.roll(3);
        bowlingGame.roll(3); // F13 - P1 - 36
        bowlingGame.roll(3);
        bowlingGame.roll(4); // F14 - P2 - 46
        bowlingGame.roll(2);
        bowlingGame.roll(2); // F15 - P1 - 40
        bowlingGame.roll(3);
        bowlingGame.roll(3); // F16 - P2 - 52
        bowlingGame.roll(3);
        bowlingGame.roll(3); // F17 - P1 - 46
        bowlingGame.roll(3);
        bowlingGame.roll(4); // F18 - P2 - 59
        bowlingGame.roll(2);
        bowlingGame.roll(3); // F19 - P1 - 50
        bowlingGame.roll(3);
        bowlingGame.roll(3); // F20 - P2 - 65

        assertEq(bowlingGame.gameScoreForFirstPlayer(), 51);
        assertEq(bowlingGame.gameScoreForSecondPlayer(), 65);
    }
}
