// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./utils/BowlingGameTest.sol";

contract TestBowlingGame is BowlingGameTest {

    function test_returns_number_between_1_and_10_inclusive() public {
        uint256 roll = bowlingGame.roll();
        assertTrue(11 > roll && roll > 0);
    }
}
