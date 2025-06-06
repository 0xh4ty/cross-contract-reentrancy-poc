// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract BaseToken is ERC20 {
    constructor() ERC20("BaseToken", "BASE") {}

    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }
}
