// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract NFTPrimeChecker {
    MyNFTCollection private nftCollection;

    constructor(address _nftCollectionAddress) {
        nftCollection = MyNFTCollection(_nftCollectionAddress);
    }

    function isPrime(uint256 number) public pure returns (bool) {
        if (number == 2) return true;
        if (number <= 1 || number % 2 == 0) return false;
        uint256 i = 3;

        do {
            if (number % i == 0) return false;
            unchecked {
                i += 2;
            }
        } while (i * i <= number);

        return true;
    }

    function countPrimes(address owner) public view returns (uint256) {
        uint256 count = 0;
        uint256 balance = nftCollection.balanceOf(owner);
        uint256 i = 0;

        do {
            uint256 tokenId = nftCollection.tokenOfOwnerByIndex(owner, i);
            if (isPrime(tokenId)) {
                unchecked {
                    ++count;
                }
            }
            unchecked {
                ++i;
            }
        } while (i < balance);

        return count;
    }
}