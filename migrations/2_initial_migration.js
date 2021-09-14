const ERC721_SaleToken = artifacts.require("ERC721_SaleToken.sol");

module.exports = async function (deployer,network,accounts) {
  await deployer.deploy(ERC721_SaleToken);
};

// > transaction hash:  0x8f9060503827aba8a81238564f6ae4161c1bb84a3b55845a4ee5fb5d9253de39
// > contract address:  0x2bD1a659A212AFd30549873288433fc2cf830393
                    