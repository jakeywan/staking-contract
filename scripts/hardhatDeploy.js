async function main() {
  // We get the contract to deploy
  const Staking = await ethers.getContractFactory('Staking');
  const staking = await Staking.deploy('0x6810e029d24fa8a9ab73b6789a701621753b5b64');

  console.log('DEPLOYED TO', staking.address);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });