pragma solidity 0.4.25;
pragma experimental ABIEncoderV2;

 contract Crud {
     uint256 public counter;
     uint256 public count=0;
     mapping(uint=> Person) public people;
     address owner;

    
     modifier onlyOwner() {
         require(owner==msg.sender);
         _;
        
     }
    
     constructor() public {
         owner=msg.sender;
     }
    
     struct Person {
         uint _id;
         string _firstname;
         string _lastname;
        
     }
    
     function addPerson(string _firstname, string _lastname) public onlyOwner{
        
         people[counter]=Person(counter, _firstname, _lastname);
         counter++;
     }
    
     function update(uint _id, string _firstname ) public {
         people[_id]._firstname=_firstname;
     }
    
     function remove(uint _id) public {
         delete people[_id];
     }
    
     function compareStrings (string memory _a) public  returns (bool) {
         if(keccak256(abi.encodePacked((_a))) == keccak256(abi.encodePacked((""))) ){
             count++;
             return true;
     }
     else
             return false;

       }
       

     function getAll() public view returns (Person[] memory){
     Person[] memory ret = new Person[](counter);
     for (uint i = 0; i < counter; i++) {
         ret[i] = people[i];
     }
     return ret;
 }

     function getname( string _name) public view returns (Person[] memory){
        
         uint counterLocal = 0;
         uint counterLocal1 = 0;
         uint counterLocal2 = 0;
     Person[] memory ret = new Person[](counter);
     for (uint i = 0; i <ret.length; i++) {
         if(keccak256(abi.encodePacked((_name))) == keccak256(abi.encodePacked((people[i]._firstname))) )
         {
         ret[counterLocal] = people[i];
         counterLocal++;
         }
     }
        
     for (uint j = 0; j <ret.length; j++) {
         if(keccak256(abi.encodePacked((ret[j]._firstname))) != keccak256(abi.encodePacked((""))))
         {
       
         counterLocal1++;
         }
    

     }
     Person[] memory ret1 = new Person[](counterLocal1);
     for (uint k = 0; k <=counterLocal1; k++) {
         if(keccak256(abi.encodePacked((_name))) == keccak256(abi.encodePacked((people[k]._firstname))) )
         {
         ret1[counterLocal2] = people[k];
         counterLocal2++;
         }
     }
     return ret1;
 }
 }
