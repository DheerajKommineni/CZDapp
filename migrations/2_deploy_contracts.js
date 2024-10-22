const fs = require('fs');
const path = require('path');
const SafeMath = artifacts.require('SafeMath');
const ZombieFactory = artifacts.require('ZombieFactory');
const ZombieFeeding = artifacts.require('ZombieFeeding');
const ZombieHelper = artifacts.require('ZombieHelper');
const ZombieAttack = artifacts.require('ZombieAttack');
const ZombieOwnership = artifacts.require('ZombieOwnership');
const KittyContract = artifacts.require('KittyContract');

const delay = ms => new Promise(resolve => setTimeout(resolve, ms)); // Delay function

module.exports = async function (deployer) {
  const deploymentData = {};

  // Deploy SafeMath contract
  await deployer.deploy(SafeMath);
  console.log('SafeMath deployed at:', SafeMath.address);
  // await delay(60000); // Delay of 60 seconds

  // Deploy ZombieFactory contract
  await deployer.deploy(ZombieFactory);
  deploymentData.zombieFactory = ZombieFactory.address;
  console.log('ZombieFactory deployed at:', ZombieFactory.address);
  // await delay(60000); // Delay of 60 seconds

  // Deploy ZombieFeeding contract
  await deployer.deploy(ZombieFeeding);
  deploymentData.zombieFeeding = ZombieFeeding.address;
  console.log('ZombieFeeding deployed at:', ZombieFeeding.address);
  // await delay(60000); // Delay of 60 seconds

  // Deploy ZombieHelper contract
  await deployer.deploy(ZombieHelper);
  deploymentData.zombieHelper = ZombieHelper.address;
  console.log('ZombieHelper deployed at:', ZombieHelper.address);
  // await delay(60000); // Delay of 60 seconds

  // Deploy ZombieAttack contract
  await deployer.deploy(ZombieAttack);
  deploymentData.zombieAttack = ZombieAttack.address;
  console.log('ZombieAttack deployed at:', ZombieAttack.address);
  // await delay(60000); // Delay of 60 seconds

  // Deploy ZombieOwnership contract
  await deployer.deploy(ZombieOwnership);
  deploymentData.zombieOwnership = ZombieOwnership.address;
  console.log('ZombieOwnership deployed at:', ZombieOwnership.address);
  // await delay(60000); // Delay of 60 seconds

  // Deploy KittyContract
  await deployer.deploy(KittyContract);
  deploymentData.kittyContract = KittyContract.address;
  console.log('KittyContract deployed at:', KittyContract.address);

  // Write deployment addresses to a JSON file
  const deploymentPath = path.join(__dirname, '../Frontend/deployment.json');
  fs.writeFileSync(
    deploymentPath,
    JSON.stringify(deploymentData, null, 2),
    'utf-8',
  );

  console.log('Contracts deployed and addresses saved in deployment.json');
};
