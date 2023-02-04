(define (problem problem5)
    (:domain dungeon)

    (:objects 
        hero1 - hero
        room1_1 - room
        room1_2 - room
        room1_3 - room
        room1_4 - room
        room1_5 - room
        room1_6 - room
        room1_7 - room
        room2_1 - room
        room2_2 - room
        room2_3 - room
        room2_4 - room
        room2_5 - room
        sword1 sword2 - sword
        monster1 monster2 monster3 - monster
        trap1 trap2 trap3 trap4 trap5 - trap
        e1 e2 e3 e4 e5 e6 e7 e8 - entity
    )

    (:init 
        (alive hero1)
        (in-room hero1 room1_7)
        
        ; creating all the entities
        (room-has-monster monster1 room1_4)
        (room-has-monster monster2 room1_5)
        (room-has-monster monster3 room2_2)


        (room-has-trap trap1 room1_2)
        (room-has-trap trap2 room1_3)
        (room-has-trap trap3 room2_4)
        (room-has-trap trap4 room2_5)
        (room-has-trap trap5 room2_1)

        (room-has-sword sword1 room1_6)
        (room-has-sword sword2 room2_3)
        
        (room-has-entity e1 room1_2)
        (room-has-entity e2 room1_3)
        (room-has-entity e3 room1_4)
        (room-has-entity e4 room1_5)
        (room-has-entity e5 room2_1)
        (room-has-entity e6 room2_2)
        (room-has-entity e7 room2_4)
        (room-has-entity e8 room2_5)
        
        ; room connection code
        (connected room1_1 room1_2)
        (connected room1_1 room2_1)
        
        (connected room1_2 room1_1)
        (connected room1_2 room1_3)
        (connected room1_2 room2_2)
        
        (connected room1_3 room1_2)
        (connected room1_3 room1_4)
        (connected room1_3 room2_1)
        (connected room1_3 room2_3)

        (connected room1_4 room1_3)
        (connected room1_4 room1_5)
        (connected room1_4 room2_2)
        (connected room1_4 room2_4)

        (connected room1_5 room1_4)
        (connected room1_5 room1_6)
        (connected room1_5 room2_3)
        (connected room1_5 room2_5)

        (connected room1_6 room1_5)
        (connected room1_6 room1_7)
        (connected room1_6 room2_4)

        (connected room1_7 room1_6)
        (connected room1_7 room2_5)

        
        (connected room2_1 room1_1)
        (connected room2_1 room2_2)
        (connected room2_1 room1_3)

        (connected room2_2 room2_1)
        (connected room2_2 room2_3)
        (connected room2_2 room1_2)
        (connected room2_2 room1_4)

        (connected room2_3 room2_2)
        (connected room2_3 room2_4)
        (connected room2_3 room1_3)
        (connected room2_3 room1_5)

        (connected room2_4 room2_3)
        (connected room2_4 room2_5)
        (connected room2_4 room1_4)
        (connected room2_4 room1_6)

        (connected room2_5 room2_4)
        (connected room2_5 room1_5)
        (connected room2_5 room1_7)
    )

    (:goal (
        and 
            (alive hero1)
            (in-room hero1 room1_1)
        )
    )
)
