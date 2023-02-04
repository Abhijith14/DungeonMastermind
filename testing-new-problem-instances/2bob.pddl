(define (problem bob2)
    (:domain dungeon)

    (:objects 
        hero1 - hero
        hero2 - hero
        room1_1 - room
        room1_2 - room
        room1_3 - room
        room1_4 - room
        room1_5 - room
        room2_1 - room
        room2_2 - room
        room2_3 - room
        sword1 - sword
        monster1 monster2 - monster
        trap1 - trap
        e1 e2 e3 - entity
    )

    (:init 
        (alive hero1)
        (alive hero2)
        (in-room hero1 room1_5)
        (in-room hero2 room1_5)
        
        ; creating all the entities
        (room-has-monster monster1 room1_3)
        (room-has-monster monster2 room2_3)
        (room-has-trap trap1 room1_2)

        (room-has-sword sword1 room1_4)
        
        (room-has-entity e1 room1_3)
        (room-has-entity e2 room2_3)
        (room-has-entity e3 room1_2)
        
        ; room connection code
        (connected room1_1 room1_2)
        
        (connected room1_2 room1_1)
        (connected room1_2 room2_1)
        (connected room1_2 room1_3)
        
        (connected room1_3 room1_2)
        (connected room1_3 room2_2)
        (connected room1_3 room1_4)

        (connected room1_4 room1_3)
        (connected room1_4 room2_3)
        (connected room1_4 room1_5)

        (connected room1_5 room1_4)
        (connected room1_5 room2_3)
        
        (connected room2_1 room1_2)
        (connected room2_1 room2_2)
        
        (connected room2_2 room2_1)
        (connected room2_2 room1_3)
        (connected room2_2 room2_3)
        
        (connected room2_3 room2_2)
        (connected room2_3 room1_4)
        (connected room2_3 room1_5)
    )

    (:goal (
        and 
            (alive hero1)
            (alive hero2)
            (in-room hero1 room1_1)
            (in-room hero2 room1_1)
        )
    )
)
