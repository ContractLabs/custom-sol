// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import {ERC1155} from "oz/token/ERC1155/ERC1155.sol";

contract MockERC1155 is ERC1155 {
    function uri(
        uint256
    ) public pure virtual override returns (string memory) {}

    function mint(
        address to,
        uint256 id,
        uint256 amount,
        bytes memory data
    ) public virtual {
        _mint(to, id, amount, data);
    }

    function batchMint(
        address to,
        uint256[] calldata ids,
        uint256[] calldata amounts,
        bytes memory data
    ) public virtual {
        _batchMint(to, ids, amounts, data);
    }

    function burn(address from, uint256 id, uint256 amount) public virtual {
        _burn(from, id, amount);
    }

    function batchBurn(
        address from,
        uint256[] calldata ids,
        uint256[] calldata amounts
    ) public virtual {
        _batchBurn(from, ids, amounts);
    }
}
