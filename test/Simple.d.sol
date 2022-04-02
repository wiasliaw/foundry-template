// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.2;

import "forge-std/Test.sol";
import "../src/Simple.sol";

contract SimpleTest is Test {
    Simple public s;

    function setUp() public {
        s = new Simple();
    }

    function testUtils() public {
        s.set(40);
        assertEq(s.get(), 40);
    }
}
