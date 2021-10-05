async function main() {
  // We get the contract to deploy
  const Vibez = await ethers.getContractFactory('Vibez');
  const vibez = await Vibez.deploy();

  console.log('DEPLOYED TO', vibez.address);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });