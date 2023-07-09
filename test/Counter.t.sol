// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function testGetNumber() public {
        uint256 number = counter.getNumber();
        assertEq(number, 0);
        emit log_named_uint("The number is: ", number);
    }

    function testIncrement() public {
        counter.increment();
        uint256 number = counter.getNumber();
        assertEq(number, 1);
        emit log_named_uint("The number is: ", number);
    }

    function testSetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.getNumber(), x);
    }
}
