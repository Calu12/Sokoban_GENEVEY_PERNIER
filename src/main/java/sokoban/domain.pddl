(define (domain sokoban_domain)
    (:requirements :strips :adl)
    (:types
        box wall agent location - object ; Tous les types héritent de l'objet
    )

    (:predicates
        (at ?o - object ?l - location) ; Un objet est à une certaine localisation
        (under ?l1 - location ?l2 - location) 
        (rightTo ?l1 - location ?l2 - location)
        (is_destination ?l - location) ; Une localisation est une destination
        (wellPlaced ?b - box) 
        (empty ?l - location)
    )

    (:action U
        :parameters (?a - agent ?from - location ?to - location)
        :precondition (and
            (at ?a ?from)
            (under ?from ?to)
            (empty ?to) ; Ne pas aller sur un autre objet
        )
        :effect (and
            (not (at ?a ?from)) 
            (empty ?from)
            (not (empty ?to))
            (at ?a ?to)
        )
    )

    (:action D
        :parameters (?a - agent ?from - location ?to - location)
        :precondition (and
            (at ?a ?from)
            (under ?to ?from)
            (empty ?to) ; Ne pas aller sur un autre objet
        )
        :effect (and
            (not (at ?a ?from)) 
            (empty ?from)
            (not (empty ?to))
            (at ?a ?to)
        )
    )

    (:action L
        :parameters (?a - agent ?from - location ?to - location)
        :precondition (and
            (at ?a ?from)
            (rightTo ?from ?to)
            (empty ?to) ; Ne pas aller sur un autre objet
        )
        :effect (and
            (not (at ?a ?from)) 
            (empty ?from)
            (not (empty ?to))
            (at ?a ?to)
        )
    )

    (:action R
        :parameters (?a - agent ?from - location ?to - location)
        :precondition (and
            (at ?a ?from)
            (rightTo ?to ?from)
            (empty ?to) ; Ne pas aller sur un autre objet
        )
        :effect (and
            (not (at ?a ?from)) 
            (empty ?from)
            (not (empty ?to))
            (at ?a ?to)
        )
    )

(:action Upush
        :parameters (?a - agent ?b - box ?la ?from ?to - location)
        :precondition (and
            (at ?b ?from)
            (at ?a ?la)
            (empty ?to)
            (under ?from ?to)
            (under ?la ?from)
        )
        :effect (and
            (not (at ?a ?la)) 
            (not (at ?b ?from)) 
            (not (empty ?to)) 
            (empty ?la) 
            (at ?a ?from) 
            (at ?b ?to) 
            (when (is_destination ?to) (wellPlaced ?b) ) 
            (when (not (is_destination ?to)) (not (wellPlaced ?b)))
        )
    )

    (:action Dpush
        :parameters (?a - agent ?b - box ?la ?from ?to - location)
        :precondition (and
            (at ?b ?from)
            (at ?a ?la)
            (empty ?to)
            (under ?from ?la)
            (under ?to ?from)
        )
        :effect (and
            (not (at ?a ?la)) 
            (not (at ?b ?from)) 
            (not (empty ?to)) 
            (empty ?la) 
            (at ?a ?from) 
            (at ?b ?to) 
            (when (is_destination ?to) (wellPlaced ?b) ) 
            (when (not (is_destination ?to)) (not (wellPlaced ?b)))
        )
    )

    (:action Lpush
        :parameters (?a - agent ?b - box ?la ?from ?to - location)
        :precondition (and
            (at ?b ?from)
            (at ?a ?la)
            (empty ?to)
            (rightTo ?from ?to)
            (rightTo ?la ?from)
        )
        :effect (and
            (not (at ?a ?la)) 
            (not (at ?b ?from)) 
            (not (empty ?to)) 
            (empty ?la) 
            (at ?a ?from) 
            (at ?b ?to) 
            (when (is_destination ?to) (wellPlaced ?b) ) 
            (when (not (is_destination ?to)) (not (wellPlaced ?b)))
        )
    )

    (:action Rpush
        :parameters (?a - agent ?b - box ?la ?from ?to - location)
        :precondition (and
            (at ?b ?from)
            (at ?a ?la)
            (empty ?to)
            (rightTo ?to ?from)
            (rightTo ?from ?la)
        )
        :effect (and
            (not (at ?a ?la)) 
            (not (at ?b ?from)) 
            (not (empty ?to)) 
            (empty ?la) 
            (at ?a ?from) 
            (at ?b ?to) 
            (when (is_destination ?to) (wellPlaced ?b) ) 
            (when (not (is_destination ?to)) (not (wellPlaced ?b)))
        )
    )

    
)
