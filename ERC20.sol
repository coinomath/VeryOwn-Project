pragma solidity ^0.4.11;

interface ERC20 {
  function totalSupply() constant returns (uint256 totalSupply);
  function balanceOf(address _owner) constant returns (uint256 balance);
  function transfer(address _to, uint256 _value) returns (bool success);
  function transfer(address _from, address _to, uint256 _value) returns (bool success);
  function approve(address _spender, uint256 _value) returns (bool success);
  event Transfer(address indexed _from, address indexed _to, uint256 _value); 
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}
