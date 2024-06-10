// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

/// @title EnumerableNFT
/// @notice An ERC721 token contract with enumerable functionality, allowing batch minting.
/// @dev Inherits from OpenZeppelin's ERC721Enumerable.
contract EnumerableNFT is ERC721Enumerable {
    uint256 public constant MAX_SUPPLY = 100;
    uint256 public constant MAX_ITEMS = 20;
    uint256 private _currentTokenId = 0;

    /// @notice Constructor for the EnumerableNFT contract.
    constructor() ERC721("MyNFTCollection", "MNFT") {}

    /// @notice Mints a batch of tokens to the sender's address.
    /// @dev Mints up to MAX_ITEMS tokens, ensuring the total supply does not exceed MAX_SUPPLY.
    function mint() public {
        require(totalSupply() + MAX_ITEMS <= MAX_SUPPLY, "Exceeds maximum supply");
        for (uint256 i = 0; i < MAX_ITEMS; i++) {
            _currentTokenId += 1;
            _safeMint(msg.sender, _currentTokenId);
        }
    }
}
