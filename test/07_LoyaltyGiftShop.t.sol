// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {LoyaltyGiftShop} from "../src/07_LoyaltyGiftShop.sol";

contract LoyaltyGiftShopTest is Test {
    LoyaltyGiftShop public victim;

    address user = address(1);

    function setUp() public {

        victim = new LoyaltyGiftShop();
        vm.prank(victim.owner());
        victim.setGiftPrice(100);
        victim.grantPoints(user, 90);
    }

    function test_redeemGift() public {

        vm.prank(user);
        victim.redeemGift();

        assertEq(victim.points(user), 90);
        assertEq(victim.redeemedGifts(user), 0);
    }
}