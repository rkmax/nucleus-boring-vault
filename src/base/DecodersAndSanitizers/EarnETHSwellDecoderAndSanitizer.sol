// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import { BaseDecoderAndSanitizer } from "./BaseDecoderAndSanitizer.sol";
import { NativeWrapperDecoderAndSanitizer } from "./Protocols/NativeWrapperDecoderAndSanitizer.sol";
import { UniswapV3DecoderAndSanitizer } from "src/base/DecodersAndSanitizers/Protocols/UniswapV3DecoderAndSanitizer.sol";
import { MasterChefV3DecoderAndSanitizer } from
    "src/base/DecodersAndSanitizers/Protocols/MasterChefV3DecoderAndSanitizer.sol";
import { PendleRouterDecoderAndSanitizer } from
    "src/base/DecodersAndSanitizers/Protocols/PendleRouterDecoderAndSanitizer.sol";

import { TempestDecoderAndSanitizer } from "src/base/DecodersAndSanitizers/Protocols/TempestDecoderAndSanitizer.sol";
import { SwellDecoderAndSanitizer } from "src/base/DecodersAndSanitizers/Protocols/SwellDecoderAndSanitizer.sol";
import { EulerDecoderAndSanitizer } from "src/base/DecodersAndSanitizers/Protocols/EulerDecoderAndSanitizer.sol";
import { OPStandardL2BridgeDecoderAndSanitizer } from
    "src/base/DecodersAndSanitizers/Protocols/OPStandardL2BridgeDecoderAndSanitizer.sol";
import { VelodromeDecoderAndSanitizer } from "src/base/DecodersAndSanitizers/Protocols/VelodromeDecoderAndSanitizer.sol";

contract EarnETHSwellDecoderAndSanitizer is
    OPStandardL2BridgeDecoderAndSanitizer,
    NativeWrapperDecoderAndSanitizer,
    MasterChefV3DecoderAndSanitizer,
    PendleRouterDecoderAndSanitizer,
    TempestDecoderAndSanitizer,
    SwellDecoderAndSanitizer,
    EulerDecoderAndSanitizer,
    VelodromeDecoderAndSanitizer
{
    constructor(
        address _boringVault,
        address _velodromeNonFungiblePositionManager
    )
        BaseDecoderAndSanitizer(_boringVault)
        VelodromeDecoderAndSanitizer(_velodromeNonFungiblePositionManager)
    { }
}
