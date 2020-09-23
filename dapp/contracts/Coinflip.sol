import "./Ownable.sol";	
pragma solidity 0.5.12;

contract Coinflip is Ownable {
	uint balance;

	event flipResult(bool result);

	function getDappBalance() public view returns(uint) {
		return balance;
	}

	function flip() public payable {
		uint bet = msg.value;
		uint random = random();
		if (random == 0) {
			balance += bet;
			emit flipResult(false);
		} else {
			balance -= bet;
			msg.sender.transfer(bet*2);
			emit flipResult(true);
		}
	}

	function deposit() public onlyOwner payable {
		balance += msg.value;
	}

	function withdrawAll() public onlyOwner returns(uint) {
	    uint toTransfer = balance;
	    balance = 0;
	    msg.sender.transfer(toTransfer);
	    return toTransfer;
	}

	function random() private view returns(uint) {
		return now % 2;
	}
}