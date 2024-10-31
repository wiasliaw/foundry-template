// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

import "../../Base.s.sol";

abstract contract Sepolia_Config is Base_Script {
    ////////////////////////////////////////////////////////////////////////////
    // Parameters
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // setUp
    ////////////////////////////////////////////////////////////////////////////

    function setUp() public virtual {
        // assume address(0x1234) is the Counter contract in sepolia
        instance_counter = Counter(address(0x1234));
    }
}