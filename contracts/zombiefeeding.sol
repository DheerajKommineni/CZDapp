pragma solidity ^0.4.25;

import "./zombiefactory.sol";



interface KittyInterface {
    function getKitty(uint256 _id) external view returns (
        string name,         // Added the name field
        bool isGestating,
        bool isReady,
        uint256 cooldownIndex,
        uint256 nextActionAt,
        uint256 siringWithId,
        uint256 birthTime,
        uint256 matronId,
        uint256 sireId,
        uint256 generation,
        uint256 genes
    );
}


contract ZombieFeeding is ZombieFactory {



    KittyInterface public kittyContract;

    uint cooldownTime = 1 minutes;

   

    // Events for logging actions
    event FeedOnKitty(uint256 indexed zombieId, uint256 indexed kittyId);
    event ZombieFed(uint256 indexed zombieId, uint256 newDna);

    // Modifier to ensure the sender owns the zombie
    modifier onlyOwnerOf(uint _zombieId) {
    address owner = zombieToOwner[_zombieId];
    require(msg.sender == owner, "You must own this zombie.");
    _;
}


    // Set the Kitty contract address
    function setKittyContractAddress(address _address) external {
        kittyContract = KittyInterface(_address);
    }

    function getKittyContractAddress() public view returns (address) {
    return address(kittyContract);
}

     function _triggerCooldown(Zombie storage _zombie) internal {
        _zombie.readyTime = uint32(now + cooldownTime);
    }

    // Feed on Kitty and multiply DNA
    function feedAndMultiply(uint _zombieId, uint _targetDna, string memory _species) internal {
    Zombie storage myZombie = zombies[_zombieId];

    // Ensure valid targetDna by modulus operation
    _targetDna = _targetDna % dnaModulus;
    uint newDna = (myZombie.dna + _targetDna) / 2; // Could there be a divide-by-zero issue here?

    if (keccak256(abi.encodePacked(_species)) == keccak256(abi.encodePacked("kitty"))) {
        newDna = newDna - newDna % 100 + 99;
    }

    // Check if newDna is valid
    require(newDna > 0, "Invalid DNA calculated");

    _createZombie("NoName", newDna);

    emit ZombieFed(_zombieId, newDna);
}




function feedOnKitty(uint _zombieId, uint _kittyId) public {

    require(_zombieId < zombies.length, "Zombie ID out of bounds");

    uint kittyDna;
    // Account for the additional 'name' field in the tuple unpacking
    ( , , , , , , , , , , kittyDna) = kittyContract.getKitty(_kittyId);

    require(kittyDna > 0, "Kitty DNA invalid");

    emit FeedOnKitty(_zombieId, _kittyId);

    feedAndMultiply(_zombieId, kittyDna, "kitty");
}




}
