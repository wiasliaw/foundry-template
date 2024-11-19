// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

import "./config/Sepolia.sol";

contract SepoliaOperation is Sepolia_Config {
    ////////////////////////////////////////////////////////////////////////////
    // setUp
    ////////////////////////////////////////////////////////////////////////////

    function setUp() public override {
        super.setUp();
        // load operator account
        uint256 privateKey = vm.envUint("OPERATOR_PRIVATEKEY");
        address addr = vm.addr(privateKey);
        operator = Account({ addr: addr, key: privateKey });
    }

    ////////////////////////////////////////////////////////////////////////////
    // script
    ////////////////////////////////////////////////////////////////////////////

    function run_counter_increment() external Fork("sepolia") Broadcast(operator.key) {
        _operate_increment();
    }

    function sim_counter_increment() external Fork("sepolia") Prank(operator.addr) {
        _operate_increment();
    }

    function run_counter_setNumber(uint256 n) external Fork("sepolia") Broadcast(operator.key) {
        _operate_setNumber(n);
    }

    function sim_counter_setNumber(uint256 n) external Fork("sepolia") Prank(operator.addr) {
        _operate_setNumber(n);
    }
}
