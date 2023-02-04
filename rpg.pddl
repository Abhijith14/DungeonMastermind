(define (domain dungeon)
    (:requirements :strips :typing :negative-preconditions)

    (:types 
         hero - object
         room - object
         sword - object
         monster - object
         trap - object
         entity - object
    )

  (:predicates (alive ?h - hero)
        (in-room ?h - hero ?r - room)
        (holding-sword ?h - hero ?s - sword)
        (room-has-monster ?m - monster ?r - room)
        (room-has-trap ?t - trap ?r - room)
        (room-has-entity ?e - entity ?r - room)
        (room-has-sword ?s - sword ?r - room)
        (room-visited ?r - room)
        (connected ?r1 - room ?r2 - room)
    )

    
    (:action move-no-entity
        :parameters (
            ?h - hero 
            ?r1 - room 
            ?r2 - room
        )
        :precondition (
            and 
                (in-room ?h ?r1)
                (not (room-visited ?r2))
                (not (exists (?t - trap) (room-has-trap ?t ?r1)))
                (connected ?r1 ?r2)
                (not (exists (?e - entity) (room-has-entity ?e ?r2)))
                (alive ?h)
        )
        :effect (  
            and 
                (not (in-room ?h ?r1))
                (in-room ?h ?r2)
                (room-visited ?r1)
        )
    )
    

    (:action move-to-monster
        :parameters (
            ?h - hero 
            ?r1 - room 
            ?r2 - room
        )
        :precondition (
            and 
                (in-room ?h ?r1) 
                (connected ?r1 ?r2) 
                (not (room-visited ?r2))
                (exists (?m - monster) (and (room-has-monster ?m ?r2) (exists (?x - sword) (holding-sword ?h ?x))))
                (alive ?h)
        )
        :effect (
            and 
                (not (in-room ?h ?r1))
                (in-room ?h ?r2)
                (room-visited ?r1)
        )
    )
    
    
    (:action move-to-trap
        :parameters (
            ?h - hero 
            ?r1 - room 
            ?r2 - room
        )
        :precondition (
            and 
                (in-room ?h ?r1) 
                (connected ?r1 ?r2) 
                (not (room-visited ?r2))
                (not (exists (?t - trap) (room-has-trap ?t ?r1)))
                (exists (?t - trap) (and (room-has-trap ?t ?r2) (not (exists (?s - sword) (holding-sword ?h ?s)))))
                (alive ?h)
        )
        :effect (
            and 
                (not (in-room ?h ?r1))
                (in-room ?h ?r2)
                (room-visited ?r1)
        )
    )
    
      
    (:action pickup-sword
        :parameters (
            ?h - hero 
            ?s - sword 
            ?r - room
        )
        :precondition (
            and 
                (in-room ?h ?r) 
                (room-has-sword ?s ?r) 
                (not (exists (?x - sword) (holding-sword ?h ?x)))
                (alive ?h)
        )
        :effect (
            holding-sword ?h ?s
        )
    )
    
    
    (:action destroy-sword
        :parameters (
            ?h - hero 
            ?s - sword 
            ?r - room
        )
        :precondition (
            and 
                (in-room ?h ?r) 
                (holding-sword ?h ?s) 
                (not (exists (?e - entity) (room-has-entity ?e ?r)))
                (alive ?h)
        )
        :effect (
            not(holding-sword ?h ?s)
        )
    )
    
    
    (:action disarm-trap
        :parameters (
            ?h - hero 
            ?t - trap 
            ?r - room
        )
        :precondition (
            and 
                (in-room ?h ?r) 
                (room-has-trap ?t ?r)
                (not (exists (?s - sword) (holding-sword ?h ?s)))
                (alive ?h) 
        )
        :effect (
            not (room-has-trap ?t ?r)
        ) 
    )

)