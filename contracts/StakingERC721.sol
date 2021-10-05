pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

contract StakingERC721 is IERC721Receiver {

    event Staked(address indexed sender);
    event Withdrawn(address indexed sender);
    
    mapping (address => mapping (uint256 => address)) tokenToStakerMap;

    constructor() {}

    // Call stake function. NFT collection must have been approved already
    function stake(address nftAddress, uint256 tokenId) public {
        tokenToStakerMap[nftAddress][tokenId] = msg.sender;
        ERC721(nftAddress).safeTransferFrom(msg.sender, address(this), tokenId);

        emit Staked(msg.sender);
    }

    function widthdraw(address nftAddress, uint256 tokenId) external {
        address staker = tokenToStakerMap[nftAddress][tokenId];
        require(staker == msg.sender, "You are not the OG owner");
        ERC721(nftAddress).safeTransferFrom(address(this), msg.sender, tokenId);

        emit Withdrawn(msg.sender);
    }

    // Auto-stake an NFT when a user simply transfers it to this contract
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes memory data
    ) external override returns (bytes4) {
        tokenToStakerMap[operator][tokenId] = from;
        emit Staked(from);
        return bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"));
    }

}