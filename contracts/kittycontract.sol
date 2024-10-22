pragma solidity ^0.4.25;

contract KittyContract {
    struct Kitty {
        string name;       
        uint256 genes;
        uint64 birthTime;
        uint32 matronId;
        uint32 sireId;
        uint32 generation;
    }

    Kitty[] public kitties;

    // Function to create a new kitty with a random gene and a given name
    function createKitty(string memory _name) public {
        uint256 randomGenes = _generateRandomGenes(_name); // Generate random genes based on the name
        Kitty memory newKitty = Kitty({
            name: _name,
            genes: randomGenes,
            birthTime: uint64(now),
            matronId: 0,
            sireId: 0,
            generation: 1
        });
        kitties.push(newKitty); // Push the new kitty to the array
    }

    // Function to generate pseudo-random genes based on the kitty name
    function _generateRandomGenes(string memory _name) private view returns (uint256) {
        uint256 random = uint256(keccak256(abi.encodePacked(_name, block.timestamp, block.difficulty)));
        return random % (10**16); // Limiting the size of the genes to 16 digits
    }

    // Function to get the number of kitties
    function getKittyCount() public view returns (uint256) {
        return kitties.length;
    }

    // Function to get details of a specific kitty
    function getKitty(uint256 _id) external view returns (
        string memory name,
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
    ) {
        Kitty storage kitty = kitties[_id];
        return (
            kitty.name,
            false, // isGestating
            true,  // isReady
            0,     // cooldownIndex
            0,     // nextActionAt
            0,     // siringWithId
            kitty.birthTime,
            kitty.matronId,
            kitty.sireId,
            kitty.generation,
            kitty.genes
        );
    }
}
