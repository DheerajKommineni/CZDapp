const SafeMath = artifacts.require('SafeMath');
const ZombieFactory = artifacts.require('ZombieFactory');
const ZombieFeeding = artifacts.require('ZombieFeeding');
const ZombieHelper = artifacts.require('ZombieHelper');
const ZombieAttack = artifacts.require('ZombieAttack');
const ZombieOwnership = artifacts.require('ZombieOwnership');
const KittyContract = artifacts.require('KittyContract');

const delay = ms => new Promise(resolve => setTimeout(resolve, ms)); // Delay function

module.exports = async function (deployer) {
  // Deploy SafeMath contract
  await deployer.deploy(SafeMath);
  console.log('SafeMath deployed at:', SafeMath.address);
  await delay(120000); // Delay of 60 seconds

  // Deploy ZombieFactory contract
  await deployer.deploy(ZombieFactory);
  console.log('ZombieFactory deployed at:', ZombieFactory.address);
  await delay(120000); // Delay of 60 seconds

  // Deploy ZombieFeeding contract
  await deployer.deploy(ZombieFeeding);
  console.log('ZombieFeeding deployed at:', ZombieFeeding.address);
  await delay(120000); // Delay of 60 seconds

  // Deploy ZombieHelper contract
  await deployer.deploy(ZombieHelper);
  console.log('ZombieHelper deployed at:', ZombieHelper.address);
  await delay(120000); // Delay of 60 seconds

  // Deploy ZombieAttack contract
  await deployer.deploy(ZombieAttack);
  console.log('ZombieAttack deployed at:', ZombieAttack.address);
  await delay(120000); // Delay of 60 seconds

  // Deploy ZombieOwnership contract
  await deployer.deploy(ZombieOwnership);
  console.log('ZombieOwnership deployed at:', ZombieOwnership.address);
  await delay(120000); // Delay of 60 seconds

  // Deploy KittyContract
  await deployer.deploy(KittyContract);
  console.log('KittyContract deployed at:', KittyContract.address);
};
