// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-contracts/contracts/token/ERC20/utils/SafeERC20.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract GOVToken is ERC20, Ownable {
    using SafeERC20 for ERC20;

    constructor(address initialOwner) ERC20("GOVToken", "GOV") Ownable(initialOwner) {}

    function mint(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }
}
