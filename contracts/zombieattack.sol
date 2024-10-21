pragma solidity ^0.4.25;

import "./zombiehelper.sol";

contract ZombieAttack is ZombieHelper {
    uint randNonce = 0;
    uint attackVictoryProbability = 70;

    // Event emitted after an attack to notify the result
    event AttackResult(bool success, uint zombieId, uint targetId);

    // Generate random number using block timestamp, sender, and nonce
    function randMod(uint _modulus) internal returns (uint) {
        randNonce = randNonce.add(1); // Increase nonce
        return uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _modulus;
    }

    // Attack another zombie (target)
    function attack(uint _zombieId, uint _targetId) external onlyOwnerOf(_zombieId) {
        // Check if the zombie belongs to the sender
        require(zombieToOwner[_zombieId] == msg.sender, "You must own the zombie to attack");

        // Ensure the target ID is valid
        require(_targetId < zombies.length, "Invalid target ID");

        Zombie storage myZombie = zombies[_zombieId];
        Zombie storage enemyZombie = zombies[_targetId];

        // Check for cooldown to avoid multiple attacks in a short time
        require(myZombie.readyTime <= now, "Zombie is cooling down");

        uint rand = randMod(100);
        bool success = rand <= attackVictoryProbability;

        if (success) {
            // Attack succeeded
            myZombie.winCount = myZombie.winCount.add(1);
            myZombie.level = myZombie.level.add(1);
            enemyZombie.lossCount = enemyZombie.lossCount.add(1);

            // Feed on the losing zombie
            feedAndMultiply(_zombieId, enemyZombie.dna, "zombie");
        } else {
            // Attack failed
            myZombie.lossCount = myZombie.lossCount.add(1);
            enemyZombie.winCount = enemyZombie.winCount.add(1);

            // Trigger cooldown for the attacking zombie
            _triggerCooldown(myZombie);
        }

        // Trigger cooldown for the zombie after attack
        _triggerCooldown(myZombie);

        // Emit the result of the attack
        emit AttackResult(success, _zombieId, _targetId);
    }
}
