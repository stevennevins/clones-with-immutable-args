/**
 * @title Proxy
 * @dev Gives the possibility to delegate any call to a foreign implementation.
 */
contract Proxy {
    error ExecutionReverted();

    error InvalidImplementation(address implementation);

    event Execute(address indexed implementation, bytes data, bytes response);

    address public owner;
    address public implementation;

    constructor(address _implementation) {
        implementation = _implementation;
        owner = msg.sender;
    }

    // prettier-ignore
    fallback(bytes calldata data) external payable returns (bytes memory response) {

        // Reserve some gas to ensure that the function has enough to finish the execution
        uint256 stipend = gasleft() - 5_000;

        // Call fallback method
        bool success;
        // solhint-disable-next-line avoid-low-level-calls
        (success, response) = implementation.delegatecall{gas: stipend}(data);

        // Check if the call was successful or not
        if (!success) {
            // If there is return data, the call reverted with a reason or a custom error
            if (response.length > 0) revert();

            assembly {
                let returndata_size := mload(response)
                revert(add(32, response), returndata_size)
            }

        }
    }
}
