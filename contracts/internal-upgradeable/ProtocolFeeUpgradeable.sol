// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../oz-upgradeable/proxy/utils/Initializable.sol";

import "./interfaces/IProtocolFeeUpgradeable.sol";

/**
 * @title ProtocolFeeUpgradeable
 * @dev Abstract contract for protocol fees.
 * @dev An implementation of this contract should define the `_percentageFraction` function, which returns the percentage fraction of the fee.
 * @dev The fee amount is calculated as the product of the fee percentage and the fee value.
 */
abstract contract ProtocolFeeUpgradeable is
    Initializable,
    IProtocolFeeUpgradeable
{
    FeeInfo private __feeInfo;

    function __ProtocolFee_init() internal onlyInitializing {}

    function __ProtocolFee_init_unchained() internal onlyInitializing {}

    /// @inheritdoc IProtocolFeeUpgradeable
    function feeInfo()
        external
        view
        returns (IERC20Upgradeable token, uint256 feeAmt)
    {
        assembly {
            let data := sload(__feeInfo.slot)
            token := data
            feeAmt := shr(160, data)
        }
    }

    /**
     * @dev Sets the royalty fee information
     * @param token_ Token address of the fee
     * @param amount_ Fee amount
     */
    function _setRoyalty(IERC20Upgradeable token_, uint96 amount_) internal {
        assembly {
            sstore(__feeInfo.slot, or(shl(160, amount_), token_))
        }
    }

    /**
     * @dev Pure virtual function to return the percentage fraction of the fee
     * @return Percentage fraction of the fee
     */
    function _percentageFraction() internal pure virtual returns (uint256) {
        return 10_000;
    }

    uint256[49] private __gap;
}
