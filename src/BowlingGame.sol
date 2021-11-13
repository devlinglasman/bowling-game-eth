// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract BowlingGame {
    uint256 counter = 0;

    function roll() public returns (uint256) {
        uint256[10] memory numbersUpToTen;
        numbersUpToTen[0] = 9;
        numbersUpToTen[1] = 3;
        numbersUpToTen[2] = 2;
        numbersUpToTen[3] = 8;
        numbersUpToTen[4] = 5;
        numbersUpToTen[5] = 1;
        numbersUpToTen[6] = 10;
        numbersUpToTen[7] = 4;
        numbersUpToTen[8] = 6;
        numbersUpToTen[9] = 7;

        counter++;
        if (counter > 9) {
            counter = 0;
        }
        return numbersUpToTen[counter];
    }
}
