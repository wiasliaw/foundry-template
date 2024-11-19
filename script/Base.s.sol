// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import { Counter } from "../src/Counter.sol";

abstract contract Base_Script is Script {
    ////////////////////////////////////////////////////////////////////////////
    // Actor
    ////////////////////////////////////////////////////////////////////////////

    Account internal deployer;

    Account internal operator;

    ////////////////////////////////////////////////////////////////////////////
    // Test Contracts
    ////////////////////////////////////////////////////////////////////////////

    Counter internal instance_counter;

    ////////////////////////////////////////////////////////////////////////////
    // Helper
    ////////////////////////////////////////////////////////////////////////////

    modifier Broadcast(uint256 key) {
        vm.startBroadcast(key);
        _;
        vm.stopBroadcast();
    }

    modifier Prank(address sender) {
        vm.startPrank(sender);
        _;
        vm.stopPrank();
    }

    modifier Fork(string memory str) {
        vm.createSelectFork(str);
        _;
    }

    ////////////////////////////////////////////////////////////////////////////
    // Atomic Functions
    ////////////////////////////////////////////////////////////////////////////

    function _deploy_counter() internal {
        instance_counter = new Counter();
        console.log("new counter: ", address(instance_counter));
    }

    function _operate_increment() internal {
        instance_counter.increment();
        console.log("counter's current number: ", instance_counter.number());
    }

    function _operate_setNumber(uint256 n) internal {
        instance_counter.setNumber(n);
        console.log("counter's current number: ", instance_counter.number());
    }
}
