// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {BasicNFT} from "../src/BasicNFT.sol";
import {DeployBasicNFT} from "../script/DeployBasicNFT.s.sol";

contract BasicNftTests is Test {
    DeployBasicNFT deployer;
    BasicNFT basicNFT;
    address USER = makeAddr("user");

    function setUp() public {
        deployer = new DeployBasicNFT();
        basicNFT = deployer.run();
    }

    function testName() public {
        assertEq(keccak256(abi.encodePacked(basicNFT.name())), keccak256(abi.encodePacked("Dogie")));
    }

    function testCanMint() public {
        vm.prank(USER);
        basicNFT.mintNft("ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json");
    }
}
