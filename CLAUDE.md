# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Foundry-based Ethereum smart contract project for building a private zkCLOB (Zero-Knowledge Central Limit Order Book) with Self.xyz zk-KYC integration for EthGlobal New Delhi Hack. The project implements on-chain verification that emits events when users complete zk-KYC verification using Self.xyz protocol, enabling frontend validation before allowing order placement.

## Development Commands

### Install dependencies
```shell
npm install
```

### Build
```shell
forge build
```

### Test
```shell
forge test
```

### Run specific test
```shell
forge test --match-test <test_name>
```

### Format code
```shell
forge fmt
```

### Gas analysis
```shell
forge snapshot
```

### Local development node
```shell
anvil
```

### Deploy to Celo Sepolia
```shell
forge script script/DeployZKCLOBVerifier.s.sol --rpc-url celo-sepolia --private-key $PRIVATE_KEY --broadcast
```

### Deploy to Celo Mainnet
```shell
forge script script/DeployZKCLOBVerifier.s.sol --rpc-url celo --private-key $PRIVATE_KEY --broadcast
```

## Architecture

- **src/**: Smart contracts including the Self.xyz zk-KYC verifier
- **test/**: Foundry test files
- **script/**: Deployment scripts
- **foundry.toml**: Foundry configuration

## Self.xyz Integration Notes

The project integrates Self.xyz for zk-KYC verification:
- Contracts inherit from `SelfVerificationRoot` abstract contract
- Must implement `getConfigId()` and `customVerificationHook()` methods
- Verification events are emitted for frontend consumption
- Target deployment: Celo Sepolia testnet
- Frontend monitors events to gate zkCLOB order placement

## Key Contracts

### ZKCLOBVerifier.sol
- Extends `SelfVerificationRoot` from `@selfxyz/contracts`
- Emits `UserVerified` events when users complete zk-KYC
- Provides `isUserVerified(address)` function for frontend queries
- Uses Self Protocol Hub V2 addresses:
  - Celo Sepolia: `0x16ECBA51e18a4a7e61fdC417f0d47AFEeDfbed74`
  - Celo Mainnet: `0xe57F4773bd9c9d8b6Cd70431117d353298B9f5BF`

## Integration Flow

1. User completes Self.xyz KYC verification
2. Contract emits `UserVerified` event with user address and identifier
3. Frontend monitors events to determine user eligibility
4. Only verified users can place orders in the zkCLOB system