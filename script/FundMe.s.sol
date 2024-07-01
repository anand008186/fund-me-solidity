// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();    
        new FundMe();
        vm.stopBroadcast();
    }
}
