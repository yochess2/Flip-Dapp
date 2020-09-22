pragma solidity 0.5.12;

contract Coinflip {
	string message = "This is working!";

	function getMessage() public view returns(string memory) {
		return message;
	}

	function setMessage(string memory newMessage) public payable {
		message = newMessage;
	}
}