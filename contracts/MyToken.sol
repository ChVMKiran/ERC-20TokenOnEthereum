// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title MyToken - Basic ERC-20 Token Implementation
/// @notice This contract demonstrates a simple ERC-20 token with fixed total supply.
contract MyToken {

    // ------------------------------------------------------------
    // Token Information
    // ------------------------------------------------------------

    // Human-readable token name
    string public name = "MyToken";

    // Short ticker symbol
    string public symbol = "MTK";

    // Number of decimal places the token supports (18 = like ETH)
    uint8 public decimals = 18;

    // Total amount of tokens that will ever exist (set in constructor)
    uint256 public totalSupply;

    // ------------------------------------------------------------
    // Storage Mappings
    // ------------------------------------------------------------

    // Keeps track of each wallet's token balance
    mapping(address => uint256) public balanceOf;

    // Tracks how much a spender is allowed to withdraw from an owner
    mapping(address => mapping(address => uint256)) public allowance;

    // ------------------------------------------------------------
    // Events (used for logging and tracking activity)
    // ------------------------------------------------------------

    // Fires whenever tokens move between wallets
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Fires whenever an owner updates a spender's allowed amount
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // ------------------------------------------------------------
    // Constructor (runs once during deployment)
    // ------------------------------------------------------------

    /// @notice Mints the entire supply to the account deploying the contract
    /// @param _initialSupply The total token supply including decimals
    constructor(uint256 _initialSupply) {
        totalSupply = _initialSupply;

        // Assign all tokens to the deployer's address
        balanceOf[msg.sender] = _initialSupply;

        // Log the initial minting process
        emit Transfer(address(0), msg.sender, _initialSupply);
    }

    // ------------------------------------------------------------
    // Core ERC-20 Functions
    // ------------------------------------------------------------

    /// @notice Sends tokens from the caller to another address
    /// @param _to The wallet receiving the tokens
    /// @param _value Number of tokens to send
    /// @return success Returns true if the operation succeeds
    function transfer(address _to, uint256 _value) public returns (bool success) {
        // Prevent transferring to the zero address (not valid)
        require(_to != address(0), "Invalid recipient");

        // Ensure sender owns enough tokens
        require(balanceOf[msg.sender] >= __value, "Not enough balance");

        // Deduct amount from sender
        balanceOf[msg.sender] -= __value;

        // Add tokens to recipient
        balanceOf[_to] += __value;

        // Log the movement of tokens
        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    /// @notice Allows another address to spend tokens on your behalf
    /// @param _spender Address that is being granted permission
    /// @param _value Amount they are allowed to use
    /// @return success Returns true when approval is stored
    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(_spender != address(0), "Invalid spender");

        // Store the approved amount
        allowance[msg.sender][_spender] = _value;

        // Emit an event for front-ends and explorers
        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    /// @notice Allows an approved address to transfer tokens on behalf of an owner
    /// @param _from Wallet from which tokens will be taken
    /// @param _to Wallet receiving the tokens
    /// @param _value Number of tokens to move
    /// @return success Returns true if successful
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Invalid recipient");

        // Ensure owner has enough tokens
        require(balanceOf[_from] >= _value, "Owner balance too low");

        // Ensure spender is allowed to spend this amount
        require(allowance[_from][msg.sender] >= __value, "Allowance too small");

        // Deduct amount from owner's account
        balanceOf[_from] -= _value;

        // Send tokens to recipient
        balanceOf[_to] += _value;

        // Reduce remaining allowance
        allowance[_from][msg.sender] -= _value;

        // Notify blockchain listeners
        emit Transfer(_from, _to, _value);

        return true;
    }

    // ------------------------------------------------------------
    // Helper Functions
    // ------------------------------------------------------------

    /// @notice Returns the total token supply
    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    /// @notice Returns all core token metadata in a single call
    function getTokenInfo()
        public
        view
        returns (
            string memory tokenName,
            string memory tokenSymbol,
            uint8 tokenDecimals,
            uint256 tokenSupply
        )
    {
        return (name, symbol, decimals, totalSupply);
    }
}
