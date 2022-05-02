// SPDX-License-Identifier: BSD
pragma solidity ^0.8.4;

import "forge-std/Test.sol";
import { ExampleClone } from "../ExampleClone.sol";
import { ExampleCloneFactory } from "../ExampleCloneFactory.sol";
import { Proxy } from "../Proxy.sol";

contract ExampleCloneTest is Test {
    ExampleClone internal clone;
    ExampleCloneFactory internal factory;
    Proxy internal proxy;

    function setUp() public {
        ExampleClone implementation = new ExampleClone();
        factory = new ExampleCloneFactory(implementation);
        clone = factory.createClone(
            address(0),
            type(uint256).max,
            8008,
            bytes32(type(uint256).max),
            69
        );
        proxy = new Proxy(address(clone));
    }

    /// -----------------------------------------------------------------------
    /// Gas benchmarking
    /// -----------------------------------------------------------------------

    function testGas_param1() public view {
        address param1 = ExampleClone(address(proxy)).param1();
        address param1_2 = clone.param1();
        console.log(param1);
        console.log(param1_2);
        address owner = ExampleClone(address(proxy)).owner();
        console.log(owner);
        console.log(address(this));
    }

    function testGas_param2() public view {
        clone.param2();
    }

    function testGas_param3() public view {
        clone.param3();
    }

    function testGas_param4() public view {
        clone.param4();
    }

    function testGas_param5() public view {
        clone.param5();
    }
}
