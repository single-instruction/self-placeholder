// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import { Script, console } from "forge-std/Script.sol";
import { ZKCLOBVerifier } from "../src/ZKCLOBVerifier.sol";

contract DeployZKCLOBVerifier is Script {
    
    address constant CELO_SEPOLIA_HUB = 0x16ECBA51e18a4a7e61fdC417f0d47AFEeDfbed74;
    address constant CELO_MAINNET_HUB = 0xe57F4773bd9c9d8b6Cd70431117d353298B9f5BF;
    
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        
        vm.startBroadcast(deployerPrivateKey);
        
        string memory scope = "zkclob-kyc-verifier";
        address hubAddress = block.chainid == 44787 ? CELO_SEPOLIA_HUB : CELO_MAINNET_HUB;
        
        ZKCLOBVerifier verifier = new ZKCLOBVerifier(hubAddress, scope);
        
        vm.stopBroadcast();
        
        console.log("ZKCLOBVerifier deployed to:", address(verifier));
        console.log("Chain ID:", block.chainid);
        console.log("Hub Address:", hubAddress);
    }
}