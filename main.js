const web3 = new Web3(Web3.givenProvider);
const contractID = CONTRACT_ID;
const abi = ABI;

let contractInstance;

$(document).ready(() => {
	window.ethereum.enable().then((accounts) => {
		contractInstance = new web3.eth.Contract(abi, contractID, {from: accounts[0]});
		console.log('setup is a success: ', accounts)
	});
});