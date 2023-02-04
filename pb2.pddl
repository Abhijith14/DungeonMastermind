(define (problem problem2)
    (:domain dungeon)

    (:objects 
        hero1 - hero
        room1_1 - room
        room1_2 - room
        room1_3 - room
        room2_1 - room
        room2_2 - room
        room2_3 - room
        sword1 - sword
        monster1 monster2 - monster
        e1 e2 - entity
    )

    (:init 
        (alive hero1)
        (in-room hero1 room1_2)
        
        ; creating all the entities
        (room-has-monster monster1 room1_1)
        (room-has-monster monster2 room2_2)
    
        (room-has-entity e1 room1_1)
        (room-has-entity e2 room2_2)
        
        (room-has-sword sword1 room2_3)    
        
        ; room connection code
        (connected room1_1 room1_2)
        (connected room1_1 room2_1)
        
        (connected room1_2 room1_1)
        (connected room1_2 room2_2)
        (connected room1_2 room1_3)
        
        (connected room1_3 room1_2)
        (connected room1_3 room2_3)
        
        (connected room2_1 room1_1)
        (connected room2_1 room2_2)
        
        (connected room2_2 room2_1)
        (connected room2_2 room1_2)
        (connected room2_2 room2_3)
        
        (connected room2_3 room2_2)
        (connected room2_3 room1_3)
       
    )

    (:goal (
        and 
            (alive hero1)
            (in-room hero1 room2_1)
        )
    )
)
