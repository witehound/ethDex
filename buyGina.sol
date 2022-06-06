// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract BuyGina {
    using SafeMath for uint256;
    
    address private owner;
    IERC20 public usst;
    IERC20 public gina;
    uint256 private price = 1 ether;
    uint256 private rate = 1;
    uint256 private salesCount = 0;
    mapping( address => uint256) public withdrawalBalance;

    constructor(address _usdt, address _gina) {
        owner = msg.sender;
        usst = IERC20(_usdt);
        gina = IERC20(_gina);
    }

    function buyGina(uint256 _amount) public payable {
        require()
        if( salesCount % 5 == 0){
            rate -= 0.05
        }
        uint256 memory tempRate = price * _amount;
        usst.transferFrom(msg.sender, address(this), tempRate);
        salesCount++;
        withdrawalBalance[msg.sender] += (tempRate * rate);
    }

    function withdrawGina() public payable {
        require(withdrawalBalance[msg.sender] > 0, "only owner can deposit gina");
        gina.transferFrom(address(this), msg.sender, price);
    }
}
