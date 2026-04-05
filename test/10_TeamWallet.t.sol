// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {TeamWallet} from "../src/10_TeamWallet.sol";

contract TeamWalletTest is Test {
    TeamWallet public victim;

    address user = address(1);

    function setUp() public {

        victim = new TeamWallet();
        vm.deal(address(victim), 10 ether);
    }

    function test_executePayment() public {

        vm.startPrank(user);
        victim._executePayment(payable(user), 10 ether);
        vm.stopPrank();
        assertEq(address(user).balance, 10 ether);
        assertEq(address(victim).balance, 0 ether);
    }
}

