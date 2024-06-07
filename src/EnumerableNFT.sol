// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract EnumerableNFT is ERC721Enumerable {
    uint256 public constant MAX_SUPPLY = 100;
    uint256 public constant MAX_ITEMS = 20;
    uint256 private _currentTokenId = 0;

    constructor() ERC721("MyNFTCollection", "MNFT") {}

    function mint() public {
        require(totalSupply() + MAX_ITEMS <= MAX_SUPPLY, "Exceeds maximum supply");
        for (uint256 i = 0; i < MAX_ITEMS; i++) {
            _currentTokenId += 1;
            _safeMint(msg.sender, _currentTokenId);
        }
    }

    function tokenIds() public view returns (uint256[] memory) {
        uint256[] memory ids = new uint256[](totalSupply());
        for (uint256 i = 0; i < totalSupply(); i++) {
            ids[i] = tokenByIndex(i);
        }
        return ids;
    }
}
