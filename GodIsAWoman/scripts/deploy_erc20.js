const main = async() => {
    const nftContractFactory = await hre.ethers.getContractFactory('ERC20Token');
    const nftContract = await nftContractFactory.deploy();
    await nftContract.deployed();
    console.log("Contract deployed to:", nftContract.address);

    // Call the function.
    //let txn = await nftContract.whitelistUser(process.env.WALLET_ADDRESS,process.env.ERC1155 );
    // Wait for it to be mined.
    //await txn.wait()
    //contract address: 0x588238cCaE0E34DB72beE3E6bF340423149ff236 and Pool address: 
};

const runMain = async() => {
    try {
        await main();
        process.exit(0);
    } catch (error) {
        console.log(error);
        process.exit(1);
    }
};

runMain();
