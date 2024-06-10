// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "./EnumerableNFT.sol";

/// @title NFTPrimeChecker
/// @notice A contract for checking prime numbers and counting prime token IDs owned by an address.
/// @dev Interacts with an EnumerableNFT contract.
contract NFTPrimeChecker {
    EnumerableNFT private nftCollection;

    /// @notice Constructor for the NFTPrimeChecker contract.
    /// @param _nftCollectionAddress The address of the EnumerableNFT contract.
    constructor(address _nftCollectionAddress) {
        nftCollection = EnumerableNFT(_nftCollectionAddress);
    }

    /// @notice Checks if a number is prime.
    /// @param number The number to check.
    /// @return True if the number is prime, false otherwise.
    function isPrime(uint256 number) public pure returns (bool) {
        if (number == 2 || number == 3) return true;
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

    /// @notice Counts the number of prime token IDs owned by a given address.
    /// @param owner The address to check.
    /// @return The number of prime token IDs owned by the address.
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
