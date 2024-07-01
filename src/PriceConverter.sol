// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AggregatorV3Interface} from "@chainlink/contracts@1.1.1/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {

      function getPrice () internal  view returns (uint256) {
         AggregatorV3Interface  dataFeed = AggregatorV3Interface(  0x61Ec26aA57019C486B10502285c5A3D4A4750AD7);
          ( ,int answer,,,) = dataFeed.latestRoundData();
        return uint256(answer*1e10);
    }
    function getConversionRate(uint amount) internal view returns (uint256){
         return (getPrice()*amount)/1e18;
    }

}