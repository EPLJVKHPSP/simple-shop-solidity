// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract MyContract {

    address public owner;
    mapping (address => uint) public payments;
    //maping dl9a transacii: key=user's adress and uint = ETH (Wei)

    constructor() {
        owner = msg.sender;
    }

    function payForService() public payable {
        payments[msg.sender] = msg.value;
        //that means we take address of owner (msg.sender) and put there ETH (msg.value)
        //this line connected with line 7 
    }

    function withdrawAll() public {
        address payable _to = payable(owner);
        //because owner doesn't have "payable" attribute, we make temporary var "_to"

        address _thisContract = address(this);
        //po suti toje samoe, prosto delaen tak dl9 lu4shego readability

        _to.transfer(_thisContract.balance);
        //we send all the ether to owner's balance
    }
}




