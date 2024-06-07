// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/EnumerableNFT.sol";
import "../src/NFTPrimeChecker.sol";

contract NFTPrimeCheckerTest is Test {
    EnumerableNFT private EnumerableNFT;
    NFTPrimeChecker private nftPrimeChecker;
    address private owner = address(0xABCD);
    
    function setUp() public {
        vm.startPrank(owner);
        EnumerableNFT = new EnumerableNFT();
        EnumerableNFT.mint();
        nftPrimeChecker = new NFTPrimeChecker(address(EnumerableNFT));
        vm.stopPrank();
    }

    function testIsPrime() public {
        assertTrue(nftPrimeChecker.isPrime(2));
        assertTrue(nftPrimeChecker.isPrime(3));
        assertTrue(nftPrimeChecker.isPrime(5));
        assertTrue(nftPrimeChecker.isPrime(7));
        assertTrue(nftPrimeChecker.isPrime(11));
        assertFalse(nftPrimeChecker.isPrime(1));
        assertFalse(nftPrimeChecker.isPrime(4));
        assertFalse(nftPrimeChecker.isPrime(6));
        assertFalse(nftPrimeChecker.isPrime(8));
        assertFalse(nftPrimeChecker.isPrime(9));
    }

    function testCountPrimes() public {
        uint256 primeCount = nftPrimeChecker.countPrimes(owner);
        assertEq(primeCount, 8); // The primes in range 1-20 are 2, 3, 5, 7, 11, 13, 17, 19
    }
}
