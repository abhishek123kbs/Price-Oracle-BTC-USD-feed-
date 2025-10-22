🪙 Price Oracle – BTC/USD Feed

A decentralized price oracle that provides real-time Bitcoin (BTC) to USD exchange rates on the blockchain. This project demonstrates how smart contracts can securely fetch, verify, and serve external price data using oracle mechanisms such as Chainlink, Band Protocol, or custom APIs.

🚀 Overview

Smart contracts on blockchains cannot directly access real-world data. This oracle bridge allows smart contracts to read the latest BTC/USD price using trusted data feeds.

The project implements:

A Price Oracle smart contract (Solidity)

Integration with Chainlink Data Feeds or a custom off-chain data fetcher

A frontend dApp that displays the current BTC/USD rate in real time

🧩 Features

Fetches BTC/USD price securely and reliably

Uses decentralized oracle networks for tamper-proof data

Simple interface for reading prices on-chain

Can be extended to other pairs (ETH/USD, MATIC/USD, etc.)

🛠️ Tech Stack
Layer	Technology
Smart Contract	Solidity, Chainlink
Blockchain	Ethereum / Polygon / Sepolia (Testnet)
Frontend	React.js / Next.js
Web3 Interaction	Ethers.js / Web3.js
Deployment	Hardhat / Foundry
📦 Installation & Setup

Clone the Repository

git clone https://github.com/<your-username>/Price-Oracle-BTC-USD-feed.git
cd Price-Oracle-BTC-USD-feed


Install Dependencies

npm install


Configure Environment
Create a .env file and add the following:

PRIVATE_KEY=<your_wallet_private_key>
RPC_URL=<network_rpc_url>
CHAINLINK_FEED_ADDRESS=<chainlink_btc_usd_feed_address>


Compile Contracts

npx hardhat compile


Deploy Contracts

npx hardhat run scripts/deploy.js --network sepolia

📊 Usage
Read the BTC/USD Price On-Chain

Once deployed, you can query the current price using:

uint256 price = priceFeed.getLatestPrice();

Frontend Display

The dApp fetches the price through Web3 calls and updates automatically every few seconds.

🧠 Example Contract (Simplified)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract BTCUSDOracle {
    AggregatorV3Interface internal priceFeed;

    constructor(address feedAddress) {
        priceFeed = AggregatorV3Interface(feedAddress);
    }

    function getLatestPrice() public view returns (int) {
        (, int price,,,) = priceFeed.latestRoundData();
        return price; // BTC/USD price with 8 decimals
    }
}

🧪 Testing

Run unit tests using Hardhat:

npx hardhat test

🌐 Live Demo

(If deployed)
🔗 View Contract on Etherscan

💻 Try Frontend Demo

📜 License

This project is licensed under the MIT License – free to use and modify.

🔗 GitHub : https://github.com/abhishek123kbs/Price-Oracle-BTC-USD-feed-
