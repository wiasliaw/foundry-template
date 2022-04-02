// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.2;

import "ds-test/test.sol";
import "../Simple.sol";

interface CheatCodes {
    function prank(address) external;

    function expectRevert(bytes calldata) external;
}

contract SimpleTest is DSTest {
    Simple public s;
    CheatCodes public cheat;

    function setUp() public {
        s = new Simple();
        cheat = CheatCodes(HEVM_ADDRESS);
    }

    function testUtils() public {
        s.set(40);
        assertEq(s.get(), 40);
    }

    function testCannotSet() public {
        cheat.expectRevert("Ownable: caller is not the owner");
        cheat.prank(address(0));
        s.set(33);
    }
}
