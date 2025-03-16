// SPDX-License-Identifier: GPL-3.0

pragma solidity  ^0.8.13;

contract StakingContract{

    uint public totalStaked;
    mapping(address=>uint256) public stakeBalances;



    function stake() public payable{
        require(msg.value >0,"The amount should be greater than 0");

        stakeBalances[msg.sender]+=msg.value;
        totalStaked+=msg.value;
        
    }

    function unstake(uint256 amount) public payable{
         require(msg.value >0,"The amount should be greater than 0");
        require(amount =< stakeBalances[msg.sender],"Not enough balance");
        payable(msg.sender).transfer(amount/2);
        stakeBalances[msg.sender]-=amount/2;
        totalStaked-=amount/2;
    }
}