require("@nomicfoundation/hardhat-toolbox");
require("@nomicfoundation/hardhat-chai-matchers");
require("dotenv").config()
require("hardhat-deploy")

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.9",
};

const GOERLI_RPC_URL = process.env.GOERLI_RPC_URL 
const PRIVATE_KEY = process.env.PRIVATE_KEY

module.exports = {
    defaultNetwork: "hardhat",
    networks: {
        hardhat: {
            chainId: 31337,
        },
        localhost: {
            chainId: 31337,
        },
        goerli: {
            url: GOERLI_RPC_URL,
            accounts: PRIVATE_KEY !== undefined ? [PRIVATE_KEY] : [],
            saveDeployments: true,
            chainId: 5,
        },
    },
    contractSizer: {
        runOnCompile: false,
        only: ["Raffle"],
    },
    namedAccounts: {
        deployer: {
            default: 0, // default 
            1: 0,
        },
        player: {
            default: 1,
        },
    },
    solidity: {
        compilers: [
            {
                version: "0.8.7",
            },
            {
                version: "0.4.24",
            },
        ],
    },
    mocha: {
        timeout: 200000,
    },
}
