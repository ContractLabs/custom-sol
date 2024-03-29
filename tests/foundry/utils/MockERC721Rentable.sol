//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {
    ERC721Upgradeable,
    ERC721RentableUpgradeable,
    IERC721RentableUpgradeable
} from "oz-upgradeable/token/ERC721/extensions/ERC721RentableUpgradeable.sol";

contract MockERC721Rentable is ERC721RentableUpgradeable {
    // constructor(
    //     string memory _name,
    //     string memory _symbol
    // ) ERC721(_name, _symbol) {}

    function initialize(
        string calldata name_,
        string calldata symbol_
    ) external initializer {
        __ERC721_init_unchained(name_, symbol_);
    }

    function tokenURI(
        uint256
    ) public pure virtual override returns (string memory) {}

    function mint(address to, uint256 tokenId) public virtual {
        _mint(to, tokenId);
    }

    function burn(uint256 tokenId) public virtual {
        _burn(tokenId);
    }

    function safeMint(address to, uint256 tokenId) public virtual {
        _safeMint(to, tokenId);
    }

    function safeMint(
        address to,
        uint256 tokenId,
        bytes memory data
    ) public virtual {
        _safeMint(to, tokenId, data);
    }

    function _baseURI()
        internal
        view
        virtual
        override
        returns (string memory)
    {}
}
