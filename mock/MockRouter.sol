// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "../src/Vault.sol";

contract MockRouter is IRouter {
    ERC20 public baseToken;

    constructor(ERC20 _baseToken) {
        baseToken = _baseToken;
    }

    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external override {
        // Simulate a successful swap
        baseToken.transfer(to, amountIn);
    }
}
