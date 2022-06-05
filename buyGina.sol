// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract BuyGina {
    address public owner;
    IERC20 public usst;
    IERC20 public gina;
    address public usstAdd;
    uint256 public balance = 0;
    uint256 public price = 10 * 10**18;

    constructor(address _usdt, address _gina) {
        owner = msg.sender;
        usst = IERC20(_usdt);
        gina = IERC20(_gina);
    }

    function usdtToShib() public payable {
        usst.transferFrom(msg.sender, address(this), price);
        gina.transfer(msg.sender, (price / 10));
    }

    function depositGina() public payable {
        require(msg.sender == owner, "only owner can deposit gina");
        gina.transferFrom(msg.sender, address(this), price);
    }
}
