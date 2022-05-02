// SPDX-License-Identifier: BSD
pragma solidity ^0.8.4;

import { Clone } from "./Clone.sol";

contract ExampleClone is Clone {
    address public owner;
    uint256 public iterator;

    function param1() public pure returns (address) {
        return _getArgAddress(0);
    }

    function param2() public pure returns (uint256) {
        return _getArgUint256(20);
    }

    function param3() public pure returns (uint64) {
        return _getArgUint64(52);
    }

    function param4() public pure returns (bytes32) {
        return _getArgBytes32(60);
    }

    function param5() public pure returns (uint8) {
        return _getArgUint8(92);
    }
}
