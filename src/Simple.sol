// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.2;

import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract Simple is Ownable {
    uint256 private _value;

    constructor() {}

    function get() external view returns (uint256) {
        return _value;
    }

    function set(uint256 value_) external onlyOwner {
        _value = value_;
    }
}
