// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

import "../Base.t.sol";

contract CounterTest is Base_Test {
    ////////////////////////////////////////////////////////////////////////////
    // setUp
    ////////////////////////////////////////////////////////////////////////////

    function setUp() public virtual {
        // load deployer account
        deployer = makeAccount("DEPLOYER");
        // deploy contracts
        instance_counter = new Counter();
    }

    ////////////////////////////////////////////////////////////////////////////
    // testcase
    ////////////////////////////////////////////////////////////////////////////

    function test_Increment() external {
        instance_counter.increment();
        assertEq(instance_counter.number(), 1);
    }

    function testFuzz_SetNumber(uint256 x) external {
        instance_counter.setNumber(x);
        assertEq(instance_counter.number(), x);
    }
}
