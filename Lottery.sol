// Shubham Goel - 2019130015 - BE Comps
// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0;
contract Lottery {
    address public manager;
    address payable[] public players;
    constructor() {
        manager = msg.sender;
    } 
    modifier onlyManager() {
        require(manager == msg.sender, "Only manager can access this function");
        _;
    }
    receive() external payable {
        require(msg.value == 1 ether);
        players.push(payable(msg.sender));
    }
    function getBalance() public onlyManager view returns (uint) {
        return address(this).balance;
    }
    function randomUtil() public view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, players.length)));
    }
    function getWinner() public onlyManager returns (address) {
        require(players.length > 3);
        uint idx = randomUtil() % players.length;
        address payable winner = players[idx];
        winner.transfer(getBalance());
        players = new address payable[](0);
        return winner;
    }
}