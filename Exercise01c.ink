/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 * Variable types: integer, float, boolean
 * Variable assignment
 * Printing variables
 * Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something


Variable Checking!

Equality: "Spot" == "Spot"
Not equality: 1 != 2
Greater: >
Less: <
Great or equal: >=
Less or equal: <=



*/

VAR health = 5
VAR pet_name = ""
VAR torches = 0
VAR coins = 0
VAR key = 0


-> memory

== memory ==
Before you stands the cavern of Josh. You wish your childhood pet was with you now. The cave might be less intimidating then. What was your pet's name?

* [Charlie]
    ~ pet_name = "Charlie"
    -> cave_mouth
* [Susan]
    ~ pet_name = "Susan"
    -> cave_mouth
* [Spot]
    ~ pet_name = "Spot"
    -> cave_mouth

== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

You made it to the cave. If only {pet_name} could see you now!

You have {torches} torches

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west

{pet_name == "Spot": Scout would love it here in the west| }

+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
You are in the east tunnel. At the end of the tunnel is an entrance leading deeper into the cave. 

{coins == 0 : The light of your torch glints off of the thousands of coins in the room.|}
* {coins == 0} [Pick up coins] -> coin_pickup
+ [Go through the entrance] -> new_room
-> END

== coin_pickup ==
~ coins = coins + 100
You pick up as many coins as you can carry. You stuff 100 gold coins in your pocket.
+ [Go Back] -> east_tunnel_lit
->END

== new_room ==
You are in a deep part of the cavern, ahead of you are two doors.
+ [Go through the right door]->right_door
+ [Go through the left door]->left_door
+ [Go Back] -> east_tunnel_lit
->END

== right_door ==
You are in a small room--completely empty except for a small chest.
+ [Open chest] -> open_chest
+[Go Back] -> new_room
->END

== left_door ==
You are in a large, well-lit room. A small, strangley humanoid creature has made its home here. You notice a ring of golden keys in its hand.
+ {key==0} [Ask for key]->key_ask
+ {coins >= 50} [Trade coins for key]->trade
+[Go Back]-> new_room
-> END

==open_chest==
The chest is locked.
*{key>=1} [Use key] -> key_chest
+[Go Back]-> right_door
->END

==key_chest==
You open the chest, finding many sparkling gems inside.
->END

==key_ask==
Do you really think I'll give you this key for free? Offer me something in exchange for it!
+ [Sorry...]->left_door
-> END

==trade==
~ coins = coins-80
~ key = key+1
The creature takes 80 of your coins, you now have {coins} coins. You have obtained a key.
+[Go Back]-> left_door




