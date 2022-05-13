// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721URIStorage.sol";
//import "@openzeppelin/contracts@4.6.0/access/Ownable.sol"; // removing the onlowner for enabling every user mint the NFT
import "@openzeppelin/contracts@4.6.0/utils/Counters.sol";

contract RTW3_Mekong_NFT is ERC721, ERC721Enumerable, ERC721URIStorage {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    uint256 MAX_SUPPLY = 10000;

    constructor() ERC721("RTW3_Mekong_NFT", "RMN") {}

    function safeMint(address to, string memory uri) public  {
        uint256 tokenId = _tokenIdCounter.current();
        require(tokenId <= MAX_SUPPLY, "All NFTs have been minted" );
        _tokenIdCounter.increment();
        _safeMint(to, tokenId); //built-in function starts with `_`
        _setTokenURI(tokenId, uri); // setting the uri for the particular token id. URi contains the mtadata use by the open sea to upload the rquired data boaut the NFT
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable) //internal allows vars and methods by the child smart contracts
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
