// SPDX-License-Identifier: MIT
pragma solidity >= 0.5.0 <0.9.0;

contract CreditLimit {
    //2019130015 - Shubham Goel
    uint max_cred_limit;
    constructor() {
        max_cred_limit = 10000;
    }
    function getMyCreditLimit() public view returns(uint){
        return max_cred_limit;
    }
    function addMyExpenses(uint travel, uint eat, uint stay) public {
        uint total_expenses = travel + eat + stay ;
        require (total_expenses < max_cred_limit, "Credit score too low to process this transcation");
        max_cred_limit = max_cred_limit - total_expenses;
    }
    function resetMyCreditLimit() public {
        max_cred_limit = 10000;
    }
}