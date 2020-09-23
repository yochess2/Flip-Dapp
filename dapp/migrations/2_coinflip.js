const Coinflip = artifacts.require("Coinflip");

module.exports = function(deployer, network, accounts) {
	let data = {value: web3.utils.toWei('1', "ether"), from: accounts[0]};

	deployer.deploy(Coinflip).then((instance) => {
		instance.deposit(data).then(() => {
			console.log('done!');
		});
	})
};