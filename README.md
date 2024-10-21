CryptoZombies DApp 

Team Members
•	Sri Hari Dheeraj Kommineni
o	CWID: 885177196
o	Email: dheerajkommineni@csu.fullerton.edu
•	Tarun Sai Vuppala
o	CWID: 827778861
o	Email: tarunsai@csu.fullerton.edu
•	Hemanth Naidu Karnataka
o	CWID: 885177238
o	Email: hemanth_karnataka@csu.fullerton.edu
•	Ashish Kottakota
o	CWID: 878640879
o	Email: kottakotaashish@csu.fullerton.edu
•	Sai Sirisha Surapaneni
o	CWID: 885176834
o	Email: siri23@csu.fullerton.edu

Improvements made in the Contracts
We have made the following improvements to the original starter code of the DApp:
1.	getZombiesCount function added to ZombieFactory.sol to fetch the total number of zombies created.
2.	levelDown function added to ZombieOwnership.sol that allows users to decrease a zombie's level.
3.	getKittyContractAddress function added to ZombieFeeding.sol to retrieve the current Kitty contract address.
4.	Introduced a new contract (KittyContract.sol) that contains the following functionalities:
o	createKitty: Allows users to create a new kitty with a name and random genes.
o	generateRandomGenes: Function to generate random genes for the kitty.
o	getKitty: Fetches the details of a kitty by its ID.
o	getKittyCount: Retrieves the total number of kitties created.

Additional Features Developed in the app
•	Able to create multiple zombies
•	Level Down
•	Rename Zombie
•	Change DNA
•	Attack Zombie
•	Transfer Zombie
•	Create Kitty
•	Show Kitties
•	Show Zombie Count
•	Leaderboard of zombies (Based on wins)
•	Transfer ownership

Instructions for Setup and Running the DApp
Prerequisites
1.	Install Node.js and npm.
2.	Install Truffle by running npm install -g truffle.
3.	Install Ganache for local blockchain testing or configure your project to connect to the Sepolia testnet.

Steps to Setup and Run
1. Clone the Repository:
bash
Copy code
git clone < https://github.com/DheerajKommineni/CryptoZombies.git>

2. Install Dependencies:
Run the following command to install all required dependencies:
bash
Copy code
npm install
sudo npm install -g http-server

3. Configure Environment Variables:
Create a .env file in the root directory and add your private key and Infura project ID:
bash
Copy code
PRIVATE_KEY=<your-private-key>
INFURA_PROJECT_ID=<your-infura-project-id>

4. Compile the Contracts:
Compile the smart contracts using Truffle:
bash
Copy code
truffle compile

5. Deploy the Contracts:
Deploy the contracts to the desired network (e.g., Ganache or Sepolia):
bash
Copy code
truffle migrate --network sepolia (For Sepolia)
truffle migrate –network development (For Ganache)

6. Update the Contract Addresses in index.html:
•	Replace the placeholders in index.html with the actual contract addresses:
o	zombieOwnershipContractAddress
o	KittyContractAddress
o	zombieFeedingContractAddress

7. Run the DApp:
Start the DApp using the following command:
bash
Copy code
cd <Frontend>
http-server

8. Open the DApp:
Open index.html in a browser with MetaMask installed and configured for the network you're using (e.g., Sepolia or Ganache).

9. Interact with the DApp:
Use the available buttons on the front end to interact with zombies and kitties, such as creating zombies, leveling them up, creating kitties, and viewing the leaderboard.
