pragma solidity ^0.4.11;

import "ERC20.sol;

contract VeryOwnCoin is ERC20 {

	//CONSTANTS
	// Maximum number of VeryOwnCoin to sell
	uint public constant _totalSupply = 24000000; // 24 000 000 VOC
	
	string public constant symbol = "VOC";
	string public constant name = "VeryOwn Coin";
	uint8 public constant decimals = 18
	
	mapping(address => uint256) balances;
	mapping(address => mapping(address => uint256)) allowed;
	
	function VeryOwnCoin() {
		balances[msg.sender] = _totalSupply;
	}
	
	function totalSupply() constant returns (uint256 totalSupply) {
		return _totalSupply;
	}
	
	function balanceOf(address _owner) constant returns (uint256 balance) {
		return balances[_owner];
	}
	function transfer(address _to, uint256 _value) returns (bool success) {
		require (
			balances[msg.sender] >= _value
			&& _value > 0
		);
		balances[msg.sender] -= _value;
		balances[_to] += _value;
		Transfer(msg.sender, _to, _value);
		return true;
	}
	
	function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
	require(
		allowed [_from][msg.sender] >= _value
		&& balancess [_from][msg.sender] >= _value
		&& _value > 0
	);
	balances[msg.sender] -= _value;
	balances[_to] += _value;
	allowed[_from][msg.sender] -= _value;
	Transfer(_from, _to, _value);
	return true;
	}
	
	function approve(address _spender, uint256 _value) returns (bool success) {
		allowed[msg.sender][_spender] = _value;
		Approval(msg.sender, _spender, _value);
		return true;	
	}
	
	function allowance (address _owner, address _spender) constant returns (uint256 remaining)
		return allowed[_owner][_spender];
		
	// Minimum amount to invest
	uint public constant MIN_INVEST_ETHER = 50 finney; // 0.05 ETH
	// Crowdsale period
	uint private constant CROWDSALE_PERIOD = 31 days; // 22 days crowdsale run
	// Number of VOC per Ether
	uint public constant COIN_PER_ETHER = 2000; // 2000 VOC


	//VARIABLES
	// VOC contract reference
	Token public coin;
	// Number of Ether received
	uint public etherReceived;
	// Number of VOC sent to Ether contributors
	uint public coinSentToEther;
  	// Number of VOC to burn
  	uint public coinToBurn;
	// Crowdsale start time
	uint public startTime;
	// Crowdsale end time
	uint public endTime;
 	// Is crowdsale still on going
	bool public crowdsaleClosed;
	// Refund open variable
	bool public refundsOpen;

	// Backers Ether indexed by their Ethereum address
	mapping(address => Backer) public backers;


	//MODIFIERS
	modifier respectTimeFrame() {
		if ((now < startTime) || (now > endTime )) throw;
		_;
	}
	
	modifier refundStatus() {
		if ((refunds != true )) throw;
		_;
	}

	//EVENTS
	event LogReceivedETH(address addr, uint value);
	event LogCoinsEmited(address indexed from, uint amount);



}
