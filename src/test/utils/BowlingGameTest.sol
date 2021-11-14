// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "../../BowlingGame.sol";
import "./Hevm.sol";
import "../../../lib/ds-test/src/test.sol";

abstract contract BowlingGameTest is DSTest {
    Hevm internal constant hevm = Hevm(HEVM_ADDRESS);

    // contracts
    BowlingGame internal bowlingGame;

    function setUp() public virtual {
        bowlingGame = new BowlingGame();
    }
}
