// SPDX-License-Identifier: MIT

pragma solidity 0.8.21;

import { BaseDecoderAndSanitizer } from "src/base/DecodersAndSanitizers/BaseDecoderAndSanitizer.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/// @notice Struct encapulating an asset and an associated value.
/// @param asset Asset address.
/// @param value The associated value for this asset (e.g., amount or price).
struct AssetValue {
    IERC20 asset;
    uint256 value;
}

abstract contract AeraVaultDecoderAndSanitizer is BaseDecoderAndSanitizer {
    function deposit(AssetValue[] memory amounts) external pure returns (bytes memory addressesFound) {
        // Requirements: check that provided amounts are sorted by asset and unique.
        for (uint256 i = 0; i < amounts.length;) {
            addressesFound = abi.encodePacked(addressesFound, amounts[i].asset);
            unchecked {
                ++i;
            }
        }
    }

    function withdraw(AssetValue[] memory amounts) external pure returns (bytes memory amountsFound) {
        // Requirements: check that provided amounts are sorted by asset and unique.
        for (uint256 i = 0; i < amounts.length;) {
            amountsFound = abi.encodePacked(amountsFound, amounts[i].value);
            unchecked {
                ++i;
            }
        }
    }

    function setGuardianAndFeeRecipient(
        address guardian,
        address feeRecipient
    )
        external
        pure
        returns (bytes memory addressesFound)
    {
        addressesFound = abi.encodePacked(guardian, feeRecipient);
    }

    function resume() external pure returns (bytes memory addressesFound) {
        // Nothing to decode
    }
}
