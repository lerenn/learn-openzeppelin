// contracts/Box.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

// Import Auth from the access-control subdirectory
import "./access-control/Auth.sol";

contract Box {
    uint256 private value;
    Auth private auth;

    // emitted when the stored value changes
    event ValueChanged(uint256 newValue);

    constructor(Auth _auth) public {
        auth = _auth;
    }

    // Stores a new value in the contract
    function store(uint256 newValue) public {
        // Require that the callir is register as an administrator
        require(auth.isAdministrator(msg.sender), "Unauthorized");
        
        value = newValue;
        emit ValueChanged(newValue);
    }

    // Reads the last stored value
    function retrieve() public view returns (uint256) {
        return value;
    }
}