# Homework 1

Discuss in your teams what a decentralised version of a game like monopoly would be like,
if there was no software on a central server.

### Consider

What are the essential pieces of functionality ?
How would people cheat ?
How could you prevent them from cheating ?

This is just a general discussion, there is no need to write any code or do any detailed
design.

# Solution

#### The essential pieces of Functionality are:
* Players to be able to get paid every time they pass Go
* Be able to choose to buy or not land and choose to build or not assets on the land, provided they have what it needs.
* Random move for each player on its turn.
* Valid transactions between players or between player and banks

#### People could cheat by:
* Not making correct transactions with the system
* changing the number that they move
* Banker to pay less or more certain people each time they pass Go

#### How to prevent people from cheating:
* Create a smart contract to pay players a fixed amount each time they pass Go
* Create a random move contract
* Each transaction to be validated by the majority of the players
