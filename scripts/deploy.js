// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {


  const SplitPay = await hre.ethers.getContractFactory("SplitPay");
  const splitPay = await SplitPay.deploy();

  await splitPay.deployed();

  console.log(
    `Split-Pay is live, share your earnings with your team. deployed to ${splitPay.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
