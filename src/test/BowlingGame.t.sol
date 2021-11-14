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
        // Frame number - Player - Frame score - Total score

        bowlingGame.roll(3);
        bowlingGame.roll(3); // F1 - P1 - 6 - 6
                                    bowlingGame.roll(3);
                                    bowlingGame.roll(7); // F2 - P2 - Spare: 13 - 13
        bowlingGame.roll(2);
        bowlingGame.roll(2); // F3 - P1 - 4 - 10
                                    bowlingGame.roll(3);
                                    bowlingGame.roll(3); // F4 - P2 - 6 - 19
        bowlingGame.roll(10); // F5 - P1 - Strike: 20 - 30
                                    bowlingGame.roll(3);
                                    bowlingGame.roll(4); // F6 - P2 - 7 - 26
        bowlingGame.roll(10); // F7 - P1 - Strike: 16 - 46
                                    bowlingGame.roll(3);
                                    bowlingGame.roll(3); // F8 - P2 - 6 - 32
        bowlingGame.roll(3);
        bowlingGame.roll(3); // F9 - P1 - 6 - 52
                                    bowlingGame.roll(3);
                                    bowlingGame.roll(4); // F10 - P2 - 7 - 39
        bowlingGame.roll(2);
        bowlingGame.roll(2); // F11 - P1 - 4 - 56
                                    bowlingGame.roll(3);
                                    bowlingGame.roll(3); // F12 - P2 - 6 - 45
        bowlingGame.roll(3);
        bowlingGame.roll(3); // F13 - P1 - 6 - 62
                                    bowlingGame.roll(3);
                                    bowlingGame.roll(4); // F14 - P2 - 7 - 52
        bowlingGame.roll(2);
        bowlingGame.roll(2); // F15 - P1 - 4 - 66
                                    bowlingGame.roll(3);
                                    bowlingGame.roll(3); // F16 - P2 - 6 - 58
        bowlingGame.roll(3);
        bowlingGame.roll(1); // F17 - P1 - 4 - 70
                                    bowlingGame.roll(3);
                                    bowlingGame.roll(4); // F18 - P2 - 7 - 65
        bowlingGame.roll(2);
        bowlingGame.roll(8); // F19 Final - P1 - Spare: 10 - 80
        bowlingGame.roll(6); // F19 Final - P1 - 6 - 86
                                    bowlingGame.roll(10); // F20 Final - P2 - Strike - 75
                                    bowlingGame.roll(10); // F20 Final - P2 - Strike - 85
                                    bowlingGame.roll(10); // F20 Final - P2 - Strike - 95

        // SCORES
        assertEq(bowlingGame.gameScoreForFirstPlayer(), 86);
        assertEq(bowlingGame.gameScoreForSecondPlayer(), 95);
    }
}
