// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.2;

contract Simple {
    uint256 private _value;

    constructor() {}

    function get() external view returns (uint256) {
        return _value;
    }

    function set(uint256 value_) external {
        _value = value_;
    }
}
