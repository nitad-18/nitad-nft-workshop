// SPDX-License-Identifier: MIT
// AUTHOR: yoyoismee.eth

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

// @notice just a push payment splitter. not the best practice. use it on trusted address only
contract PushPaymentSplitter is Ownable, ReentrancyGuard {
    address[] recipients;

    // @notice init with a list of recipients
    constructor(address[] memory _recipients) {
        for (uint256 i = 0; i < _recipients.length; i++) {
            recipients.push(_recipients[i]);
        }
    }

    // @notice add new recipient
    function addTarget(address recipient) public onlyOwner {
        recipients.push(recipient);
    }

    // @notice push balance to all recipients. (payable)
    function push() public payable nonReentrant {
        uint256 amount = address(this).balance / recipients.length;
        for (uint256 i = 0; i < recipients.length; i++) {
            payable(recipients[i]).transfer(amount);
        }
    }
}