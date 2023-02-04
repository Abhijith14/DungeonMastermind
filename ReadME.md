# RPG Domain - Agent BOB
🔰: Classical Planning Assignment

<br>

## Introduction

This is the solution for my MSc AI CS551K – Software Agents and Multi-Agent Systems Assessment1.<br>
The course is taught by 

- [Prof. Felipe Meneguzzi](https://www.linkedin.com/in/felipemeneguzzi/) at University of Aberdeen, Aberdeen.
- [Prof. Rafael Cardoso](https://www.linkedin.com/in/rafael-cardoso-9718a76b/) at University of Aberdeen, Aberdeen.

Assigned on : 30th January 2023<br>
Due on : 6th February 2023<br>

Domain adapted from the [2016 The Fifth International Competition on Knowledge Engineering for Planning and Scheduling (ICKEPS)](https://helios.hud.ac.uk/scommv/ICKEPS/Scenarios.pdf), credits to [Dr. Lukas Chrpa](https://helios.hud.ac.uk/scomlc/) for the scenario.


Problem Repo : [https://github.com/pucrs-automated-planning/pddl-formalization](https://github.com/pucrs-automated-planning/pddl-formalization)

<br>

## Problem Statement
<hr>
In this assignment you will formalise *RPG* to help a hero to get out of a dungeon. 
The hero woke up in a dungeon full of monsters and traps (perhaps the party last night went wrong...) and needs your help to get out. 
Here are basic facts about the dungeon:

- The dungeon contains rooms that are connected by corridors (the dungeon can thus be represented by an undirected graph);
- Each room can either be empty, have a monster, a trap in it, or a sword in it (this is an exclusive or, so only one object per room); and
- One of the empty rooms is the “goal”: it has an exit, so the hero can escape;

The hero is lucky, since he has full knowledge about the dungeon's layout.  
He is not that lucky, though, because just after the hero leaves room s/he just visited, the room is destroyed and cannot be visited again. 

The hero can perform the following actions, but only if s/he is alive!

- The hero can move to an adjacent room (connected by a corridor) that has not been destroyed (i.e., the hero has not yet visited the room);
- The hero can Pickup the sword if it is present in the room the hero is currently in and the hero is empty handed;
- S/He can also destroy the sword the hero currently holds. However, this can have unpleasant effects if done in a room with a trap or a monster;
- Finally, the hero can disarm a trap, if there is a trap in the room the hero is in and the hero is empty-handed (does not hold a sword), then the hero can disarm it.

However, there are some (dangerous) constraints the hero has to consider:
- If the hero enters a room with a monster in it, s/he has to carry a sword (so the monster is afraid of him/her), otherwise the monster kills him/her. Notice that the hero is a pacifist, so s/he cannot kill the monster;
- If the hero destroys the sword in a room with a monster in it, the monster kills him/her as well;
- The only action the hero can safely perform in a room with a trap in it is the “disarm a trap” action. Any other action (even moving away) triggers the trap, which kills the hero.

Whenever we need to use automated tools to solve problems on our behalf, we must provide a consistent specification of the *transition system* of the underlying problem. 
If we specify the problem poorly, we jeopardise the planner software ability to generate valid responses, leading to false negatives and unnecessarily long waiting times for the planner at best, or incorrect plans at worse. 
Thus, specifying the RPG domain in PDDL gives you a chance to develop your skills in designing consistent transition systems, helping you avoid bugs in the software you will write in the future to handle all kinds of other processes.

Your assignment is to develop a domain file from the specification above, and then model the situations depicted in the images below as individual problem files.

<br>

### <b><u>Problem Instances</u></b>

<br>
The image below represents the problem instances that you need to model in PDDL, once you are done encoding your domain file. 
The text that accompanies each image is self-explanatory; remember, you must model corridors between rooms, rooms for the hero to move through, and you can only move between connected rooms and visit each room only **once**. 
We specify problems so that cells stand for rooms and edges between them represent corridors. 
“Init” is the hero's initial position, “Goal” is hero's desired goal position, “Sword” indicates a sword, “Monster” is a monster, and “Trap” stands for trap. 

### Problem 1

![Problem 1](https://raw.githubusercontent.com/pucrs-automated-planning/pddl-formalization/master/fig/RPG-pb1.png "Problem 1")
---

### Problem 2
![Problem 2](https://raw.githubusercontent.com/pucrs-automated-planning/pddl-formalization/master/fig/RPG-pb2.png "Problem 2")
--

### Problem 3
![Problem 3](https://raw.githubusercontent.com/pucrs-automated-planning/pddl-formalization/master/fig/RPG-pb3.png "Problem 3")

<br>

## Domain PDDL Modeling
<hr>

First, we need to model a PDDL domain file that solves the dungeon problem. The file [rpg.pddl](rpg.pddl) is our domain file. It contains the following:

- Requirements
    - strips : for representing the actions, preconditions and effects.
    - typing : for a typed representation for objects, predicates and actions.
    - negative-preconditions : problem can have actions with negative preconditions

- Types
    - *hero* : Agent BOB.
    - *monster* : a monster that can kill you if you dont have a sword.
    - *trap* : traps that has to be disarmed empty-handed.
    - *sword* : swords to scare the monsters.
    - *room* : rooms in the dungeon.
    - *entity* : An entity can be a monster or a trap. 

<br>

- Predicates
    - in-room
        - parameters : hero, room
        - if the hero is in the given room.
    - holding-sword 
        - parameters : hero, sword
        - if the hero holds the sword.
    - room-has-monster
        - parameters : monster, room
        - if the room has monster.
    - room-has-trap
        - parameters: trap, room
        - if the room has traps.
    - room-has-entity
        - parameters: entity, room
        - if the room is dangerours. ie; either the presence of monster or trap.
    - room-has-sword
        - parameters: sword, room
        - if the room has a sword.
    - room-visited
        - parameters: room
        - if the room is visited. (destroyed)
    - connected
        - parameters: 2 rooms
        - if the 2 rooms are connected.

<br>


- Actions
    1. move-no-entity : moves if there are no entities in the next room, if there are no traps in the current room(if there are, those will be disarmed).
    2. move-to-monster : moves if there exists a monster in the next room and if there is a monster, the agent should have a sword.
    3. move-to-trap : moves if there exists a trap in the next room and if there is a trap, the agent should not have a sword or the agent should destroy the sword that he/she holds. Also the current room should not have a trap.(If there is a trap, it should be disarmed)
    4. pickup-sword : picks up the sword if there is a sword in the current room and if the agent does not hold a sword.
    5. destroy-sword : destroys the sword if the agent holds a sword. This action can only be performed if the agent is in a room without an entity.(monster/trap)
    6. disarm-trap : disarms the trap if the agent is in a room with a trap and if the agent does not hold a sword.

All of these actions will only work if the agent is alive. Actions 1,2,3 are movement actions and they follow the general movement commands. (if roomB is not visited and if roomB is connected to roomA, then move to roomB and mark roomA as visited).

<br>

## Problem PDDL Modeling
<hr>

Now we need to model three PDDL problem files each representing problems given in the problem-instance. The files [pb1.pddl](pb1.pddl), [pb2.pddl](pb2.pddl) and [pb3.pddl](pb3.pddl) are our problem files. All the 3 are tested and verified to show the correct visualization of the dungeons layout. The position of the hero, monsters, traps and swords are declared and the room connections are also declared. Along with monsters and traps, entities are declared as well.

The goal is to reach the goalroom without getting killed.

<br>

## Plans Output
<hr>

The plans are outputted in the [pb1.txt](pb1.txt), [pb2.txt](pb2.txt) and [pb3.txt](pb3.txt) files. The hero is able to reach the goalroom without getting killed in all the 3 cases.


To run the pddl files, go to the [PDDL Editor](http://editor.planning.domains), select Session -> Load and type the SessionID : ```e26zh1Po9r``` or click on this [link](http://editor.planning.domains/#read_session=e26zh1Po9r). Then select Solve -> Select rpg.pddl as domain file and select the necessary problem file. The planner should plot a plan and will be outputted.

<br>


## Experimentation

<hr>

Apart from the 3 problem instances, I have also tested the planner with a few more problem instances taken from the [ICKEPS 2016: RPG Scenario by Lukas Chrpa](https://helios.hud.ac.uk/scommv/ICKEPS/Scenarios.pdf). The problem instances are given in the [testing-new-problem-instances](testing-new-problem-instances) folder. Domain pddl is the same. The plans are verified to be correct. The hero is able to reach the goalroom without getting killed in all the cases. I also changed the planner to use the Incremental Weighted A* search instead of A* algorithm with blind() . IW was able to find the plans much faster than Blind search. Details of each plan are given in the txt files.

Some modifications to the problem was to try out multiple heroes or reach goal state with a sword or reach the goal disarming all traps etc...

<br>

## Conclusion

<hr>

Encoding a planning domain in PDDL can be a challenging task, but it provides a powerful tool for solving complex problems. My experience with the dungeon game was very interesting. I encountered with various obstacles, learning about how the agent bob reacts to each path. This inspired me to create the perfect agent that can solve the Dungeon room problem.

In Conclusion, encoding a planning domain requires careful consideration of the problem and a clear understanding of the limitations of the planner. However, the effort put into formalzing the domain pays off in the ability to automatically find solution to complex problems.


<br>

## Authors
<hr>

- **ABHIJITH UDAYAKUMAR** - [Github/Abhijith14](https://github.com/Abhijith14)

