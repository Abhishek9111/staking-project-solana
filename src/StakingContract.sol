// SPDX-License-Identifier: GPL-3.0

pragma solidity  ^0.8.13;

contract StakingContract{

    uint public totalStaked;
    mapping(address=>uint256) public stakeBalances;



     function stake(uint amount) public payable{
        require(amount >0,"The amount should be greater than 0");

        stakeBalances[msg.sender]+=amount;
        totalStaked+=amount;
        
    }

    function unstake(uint amount) public payable {
        require(stakeBalances[msg.sender] >= amount,"Not enough balance");
        payable(msg.sender).transfer(amount / 2);
        stakeBalances[msg.sender]-=amount;
        totalStaked-=amount;
    }
}