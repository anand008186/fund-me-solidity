// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test,console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe public fundMe;

    function setUp() public {
        fundMe = new FundMe();
    }

    function test_Constructor() public view {
        assertEq(fundMe.i_owner(), address(this));
    }

    function test_MinUSD() public view {
        assertEq(fundMe.MIN_USD(), 5e18);
    }

    function test_Fund() public {
        fundMe.fund();
        assertEq(fundMe.funders.length, 1);
    }

    // function test_Withdraw() public {
    //     fundMe.withdraw();
    //     assertEq(fundMe.funders.length, 0);
    // }
}