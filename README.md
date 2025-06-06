# Cross-Contract Reentrancy — PoC Lab (Foundry-based)

This repository demonstrates **Cross-Contract Reentrancy** in a simple Vault-based system, using a fully self-contained **Foundry** project.

The attack concept is originally described in [Cross-Contract Reentrancy Attack (Medium article)](https://inspexco.medium.com/cross-contract-reentrancy-attack-402d27a02a15) by **Inspex Company Limited**.

This project builds upon their ideas and adapts code from their original [GitHub repository](https://github.com/InspexCo/cross-contract-reentrancy), with significant modifications and a complete port to **Foundry** + **Solidity-based tests**.

---

## Provenance

* Original concept and article:
  [Cross-Contract Reentrancy Attack](https://inspexco.medium.com/cross-contract-reentrancy-attack-402d27a02a15)
  © 2022 Inspex Company Limited

* Original code repository:
  [InspexCo/cross-contract-reentrancy](https://github.com/InspexCo/cross-contract-reentrancy)
  MIT License

* This project (modifications and additions):
  © 2025 0xh4ty — published under the same **MIT License**

---

## Changes in this version

* Fully **ported to Foundry** (replaced Hardhat + JavaScript with Foundry + Solidity).
* Rewrote exploit tests in Solidity: `test/ExploitTest.t.sol`.
* Added:

  * `BaseToken.sol` — a simple ERC20-like token.
  * `MockRouter.sol` — used to demonstrate **Cross-Contract Reentrancy**.
* Restructured project as a **self-contained PoC lab**:

  * No dependency on the original Hardhat/JS testing stack.
  * Can be cloned and run directly with Foundry.

---

## Setup

```bash
git clone https://github.com/0xh4ty/cross-contract-reentrancy-poc.git
cd cross-contract-reentrancy-poc
# Install dependencies
forge install
# If not already present, manually install OpenZeppelin Contracts
forge install OpenZeppelin/openzeppelin-contracts
# Build
forge build
```

---

## Running the Exploit

```bash
forge test -vvvv
```

---

## Goal of the Exploit

Demonstrate how an attacker can exploit **Cross-Contract Reentrancy** to:

* Hijack execution flow across **Vault → EvilERC20 → ICOGov**.
* Cause **incorrect state updates** in Vault during `swapAndDeposit()`.
* Mint **GOV tokens at an inflated exchange rate** via reentrant call.
* Extract unintended profit by exploiting timing mismatch in multi-contract state.

---

## Disclaimer

All code, patterns, and practices in this repository are for **educational and research purposes only**.

**DO NOT** use this code or any derived patterns in production environments.

---

## License

This project remains under the original **MIT License**:

* Original components © 2022 Inspex Company Limited
* Modifications and additions © 2025 0xh4ty

See `LICENSE` for full text.

---
