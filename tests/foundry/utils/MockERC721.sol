// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import {IERC721, ERC721, ERC721TokenReceiver} from "oz/token/ERC721/ERC721.sol";

contract MockERC721 is ERC721 {
    constructor(
        string memory _name,
        string memory _symbol
    ) ERC721(_name, _symbol) {}

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
