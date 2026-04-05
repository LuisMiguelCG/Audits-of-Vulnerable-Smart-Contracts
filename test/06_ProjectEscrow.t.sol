// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {ProjectEscrow} from "../src/06_ProjectEscrow.sol";

contract Attacker {
    ProjectEscrow public victim;

    constructor(address _victim) {
        victim = ProjectEscrow(_victim);
    }
    function deposit() external payable {
        victim.supportProject{value: msg.value}();
    }

    function withdraw() external {
        victim.cancelSupport();
    }

    receive() external payable {
        if (address(victim).balance >= 1 ether) {
            victim.cancelSupport();
        }
    }
}


contract ProjectEscrowTest is Test {
    ProjectEscrow public victim;
    Attacker public attacker;

    function setUp() public {
        
        victim = new ProjectEscrow();
        attacker = new Attacker(address(victim));
        vm.deal(address(victim), 5 ether);
        vm.deal(address(attacker), 1 ether);
    }

    function test_cancelSupport() public {

        attacker.deposit{value: 1 ether}();
        attacker.withdraw();

        assertEq(address(attacker).balance, 1 ether, "Attacker balance is incorrect");
        assertEq(address(victim).balance, 5 ether, "Victim balance is incorrect");

    }
}
