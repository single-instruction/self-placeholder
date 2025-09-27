// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import { Test } from "forge-std/Test.sol";

contract ZKCLOBVerifierTest is Test {
    address public constant CELO_SEPOLIA_HUB = 0x16ECBA51e18a4a7e61fdC417f0d47AFEeDfbed74;
    address public user1;
    address public user2;
    
    function setUp() public {
        user1 = makeAddr("user1");
        user2 = makeAddr("user2");
    }
    
    function testHubAddresses() public pure {
        assertTrue(CELO_SEPOLIA_HUB != address(0));
    }
    
    function testUserAddresses() public view {
        assertTrue(user1 != address(0));
        assertTrue(user2 != address(0));
        assertTrue(user1 != user2);
    }
}