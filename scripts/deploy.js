// scripts/deploy.js

const hre = require("hardhat");

async function main() {
  // Compile contracts before deploying
  await hre.run("compile");

  console.log("Deploying PriceOracleBTCUSD...");

  const initialPrice = 65000; // Example initial BTC/USD price
  const PriceOracleBTCUSD = await hre.ethers.getContractFactory("PriceOracleBTCUSD");
  const oracle = await PriceOracleBTCUSD.deploy(initialPrice);

  await oracle.waitForDeployment();

  console.log("Contract deployed successfully!");
  console.log(`PriceOracleBTCUSD deployed to: ${await oracle.getAddress()}`);
  console.log(`Deployed by: ${(await hre.ethers.provider.getSigner()).address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
