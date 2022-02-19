// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DeadManSwitch{
	address public owner;
	uint public lastAlive;
	
	address public recipient = 0xF7d1FBc5e5ff0118B4Ddee8E62c2dA90AfEeb7d8;
	address public transferToken = 0x588238cCaE0E34DB72beE3E6bF340423149ff236; //god is a woman token
	
	constructor(){
	owner = msg.sender;
	lastAlive = block.number;
	}
	
	modifier onlyOwner(){
	    require(msg.sender==owner, "Not owner");
	    _;
  	}
  	
  	modifier isDead(){
	    require(block.number - lastAlive > 10, "Human not dead yet");
	    _;
  	}
  	
  	function still_alive() public onlyOwner{
  	lastAlive = block.number;
  	}
  	
  	function safeTransfer(address token, address to, uint value) internal {
        (bool success, bytes memory data) = token.call(abi.encodeWithSelector(0xa9059cbb, to, value));
        require(success && (data.length == 0 || abi.decode(data, (bool))), 'TransferHelper: TRANSFER_FAILED');
    }
	
	function sendMonies()  external isDead{
	safeTransfer(transferToken, recipient, address(this).balance);
	owner = recipient;
	}
	
	function transferToContract() public {
	uint totalBalance = ERC20(transferToken).balanceOf(address(msg.sender));
	ERC20(transferToken).approve(msg.sender, totalBalance);
  	ERC20(transferToken).transferFrom(msg.sender, address(this), totalBalance);
	}
	
	function getBalanceContract() public view returns(uint){
        return address(this).balance;
    }
}

