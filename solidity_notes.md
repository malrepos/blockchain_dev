# Solidity Notes

### Define the Compiler Version

### Contract

- similar to a class in Python
  contract nameOfClass {}

All solidity code is encapsulated in contracts. All variables and functions belong to a contract.

## Solidity Types

### Integers

### bool

### string

### address

### bytes32

Use // to make comments in Solidity.

## Functions

A function will execute a task.

function name(variable_type variable_name) visibility {
code block
}

Any function call is also a transaction on the blockchain.

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
