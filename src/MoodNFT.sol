// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

import {ERC721} from "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Base64} from "openzeppelin-contracts/contracts/utils/Base64.sol";

contract MoodNFT is ERC721 {
    uint256 private s_counter;
    string private s_sadSvgImageUri;
    string private s_happySvgImageUri;

    enum Mood {
        SAD,
        HAPPY
    }

    mapping(uint256 => Mood) private s_tokenIdToMood;

    constructor(string memory _sadSvgImageUri, string memory _happySvgImageUri) ERC721("MoodNFT", "MOOD") {
        s_counter = 0;
        s_sadSvgImageUri = _sadSvgImageUri;
        s_happySvgImageUri = _happySvgImageUri;
    }

    function mintNft() public {
        _safeMint(msg.sender, s_counter);
        s_tokenIdToMood[s_counter] = Mood.HAPPY;
        s_counter++;
    }

    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        string memory imageUri;
        if (s_tokenIdToMood[_tokenId] == Mood.HAPPY) {
            imageUri = s_happySvgImageUri;
        } else {
            imageUri = s_sadSvgImageUri;
        }

        string memory tokenMetaData = string.concat(
            "{name: '",
            name(),
            "','description': An NFT that represents the mood of the owner. 'attributes': [{'trait_type': 'moodiness', 'value':100}],'image': '",
            imageUri,"'}"
        );
    }
}
