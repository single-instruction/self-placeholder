## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

## Logs

```shell
Compiling 1 files with Solc 0.8.28                                                               
    Solc 0.8.28 finished in 541.75ms
    Compiler run successful with warnings:
    Warning (5740): Unreachable code.
       --> node_modules/@selfxyz/contracts/contracts/abstract/SelfVerificationRoot.sol:108:9:
        |
    108 |         bytes memory baseVerificationInput = abi.encodePacked(
        |         ^ (Relevant source part starts here and spans across multiple lines).

    Warning (5667): Unused function parameter. Remove or comment out the variable name to silence
    this warning.
       --> node_modules/@selfxyz/contracts/contracts/abstract/SelfVerificationRoot.sol:154:9:
        |
    154 |         bytes32 destinationChainId,
        |         ^^^^^^^^^^^^^^^^^^^^^^^^^^

    Warning (5667): Unused function parameter. Remove or comment out the variable name to silence
    this warning.
       --> node_modules/@selfxyz/contracts/contracts/abstract/SelfVerificationRoot.sol:155:9:
        |
    155 |         bytes32 userIdentifier,
        |         ^^^^^^^^^^^^^^^^^^^^^^

    Warning (5667): Unused function parameter. Remove or comment out the variable name to silence
    this warning.
       --> node_modules/@selfxyz/contracts/contracts/abstract/SelfVerificationRoot.sol:156:9:
        |
    156 |         bytes memory userDefinedData
        |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    Warning (2018): Function state mutability can be restricted to pure
       --> node_modules/@selfxyz/contracts/contracts/abstract/SelfVerificationRoot.sol:229:5:
        |
    229 |     function _calculateAddressHashWithPoseidon(
        |     ^ (Relevant source part starts here and spans across multiple lines).

    Script ran successfully.

    == Logs ==
      ZKCLOBVerifier deployed to: 0x99064CF6d955C3aF3b8c5AF5078d8AC1372b323d
      Chain ID: 11142220
      Hub Address: 0x16ECBA51e18a4a7e61fdC417f0d47AFEeDfbed74

    ## Setting up 1 EVM.

    ==========================

    Chain 11142220

    Estimated gas price: 50.001 gwei

    Estimated total gas used for script: 1760921

    Estimated amount required: 0.088047810921 ETH

    ==========================


    ==========================

    ONCHAIN EXECUTION COMPLETE & SUCCESSFUL.

    Transactions saved to:
    /home/bhaskar/dev/self-placeholder/broadcast/DeployZKCLOBVerifier.s.sol/11142220/run-latest.json

    Sensitive values saved to:
    /home/bhaskar/dev/self-placeholder/cache/DeployZKCLOBVerifier.s.sol/11142220/run-latest.json
    Warning: Detected artifacts built from source files that no longer exist. Run `forge clean` to
    make sure builds are in sync with project files.
     - /home/bhaskar/dev/self-placeholder/script/Counter.s.sol
     - /home/bhaskar/dev/self-placeholder/src/Counter.sol
     - /home/bhaskar/dev/self-placeholder/test/Counter.t.sol

    Start verifying contract `0x99064CF6d955C3aF3b8c5AF5078d8AC1372b323d` deployed on 11142220       
    Constructor args: 0x00000000000000000000000016ecba51e18a4a7e61fdc417f0d47afeedfbed740000000000000
    0000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000
    0000000000000000137a6b636c6f622d6b79632d766572696669657200000000000000000000000000

    Submitting verification for [src/ZKCLOBVerifier.sol:ZKCLOBVerifier]
    0x99064CF6d955C3aF3b8c5AF5078d8AC1372b323d.
    Submitted contract for verification:
    	Response: `OK`
    	GUID: `99064cf6d955c3af3b8c5af5078d8ac1372b323d68d7348d`
    	URL: https://celo-sepolia.blockscout.com/address/0x99064cf6d955c3af3b8c5af5078d8ac1372b323d

    [~/dev/placeholder/self-placeholder] [main *] $  forge script script/DeployZKCLOBVerifier.s.sol --rpc-url celo-sepolia --private-key 0xf7a5dfc4053f4a9d68ccae7ba6cdc9973dc218f6ebdc394eefad83ec748f563d --broadcast --verify
[⠊] Compiling...
No files changed, compilation skipped
Script ran successfully.

== Logs ==
  ZKCLOBVerifier deployed to: 0xCF4C5064162bC944781Cf36f75D037036c35665A
  Chain ID: 11142220
  Hub Address: 0x16ECBA51e18a4a7e61fdC417f0d47AFEeDfbed74
  Scope: 2698112660279857690528718620296709221744894878524254270222958315554827872252

## Setting up 1 EVM.

==========================

Chain 11142220

Estimated gas price: 50.001 gwei

Estimated total gas used for script: 1686146

Estimated amount required: 0.084308986146 ETH

==========================

##### 11142220
 [Success] Hash: 0xb6a155ce1d36430b38df3defa41db3f0372693db593b0a2552ee936ba90cc411
Contract Address: 0xCF4C5064162bC944781Cf36f75D037036c35665A
Block: 5743054
Paid: 0.032427197036 ETH (1297036 gas * 25.001 gwei)

Sequence #1 on 11142220 | Total Paid: 0.032427197036 ETH (1297036 gas * avg 25.001 gwei)
```
