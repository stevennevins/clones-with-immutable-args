// SPDX-License-Identifier: BSD
pragma solidity ^0.8.4;

import { ExampleClone } from "./ExampleClone.sol";

contract ExampleFactory {
    constructor() {}

    function createClone() external returns (ExampleClone clone) {
        clone = new ExampleClone();
    }
}
