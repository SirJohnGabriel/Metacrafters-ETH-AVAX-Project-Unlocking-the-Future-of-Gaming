// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals() override public pure returns (uint8) {
        return 0;
    }

    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function transferTokens(address _receiver, uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "Not enough Degen Tokens.");
        approve(msg.sender, _value);
        transferFrom(msg.sender, _receiver, _value);
    }

    function burnTokens(uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "Not enough Degen Tokens.");
        _burn(msg.sender, _value);
    }

    function redeemTokens(uint8 _item) external {
        require(_item < 4, "Item not in the list");
        uint8 _value = 0;
        if (_item == 1) {
            _value = 100;
        } else if (_item == 2) {
            _value = 50;
        } else if (_item == 3) {
            _value = 150;
        }
        _burn(msg.sender, _value);
        emit TokensRedeemed(msg.sender, _value, _item);
    }

    event TokensRedeemed(address indexed redeemer, uint256 amount, uint8 item);
}
