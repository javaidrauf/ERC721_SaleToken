// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./IERC165.sol";

/**@title ERC-721 Non-Fungible Token Standard
 * @dev See https://eips.ethereum.org/EIPS/eip-721
 * Note: the ERC-165 identifier for this interface is 0x80ac58cd.
 */ 
interface IERC721 is IERC165{
    
    //  @dev This emits when ownership of any NFT changes by any mechanism.
    //  This event emits when NFTs are created (`from` == 0) and destroyed
    //  (`to` == 0). Exception: during contract creation, any number of NFTs
    //  may be created and assigned without emitting Transfer. At the time of
    //  any transfer, the approved address for that NFT (if any) is reset to none.
     event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
     
    //  @dev This emits when the approved address for an NFT is changed or
    //  reaffirmed. The zero address indicates there is no approved address.
    //  When a Transfer event emits, this also indicates that the approved
    //  address for that NFT (if any) is reset to none.
     event Approval(address indexed owner, address indexed approved, uint256 tokenId);
     
    //  @dev This emits when an operator is enabled or disabled for an owner.
    //  The operator can manage all NFTs of the owner.
     event ApprovalForAll(address indexed owner, address indexed operator, bool approved);
     
    // @notice Count all NFTs assigned to an owner
    // @dev NFTs assigned to the zero address are considered invalid, and this
    // function throws for queries about the zero address.
    // @param owner An address for whom to query the balance
    // @return The number of NFTs owned by `owner`, possibly zero
     function balanceOf(address owner) external view returns(uint256 balance);
     
    //  @notice Find the owner of an NFT
    //  @dev NFTs assigned to zero address are considered invalid, and queries
    //  about them do throw.
    //  @param _tokenId The identifier for an NFT
    //  @return The address of the owner of the NFT
    //  Requirements:
    //  - `tokenId` must exist.
     function ownerOf(uint256 tokenId) external view returns(address owner);
     
    /// @notice Transfers the ownership of an NFT from one address to another address
    /// @dev This works identically to the other function with an extra data parameter,
    /// except this function just sets data to "".
    /// @param _from The current owner of the NFT
    /// @param _to The new owner
    /// @param _tokenId The NFT to transfer
     
     /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be have been allowed to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
     function safeTransferFrom(address from, address to, uint256 tokenId) external;
     
    /// @notice Transfer ownership of an NFT -- THE CALLER IS RESPONSIBLE
    ///  TO CONFIRM THAT `_to` IS CAPABLE OF RECEIVING NFTS OR ELSE
    ///  THEY MAY BE PERMANENTLY LOST
    /// @dev Throws unless `msg.sender` is the current owner, an authorized
    ///  operator, or the approved address for this NFT. Throws if `_from` is
    ///  not the current owner. Throws if `_to` is the zero address. Throws if
    ///  `_tokenId` is not a valid NFT.
    /// @param _from The current owner of the NFT
    /// @param _to The new owner
    /// @param _tokenId The NFT to transfer
     
     /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     * WARNING: Usage of this method is discouraged, use {safeTransferFrom} whenever possible.
     * Requirements:
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     * Emits a {Transfer} event.
     */
     function transferFrom(address from, address to, uint256 tokenId) external;
     
    /// @notice Change or reaffirm the approved address for an NFT
    /// @dev The zero address indicates there is no approved address.
    ///  Throws unless `msg.sender` is the current NFT owner, or an authorized
    ///  operator of the current owner.
    /// @param _approved The new approved NFT controller
    /// @param _tokenId The NFT to approve
     
     /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     * Requirements:
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     * Emits an {Approval} event.
     */
     function approve(address to, uint256 tokenId) external;
     
    /// @notice Get the approved address for a single NFT
    /// @dev Throws if `_tokenId` is not a valid NFT.
    /// @param _tokenId The NFT to find the approved address for
    /// @return The approved address for this NFT, or the zero address if there is none
     
     /**
     * @dev Returns the account approved for `tokenId` token.
     * Requirements:
     * - `tokenId` must exist.
     */
     function getApproved(uint256 tokenId) external view returns(address operator);
     
    /// @notice Enable or disable approval for a third party ("operator") to manage
    ///  all of `msg.sender`'s assets
    /// @dev Emits the ApprovalForAll event. The contract MUST allow
    ///  multiple operators per owner.
    /// @param _operator Address to add to the set of authorized operators
    /// @param _approved True if the operator is approved, false to revoke approval
     
     /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the caller.
     *
     * Emits an {ApprovalForAll} event.
     */
     function setApprovalForAll(address operator, bool approved) external;
     
    /// @notice Query if an address is an authorized operator for another address
    /// @param _owner The address that owns the NFTs
    /// @param _operator The address that acts on behalf of the owner
    /// @return True if `_operator` is an approved operator for `_owner`, false otherwise
     
     /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     * See {setApprovalForAll}
     */
     function isApprovedForAll(address owner, address operator) external view returns(bool);
     
     // @notice Transfers the ownership of an NFT from one address to another address
    // @dev Throws unless `msg.sender` is the current owner, an authorized
    //  operator, or the approved address for this NFT. Throws if `_from` is
    //  not the current owner. Throws if `_to` is the zero address. Throws if
    //  `_tokenId` is not a valid NFT. When transfer is complete, this function
    //  checks if `_to` is a smart contract (code size > 0). If so, it calls
    //  `onERC721Received` on `_to` and throws if the return value is not
    //  `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`.
    // @param _from The current owner of the NFT
    // @param _to The new owner
    // @param _tokenId The NFT to transfer
    // @param data Additional data with no specified format, sent in call to `_to`
    
    //  Requirements:
    //  - `from` cannot be the zero address.
    //  - `to` cannot be the zero address.
    //  - `tokenId` token must exist and be owned by `from`.
    //  - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
    //  - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
    //   Emits a {Transfer} event.
     function safeTransferFrom(address from, address to, uint256 tokenId, bytes calldata data) external; 
}















