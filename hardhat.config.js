/**
* @type import('hardhat/config').HardhatUserConfig
*/

require('dotenv').config()
require('@nomiclabs/hardhat-ethers')
require('@nomiclabs/hardhat-etherscan')
const { INFURA_SECRET, METAMASK_KEY, ETHERSCAN_KEY, RINKEBY_URL } = process.env

module.exports = {
   solidity: "0.8.0",
   defaultNetwork: "rinkeby",
   networks: {
      hardhat: {},
      rinkeby: {
         url: RINKEBY_URL,
         accounts: [METAMASK_KEY]
      }
   },
   etherscan: {
    apiKey: ETHERSCAN_KEY
  }
}
