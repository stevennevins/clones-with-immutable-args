// SPDX-License-Identifier: BSD
pragma solidity ^0.8.4;

import { DSTest } from "ds-test/test.sol";

import { console } from "forge-std/console.sol";
import { Hevm } from "./utils/Hevm.sol";
import { ExampleClone } from "../ExampleClone.sol";
import { Create2ExampleCloneFactory } from "../Create2ExampleCloneFactory.sol";

contract Create2ExampleCloneFactoryTest is DSTest {
    Hevm internal constant hevm = Hevm(HEVM_ADDRESS);

    Create2ExampleCloneFactory internal factory;
    ExampleClone internal implementation;

    function setUp() public {
        implementation = new ExampleClone();
        factory = new Create2ExampleCloneFactory(implementation);
    }

    /// -----------------------------------------------------------------------
    /// Gas benchmarking
    /// -----------------------------------------------------------------------

    function testGas_clone(
        address param1,
        uint256 param2,
        uint64 param3,
        uint8 param4
    ) public {
        factory.createClone(param1, param2, param3, param4);
    }

    /// -----------------------------------------------------------------------
    /// Correctness tests
    /// -----------------------------------------------------------------------

    function testCreate2Correctness_clone(
        address param1,
        uint256 param2,
        uint64 param3,
        uint8 param4
    ) public {
        address predicted = factory.computeCloneAddress(
            address(implementation),
            abi.encodePacked(param1, param2, param3, param4)
        );
        console.log(predicted);
        ExampleClone clone = factory.createClone(
            param1,
            param2,
            param3,
            param4
        );
        assertEq(predicted, address(clone));
        assertEq(clone.param1(), param1);
        assertEq(clone.param2(), param2);
        assertEq(clone.param3(), param3);
        assertEq(clone.param4(), param4);
    }
}
