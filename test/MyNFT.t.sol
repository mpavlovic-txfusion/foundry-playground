// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MyNFT.sol";

contract MyNFTTest is Test {
    MyNFT public myNft;
    address addr1 = address(0x1);
    address addr2 = address(0x2);

    function testMintToken() public {
        myNft = new MyNFT();
        myNft.mint(addr1, 0);

        assertEq(myNft.ownerOf(0), addr1);
    }

    function testTransfer() public {
        myNft = new MyNFT();
        myNft.mint(addr1, 0);
        
        vm.startPrank(addr1);
        myNft.safeTransferFrom(addr1, addr2, 0);
        
        assertEq(myNft.ownerOf(0), addr2);
    }

    function testGetBalance() public {
        myNft = new MyNFT();
        myNft.mint(addr1, 0);
        myNft.mint(addr1, 1);
        myNft.mint(addr1, 2);

        assertEq(myNft.balanceOf(addr1), 3);
    }

    function testOnlyOwnerBurn() public {
        myNft = new MyNFT();
        myNft.mint(addr1, 0);

        vm.startPrank(addr2);
        vm.expectRevert("not owner");
        myNft.burn(0);

        emit log_address(addr2);
    }
}
