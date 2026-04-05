// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {RefundManager} from "../src/04_RefundManager.sol";

contract Revert {

    receive() external payable {
        revert();
    }
}

contract RefundManagerTest is Test {
    RefundManager public refundManager;
    Revert public user = new Revert();

    function setUp() public {

        refundManager = new RefundManager();
        vm.prank(refundManager.owner());
        refundManager.setRefund(address(user), 1 ether);
    }

    function test_processRefund() public {

        refundManager.processRefund(address(user));

        assertEq(refundManager.processed(address(user)), true, "Refund was not marked as processed");
        assertEq(address(user).balance, 1 ether, "Refund was not processed correctly");
    }
}
