(define (problem problem6)
    (:domain dungeon)

    (:objects 
        hero1 - hero
        room1_1 - room
        room1_2 - room
        room1_3 - room
        room1_4 - room
        room1_5 - room
        room2_1 - room
        room2_2 - room
        room2_3 - room
        room2_4 - room
        room2_5 - room
        room3_1 - room
        room3_2 - room
        room3_3 - room
        room3_4 - room
        room3_5 - room
        room4_1 - room
        room4_2 - room
        room4_3 - room
        room4_4 - room
        room4_5 - room
        sword1 sword2 sword3 sword4 - sword
        monster1 monster2 monster3 monster4 monster5 monster6 monster7 - monster
        trap1 trap2 trap3 trap4 trap5 trap6 - trap
        e1 e2 e3 e4 e5 e6 e7 e8 e9 e10 e11 e12 e13 - entity
    )

    (:init 
        (alive hero1)
        (in-room hero1 room4_5)
        
        ; creating all the entities
        (room-has-monster monster1 room1_3)
        (room-has-monster monster2 room1_4)
        (room-has-monster monster3 room2_2)
        (room-has-monster monster4 room3_2)
        (room-has-monster monster5 room3_4)
        (room-has-monster monster6 room4_2)
        (room-has-monster monster7 room4_4)
        
        (room-has-trap trap1 room1_2)
        (room-has-trap trap2 room2_1)
        (room-has-trap trap3 room2_4)
        (room-has-trap trap4 room2_5)
        (room-has-trap trap5 room3_3)
        (room-has-trap trap6 room4_1)

        (room-has-sword sword1 room1_5)
        (room-has-sword sword2 room2_3)
        (room-has-sword sword3 room3_1)
        (room-has-sword sword4 room4_3)
        
        (room-has-entity e1 room1_2)
        (room-has-entity e2 room1_3)
        (room-has-entity e3 room1_4)
        (room-has-entity e4 room2_1)
        (room-has-entity e5 room2_2)
        (room-has-entity e6 room2_4)
        (room-has-entity e7 room2_5)
        (room-has-entity e8 room3_2)
        (room-has-entity e9 room3_3)
        (room-has-entity e10 room3_4)
        (room-has-entity e11 room4_1)
        (room-has-entity e12 room4_2)
        (room-has-entity e13 room4_4)
        
        ; room connection code
        (connected room1_1 room1_2)
        (connected room1_1 room2_1)
        
        (connected room1_2 room1_1)
        (connected room1_2 room2_2)
        (connected room1_2 room1_3)
        
        (connected room1_3 room1_2)
        (connected room1_3 room2_3)
        (connected room1_3 room1_4)

        (connected room1_4 room1_3)
        (connected room1_4 room2_4)
        (connected room1_4 room1_5)

        (connected room1_5 room1_4)
        (connected room1_5 room2_5)
        
        (connected room2_1 room1_1)
        (connected room2_1 room3_1)
        (connected room2_1 room2_2)

        (connected room2_2 room2_1)
        (connected room2_2 room3_2)
        (connected room2_2 room1_2)
        (connected room2_2 room2_3)

        (connected room2_3 room2_2)
        (connected room2_3 room3_3)
        (connected room2_3 room1_3)
        (connected room2_3 room2_4)

        (connected room2_4 room2_3)
        (connected room2_4 room3_4)
        (connected room2_4 room1_4)
        (connected room2_4 room2_5)

        (connected room2_5 room2_4)
        (connected room2_5 room3_5)
        (connected room2_5 room1_5)

        (connected room3_1 room2_1)
        (connected room3_1 room4_1)
        (connected room3_1 room3_2)

        (connected room3_2 room3_1)
        (connected room3_2 room4_2)
        (connected room3_2 room2_2)
        (connected room3_2 room3_3)

        (connected room3_3 room3_2)
        (connected room3_3 room4_3)
        (connected room3_3 room2_3)
        (connected room3_3 room3_4)

        (connected room3_4 room3_3)
        (connected room3_4 room4_4)
        (connected room3_4 room2_4)
        (connected room3_4 room3_5)

        (connected room3_5 room3_4)
        (connected room3_5 room4_5)
        (connected room3_5 room2_5)

        (connected room4_1 room3_1)
        (connected room4_1 room4_2)

        (connected room4_2 room4_1)
        (connected room4_2 room3_2)
        (connected room4_2 room4_3)

        (connected room4_3 room4_2)
        (connected room4_3 room3_3)
        (connected room4_3 room4_4)

        (connected room4_4 room4_3)
        (connected room4_4 room3_4)
        (connected room4_4 room4_5)

        (connected room4_5 room4_4)
        (connected room4_5 room3_5)

    )

    (:goal (
        and 
            (alive hero1)
            (in-room hero1 room1_1)
        )
    )
)
