# Solidity Notes

### Define the Compiler Version

### Contract

- similar to a class in Python
  contract nameOfClass {}

All solidity code is encapsulated in contracts. All variables and functions belong to a contract.

## Solidity Types

### Integers

uint (unsigned)

int

uint256 favoriteNumber = 43;
(size 256 bits) (name) (value)

### bool

bool favoriteBool = True;

### string

string favoriteString = "Go fuck yourself";

### address

address favorityAddress = 0x....;

### bytes32

bytes32 favorityBytes = "Cat"; (converts down into bytes)

Use // to make comments in Solidity.

## Functions

A function will execute a task.

function name(variable_type variable_name) visibility {
code block
}

Any function call is also a transaction on the blockchain.

Functions are public by default. Meaning anyone or any contract can call your contracts functions.

### Function Visibility

This defines the visibility of the variable or the function.

- public: can be called by anybody, including variables
- external: has to be called by an external contract
- internal: can only be called by other functions inside the contract

State visibilty is automatically set to internal.

View and Pure functions are non state changing, therefore no transaction is made.

- view: we want to read some state of the blockchain
- pure: a function that does math, but no state is saved.

Return Values
To return a value from a function, the declaration looks like this:

string greeting = "What's up dog";

function sayHello() public returns (string memory) {
return greeting;
}
In Solidity, the function declaration contains the type of the return value (in this case string).

Function modifiers
The above function doesn't actually change state in Solidity — e.g. it doesn't change any values or write anything.

So in this case we could declare it as a view function, meaning it's only viewing the data but not modifying it:

function sayHello() public view returns (string memory) {

- functions or variables that are private are not accessible outside the contract, even to inherited contracts
- internal is the same as private, except that it is also accessible to contracts that inherit from it.
- external is similar to public, except that these functions can only be called outside the contract, not by functions inside the contract

### Function Return Values

The funtion declaration contains the type of return value.

string greeting = "What's up Doc?";

function sayHello() public returns(string memory){
return greeting;
}

#### Multiple Return Values

function multipleReturns() internal returns(uint a, uint b, uint c){
return (1, 2, 3);
}

function processMultipleReturns() external {
uint a;
uint b;
uint c;
(a,b,c) = multipleReturns();
}

OR

(,,c) = multipleReturns();

### Function Declarations

function eatHamburgers(string memory \_name, uint \_amount) public {

}

> this function takes 2 parameters
> all reference types - arrays, strings, mappings, structs - require instructions about where it should be stored eg. memory

We would call this function thus:

eatHamburgers("Mal", 3);

- view: we're only viewing the data, not mdifying it.

  function sayHello() public view returns( string memory){}

- pure: we're not accessing any data in the app

  function \_multiply(uint \_a, uint \_b) private pure returns(uint){
  return a\*b;
  }

### Function Modifiers

A function modifier looks like a function except uses modifier instead of function

A modifier can't be called directly like a function. Instead we attach the modifiers name at the end of a function definition to change the function's behavior.

The most common way to use modifiers is to add a require check before a function executes.

This can be used maliciously, for the owner to have a backdoor.

Function modifiers can take arguments.

A function can pass it's arguments to it's modifier.

### Payable Modifier

This is a special type of function that can receive ether.

This makes it possible to call a function and pay money to the contract at the same time.

It allows payment to a contract to execute a function.

If a function is not marked payable and you try to send ether to it, the function will reject your transaction.

### Withdraws

Money sent to a contract is trapped there, unless you add a function to withdraw ether.

You cannot transfer ether to an address unless that address is of type payable.

You can use .transfer to send funds to any ethereum address.

### Internal Functions

\_functionName() internal{}

- it is convention to name internal functions with a preceeding underscore

## Structs

Structs are a way to define new types in Solidity. It is like creating new objects.

struct name {
// types_to_add
eg. uint256 favoriteNumber
}

## Array

An array is a way of storing a list of an object/ type

A dynamic array can change in size.

A fixed array has a specified fixed size.

data_type arrayName[size] = initialValue

We can add to an array by creating a function to do so:

function addPerson(string memory \_name, uint256 \_favoriteNumber) public {
my_array.push(name: \_name, favoriteNumber: \_favoriteNumber)
}

## Storage

## Events

Events are a way for your contract to communicate that something happened on the blockchain to your app front-end, which can be 'listening' for certain events and take action when they happen.
