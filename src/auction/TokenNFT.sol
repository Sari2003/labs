// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/ERC721/IERC721.sol";
//import "@openzeppelin/contracts/access/Ownable.sol";
contract MyERC721 is IERC721 {
    constructor(string memory name, string memory symbol) ERC721("TokenNFT", "NFT") {}
    function mint(address to, uint256 tokenId) public {
        _mint(to, tokenId);
    }
}
