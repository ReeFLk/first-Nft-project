// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721 {
    uint256 private s_tokenId;
    mapping(uint256 => string) private s_tokenIdToUri;

    constructor() ERC721("Dogie", "DOG") {}

    function mintNft(string memory tokenUri) public {
        s_tokenIdToUri[s_tokenId] = tokenUri;
        _safeMint(msg.sender, s_tokenId);
        s_tokenId++;
    }

    function tokenURI(uint256 _tokenId) public pure override returns (string memory) {
        return "https://ipfs.io/ipfs/QmXt3";
    }
}
