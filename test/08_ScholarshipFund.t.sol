// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {ScholarshipFund} from "../src/08_ScholarshipFund.sol";

contract ScholarshipFundTest is Test {
    ScholarshipFund public vcontract;

    address student = address(1);
    address donor = address(2);

    function setUp() public {
        vcontract = new ScholarshipFund(10, block.timestamp + 1 days);
        vm.deal(donor, 11 ether);
    }

    function test_ScholarshipFund() public {

        vm.prank(donor);
        console.log("Balance :", address(vcontract).balance); 
        vcontract.contribute{value: 11 ether}();
        console.log("Balance of the contract after contribution:", address(vcontract).balance); 
        assertEq(address(vcontract).balance, 11 ether);

        vm.warp(block.timestamp + 2 days);
        console.log("Pasan 2 dias");
        vcontract.releaseScholarship(payable(student));
        console.log("Balance of the student after receiving scholarship:", student.balance);
        assertEq(student.balance, 11 ether);
    }
}

