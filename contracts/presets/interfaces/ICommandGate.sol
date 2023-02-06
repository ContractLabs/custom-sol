// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./ITreasury.sol";

import "../../oz/token/ERC20/IERC20.sol";

import "../../oz/token/ERC721/IERC721.sol";

import {
    IERC20Permit
} from "../../oz/token/ERC20/extensions/draft-IERC20Permit.sol";

interface ICommandGate {
    error CommandGate__ExecutionFailed();
    error CommandGate__InvalidArgument();
    error CommandGate__UnknownAddress(address);

    event Whitelisted(address indexed operator, address indexed addr);

    event VaultsWhitelisted(address indexed operator, address[] vaults);

    event Commanded(
        address indexed to,
        bytes4 indexed functionSelector,
        bytes params,
        address vault,
        address indexed from,
        address token,
        uint256 value
    );

    function whitelistAddress(address addr_) external;

    function depositNativeTokenWithCommand(
        address contract_,
        address vault_,
        bytes4 fnSig_,
        bytes calldata params_
    ) external payable;

    function depositERC20WithCommand(
        IERC20 token_,
        uint256 value_,
        bytes4 fnSig_,
        address vault_,
        address contract_,
        bytes memory data_
    ) external;

    function depositERC20PermitWithCommand(
        IERC20Permit token_,
        uint256 value_,
        uint256 deadline_,
        uint8 v,
        bytes32 r,
        bytes32 s,
        bytes4 fnSig_,
        address vault_,
        address contract_,
        bytes calldata data_
    ) external;

    function depositERC721MultiWithCommand(
        uint256[] calldata tokenIds_,
        IERC721[] calldata contracts_,
        bytes[] calldata data_
    ) external;

    function isVaultWhitelisted(address addr_) external view returns (bool);

    function isTargetWhitelisted(address addr_) external view returns (bool);
}
