// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import {Counter} from "../src/Counter.sol";

abstract contract Base_Test is Test {
    ////////////////////////////////////////////////////////////////////////////
    // Actor
    ////////////////////////////////////////////////////////////////////////////

    Account internal deployer;

    ////////////////////////////////////////////////////////////////////////////
    // Test Contracts
    ////////////////////////////////////////////////////////////////////////////

    Counter internal instance_counter;

    ////////////////////////////////////////////////////////////////////////////
    // Helper
    ////////////////////////////////////////////////////////////////////////////

    modifier useDeployer() {
        vm.startPrank(deployer.addr);
        _;
        vm.stopPrank();
    }
}