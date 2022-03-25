// SPDX-License-Identifier: BSD
pragma solidity ^0.8.4;

import { DSTest } from "ds-test/test.sol";

import { Hevm } from "./utils/Hevm.sol";
import { ExampleClone } from "../ExampleClone.sol";
import { ExampleFactory } from "../ExampleFactory.sol";

contract ExampleFactoryTest is DSTest {
    Hevm internal constant hevm = Hevm(HEVM_ADDRESS);

    ExampleClone internal clone;
    ExampleFactory internal factory;

    function setUp() public {
        factory = new ExampleFactory();
    }

    /// -----------------------------------------------------------------------
    /// Gas benchmarking
    /// -----------------------------------------------------------------------

    function testGas() public {
        factory.createClone();
    }
}
