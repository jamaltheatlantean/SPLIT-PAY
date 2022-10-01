const { getNamedAccounts, deployments, network } = require("hardhat");
const {
  networkConfig,
  developmentChains,
} = require("../helper-hardhat-config");

module.exports = async ({ getNamedAccounts, deployments }) => {
  const { deploy, log } = deployments;
  const { deployer } = await getNamedAccounts();
  const chainId = network.config.chainId;

  log("----------------------------------------------------");
  log("----------------------------------------------------");

  log("Deploying SplitPay and waiting for confirmations...");
  const splitPay = await deploy("SplitPay", {
    from: deployer,
    args: [],
    log: true,
    waitConfirmations: network.config.blockConfirmations || 1,
  });
  log(`SplitPay deployed at ${splitPay.address}`);
  log("----------------------------------------------------");
  log("----------------------------------------------------");
  console.log("Split-Pay is live, share your earnings with your team, starting today.");
};

module.exports.tags = ["all", "splitPay"];
