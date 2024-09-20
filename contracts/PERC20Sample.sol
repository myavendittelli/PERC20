// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./PERC20.sol";

contract PERC20Sample is PERC20 {
    constructor() PERC20("6c47c3168f7b4d2ec62f91b1b37bb1345c982b13b1a8c4ce542a0acb730e57c7", "6c47c3168f7b4d2ec62f91b1b37bb1345c982b13b1a8c4ce542a0acb730e57c7") {}

    function mint100tokens() public {
        _mint(msg.sender, 100*10**18);
    }

    function balanceOf(address account) public view override returns (uint256) {
        require(msg.sender == account, "PERC20Sample: msg.sender != account");

        return _balances[account];
    }

    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        require(msg.sender == spender, "PERC20Sample: msg.sender != account");
        
        return _allowances[owner][spender];
    }
}
