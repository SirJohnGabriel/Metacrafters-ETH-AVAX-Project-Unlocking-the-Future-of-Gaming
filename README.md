﻿# DegenToken

DegenToken is an ERC20-based token built on the Ethereum blockchain using Solidity. This smart contract demonstrates token minting, burning, transferring, and redeeming functionalities, making it suitable for token-based reward systems or blockchain-based applications.

## Description

The DegenToken contract is an ERC20 token with the following key features:  
- **Minting:** Allows the owner to mint new tokens.  
- **Burning:** Users can burn tokens to reduce the supply.  
- **Transfer Tokens:** Users can transfer tokens to others with approval.  
- **Redemption:** Tokens can be redeemed for predefined items using specific token values.  
- **Fixed Decimals:** The token does not use decimal values, simplifying token handling.  

This contract extends the OpenZeppelin libraries for ERC20, burnable tokens, and ownership, ensuring robust and secure operations.

## Features

1. **Mint Tokens**  
   The owner can mint tokens to any address using the `mint` function.  

2. **Burn Tokens**  
   Users can burn tokens via the `burnTokens` function, reducing their balance and the total supply.  

3. **Transfer Tokens**  
   Tokens can be transferred to another address with the `transferTokens` function, ensuring sufficient balance.  

4. **Redeem Tokens**  
   Users can redeem tokens for predefined items, with each item costing a specific token amount.  

## Getting Started

### Prerequisites

To deploy and interact with the DegenToken contract, ensure you have the following tools installed:  
- [Node.js](https://nodejs.org/)  
- [Hardhat](https://hardhat.org/)  
- A compatible Ethereum wallet (e.g., MetaMask).  

### Installation

1. Clone this repository or create a new project directory:  
   ```bash
   mkdir degen-token && cd degen-token
   ```
2. Initialize a Node.js project and install Hardhat:  
   ```bash
   npm init -y
   npm install --save-dev hardhat
   ```
3. Set up a Hardhat project:  
   ```bash
   npx hardhat
   ```
   Follow the prompts to create a new Hardhat project.

4. Install the OpenZeppelin Contracts library:  
   ```bash
   npm install @openzeppelin/contracts
   ```

5. Save the `DegenToken` contract in the `contracts` directory as `DegenToken.sol`.

### Deployment

1. Create a new deployment script in the `scripts` directory, e.g., `deploy.js`:  
   ```javascript
   async function main() {
       const DegenToken = await ethers.getContractFactory("DegenToken");
       const token = await DegenToken.deploy();
       console.log("DegenToken deployed to:", token.address);
   }

   main().catch((error) => {
       console.error(error);
       process.exitCode = 1;
   });
   ```
   
2. Deploy the contract to a test network (e.g., Goerli):  
   - Update the `hardhat.config.js` file with your network configuration.  
   - Run the deployment script:  
     ```bash
     npx hardhat run scripts/deploy.js --network goerli
     ```

### Interacting with the Contract

After deployment, use the Hardhat console, ethers.js, or web3.js to interact with the contract.  

Key functions include:  
- `mint(address to, uint256 amount)`: Mint tokens (owner only).  
- `burnTokens(uint256 _value)`: Burn your tokens.  
- `transferTokens(address _receiver, uint256 _value)`: Transfer tokens to another user.  
- `redeemTokens(uint8 _item)`: Redeem tokens for predefined items.  

## Authors

**John Gabriel Pagtalunan**  
- Email: [j.g.pagtalunan14@gmail.com](mailto:j.g.pagtalunan14@gmail.com)  
- Alt Email: [johngabrielpagtalunan@hotmail.com](mailto:johngabrielpagtalunan@hotmail.com)  
- Academic Email: [202120016@fit.edu.ph](mailto:202120016@fit.edu.ph)  

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
