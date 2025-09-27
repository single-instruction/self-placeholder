// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import { SelfVerificationRoot } from "@selfxyz/contracts/contracts/abstract/SelfVerificationRoot.sol";
import { ISelfVerificationRoot } from "@selfxyz/contracts/contracts/interfaces/ISelfVerificationRoot.sol";
import { SelfStructs } from "@selfxyz/contracts/contracts/libraries/SelfStructs.sol";
import { SelfUtils } from "@selfxyz/contracts/contracts/libraries/SelfUtils.sol";
import { IIdentityVerificationHubV2 } from "@selfxyz/contracts/contracts/interfaces/IIdentityVerificationHubV2.sol";

/**
 * @title ZKCLOBVerifier
 * @notice Verifies user KYC status for zkCLOB trading eligibility
 * @dev Extends SelfVerificationRoot to integrate with Self Protocol for zk-KYC verification
 */
contract ZKCLOBVerifier is SelfVerificationRoot {
    
    event UserVerified(
        address indexed user,
        ISelfVerificationRoot.GenericDiscloseOutputV2 output,
        bytes userData
    );
    
    mapping(address => bool) public verifiedAddresses;
    
    // * @dev Works only with set config id. WELP.
    bytes32 public verificationConfigId;
    address public owner;
    bool public verificationActive = true;
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Unauthorized");
        _;
    }

    /**
     * @notice Constructor initializes the zkCLOB verifier
     * @param identityVerificationHubV2Address Hub V2 contract address
     * @param scope Unique scope identifier for this verifier
     */
    constructor(
        address identityVerificationHubV2Address,
        string memory scope
    ) SelfVerificationRoot(identityVerificationHubV2Address, scope) {
        owner = msg.sender;
        
        SelfUtils.UnformattedVerificationConfigV2 memory config = SelfUtils.UnformattedVerificationConfigV2({
            olderThan: 18,
            forbiddenCountries: new string[](0),
            ofacEnabled: true
        });
        
        SelfStructs.VerificationConfigV2 memory formattedConfig = SelfUtils.formatVerificationConfigV2(config);
        verificationConfigId = IIdentityVerificationHubV2(identityVerificationHubV2Address)
            .setVerificationConfigV2(formattedConfig);
    }
    
    /**
     * @notice Custom logic executed after successful verification
     * @param output Verification output containing user data
     * @param userData Additional user-defined data
     * @dev Can pause KYC verification by calling toggleVerification()

     */
    function customVerificationHook(
        ISelfVerificationRoot.GenericDiscloseOutputV2 memory output,
        bytes memory userData
    ) internal override {
        require(verificationActive, "Verification paused");
        require(!verifiedAddresses[msg.sender], "Address already verified");
        
        verifiedAddresses[msg.sender] = true;
        
        emit UserVerified(msg.sender, output, userData);
    }
    
    /**
     * @notice Returns the verification config ID
     * @return bytes32 The verification configuration identifier
     */
    function getConfigId(
        bytes32, /* destinationChainId */
        bytes32, /* userIdentifier */
        bytes memory /* userDefinedData */
    ) public view override returns (bytes32) {
        return verificationConfigId;
    }

    /**
     * @notice Sets the verification config ID
     * @param configId The new verification configuration identifier
     * @dev No idea why this is needed. Copied from ProofOfHuman.sol LMAO.
     */
    function setConfigId(bytes32 configId) external onlyOwner {
        verificationConfigId = configId;
    }
    
    /**
     * @notice Checks if a user is KYC verified
     * @param user Address to check verification status
     * @return bool True if user is verified
     */
    function isUserVerified(address user) public view returns (bool) {
        return verifiedAddresses[user];
    }
    
    /**
     * @notice Toggles verification active status (owner only)
     */
    function toggleVerification() external onlyOwner {
        verificationActive = !verificationActive;
    }
    
    /**
     * @notice Transfers contract ownership (owner only)
     * @param newOwner New owner address
     */
    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "Invalid address");
        owner = newOwner;
    }
}