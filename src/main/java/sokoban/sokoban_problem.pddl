(define (problem sokoban)
  (:domain sokoban_domain)
  (:objects
 loc0_0 - location
 loc0_1 - location
 loc0_2 - location
 wall0_2 - wall
 loc0_3 - location
 wall0_3 - wall
 loc0_4 - location
 wall0_4 - wall
 loc0_5 - location
 wall0_5 - wall
 loc1_0 - location
 loc1_1 - location
 loc1_2 - location
 wall1_2 - wall
 loc1_3 - location
 loc1_4 - location
 loc1_5 - location
 wall1_5 - wall
 loc2_0 - location
 loc2_1 - location
 wall2_1 - wall
 loc2_2 - location
 wall2_2 - wall
 loc2_3 - location
 loc2_4 - location
 loc2_5 - location
 wall2_5 - wall
 loc3_0 - location
 wall3_0 - wall
 loc3_1 - location
 wall3_1 - wall
 loc3_2 - location
 loc3_3 - location
 loc3_4 - location
 loc3_5 - location
 wall3_5 - wall
 loc3_6 - location
 wall3_6 - wall
 loc3_7 - location
 wall3_7 - wall
 loc4_0 - location
 wall4_0 - wall
 loc4_1 - location
 loc4_2 - location
 box4_2 - box
 loc4_3 - location
 loc4_4 - location
 box4_4 - box
 loc4_5 - location
 loc4_6 - location
 loc4_7 - location
 wall4_7 - wall
 loc5_0 - location
 wall5_0 - wall
 loc5_1 - location
 loc5_2 - location
 loc5_3 - location
 box5_3 - box
 loc5_4 - location
 loc5_5 - location
 box5_5 - box
 loc5_6 - location
 loc5_7 - location
 wall5_7 - wall
 loc6_0 - location
 wall6_0 - wall
 loc6_1 - location
 wall6_1 - wall
 loc6_2 - location
 loc6_3 - location
 wall6_3 - wall
 loc6_4 - location
 agent - agent
 loc6_5 - location
 wall6_5 - wall
 loc6_6 - location
 wall6_6 - wall
 loc6_7 - location
 wall6_7 - wall
 loc7_0 - location
 loc7_1 - location
 wall7_1 - wall
 loc7_2 - location
 loc7_3 - location
 loc7_4 - location
 loc7_5 - location
 wall7_5 - wall
 loc8_0 - location
 loc8_1 - location
 wall8_1 - wall
 loc8_2 - location
 wall8_2 - wall
 loc8_3 - location
 wall8_3 - wall
 loc8_4 - location
 wall8_4 - wall
 loc8_5 - location
 wall8_5 - wall
  )
  (:init
(empty loc0_0) 
(empty loc0_1) 
(rightTo loc0_1 loc0_0 ) 
(at wall0_2 loc0_2 ) 
(rightTo loc0_2 loc0_1 ) 
(at wall0_3 loc0_3 ) 
(rightTo loc0_3 loc0_2 ) 
(at wall0_4 loc0_4 ) 
(rightTo loc0_4 loc0_3 ) 
(at wall0_5 loc0_5 ) 
(rightTo loc0_5 loc0_4 ) 
(empty loc1_0) 
(under loc1_0 loc0_0 ) 
(empty loc1_1) 
(under loc1_1 loc0_1 ) 
(rightTo loc1_1 loc1_0 ) 
(at wall1_2 loc1_2 ) 
(under loc1_2 loc0_2 ) 
(rightTo loc1_2 loc1_1 ) 
(empty loc1_3) 
(under loc1_3 loc0_3 ) 
(rightTo loc1_3 loc1_2 ) 
(empty loc1_4) 
(under loc1_4 loc0_4 ) 
(rightTo loc1_4 loc1_3 ) 
(at wall1_5 loc1_5 ) 
(under loc1_5 loc0_5 ) 
(rightTo loc1_5 loc1_4 ) 
(empty loc2_0) 
(under loc2_0 loc1_0 ) 
(at wall2_1 loc2_1 ) 
(under loc2_1 loc1_1 ) 
(rightTo loc2_1 loc2_0 ) 
(at wall2_2 loc2_2 ) 
(under loc2_2 loc1_2 ) 
(rightTo loc2_2 loc2_1 ) 
(empty loc2_3) 
(under loc2_3 loc1_3 ) 
(rightTo loc2_3 loc2_2 ) 
(empty loc2_4) 
(under loc2_4 loc1_4 ) 
(rightTo loc2_4 loc2_3 ) 
(at wall2_5 loc2_5 ) 
(under loc2_5 loc1_5 ) 
(rightTo loc2_5 loc2_4 ) 
(at wall3_0 loc3_0 ) 
(under loc3_0 loc2_0 ) 
(at wall3_1 loc3_1 ) 
(under loc3_1 loc2_1 ) 
(rightTo loc3_1 loc3_0 ) 
(empty loc3_2) 
(under loc3_2 loc2_2 ) 
(rightTo loc3_2 loc3_1 ) 
(is_destination loc3_3 ) 
(empty loc3_3 ) 
(under loc3_3 loc2_3 ) 
(rightTo loc3_3 loc3_2 ) 
(empty loc3_4) 
(under loc3_4 loc2_4 ) 
(rightTo loc3_4 loc3_3 ) 
(at wall3_5 loc3_5 ) 
(under loc3_5 loc2_5 ) 
(rightTo loc3_5 loc3_4 ) 
(at wall3_6 loc3_6 ) 
(rightTo loc3_6 loc3_5 ) 
(at wall3_7 loc3_7 ) 
(rightTo loc3_7 loc3_6 ) 
(at wall4_0 loc4_0 ) 
(under loc4_0 loc3_0 ) 
(empty loc4_1) 
(under loc4_1 loc3_1 ) 
(rightTo loc4_1 loc4_0 ) 
(at box4_2 loc4_2 ) 
(under loc4_2 loc3_2 ) 
(rightTo loc4_2 loc4_1 ) 
(is_destination loc4_3 ) 
(empty loc4_3 ) 
(under loc4_3 loc3_3 ) 
(rightTo loc4_3 loc4_2 ) 
(at box4_4 loc4_4 ) 
(under loc4_4 loc3_4 ) 
(rightTo loc4_4 loc4_3 ) 
(is_destination loc4_5 ) 
(empty loc4_5 ) 
(under loc4_5 loc3_5 ) 
(rightTo loc4_5 loc4_4 ) 
(empty loc4_6) 
(under loc4_6 loc3_6 ) 
(rightTo loc4_6 loc4_5 ) 
(at wall4_7 loc4_7 ) 
(under loc4_7 loc3_7 ) 
(rightTo loc4_7 loc4_6 ) 
(at wall5_0 loc5_0 ) 
(under loc5_0 loc4_0 ) 
(empty loc5_1) 
(under loc5_1 loc4_1 ) 
(rightTo loc5_1 loc5_0 ) 
(empty loc5_2) 
(under loc5_2 loc4_2 ) 
(rightTo loc5_2 loc5_1 ) 
(at box5_3 loc5_3 ) 
(is_destination loc5_3 ) 
(wellPlaced box5_3 ) 
(under loc5_3 loc4_3 ) 
(rightTo loc5_3 loc5_2 ) 
(empty loc5_4) 
(under loc5_4 loc4_4 ) 
(rightTo loc5_4 loc5_3 ) 
(at box5_5 loc5_5 ) 
(under loc5_5 loc4_5 ) 
(rightTo loc5_5 loc5_4 ) 
(empty loc5_6) 
(under loc5_6 loc4_6 ) 
(rightTo loc5_6 loc5_5 ) 
(at wall5_7 loc5_7 ) 
(under loc5_7 loc4_7 ) 
(rightTo loc5_7 loc5_6 ) 
(at wall6_0 loc6_0 ) 
(under loc6_0 loc5_0 ) 
(at wall6_1 loc6_1 ) 
(under loc6_1 loc5_1 ) 
(rightTo loc6_1 loc6_0 ) 
(empty loc6_2) 
(under loc6_2 loc5_2 ) 
(rightTo loc6_2 loc6_1 ) 
(at wall6_3 loc6_3 ) 
(under loc6_3 loc5_3 ) 
(rightTo loc6_3 loc6_2 ) 
(at agent loc6_4 ) 
(under loc6_4 loc5_4 ) 
(rightTo loc6_4 loc6_3 ) 
(at wall6_5 loc6_5 ) 
(under loc6_5 loc5_5 ) 
(rightTo loc6_5 loc6_4 ) 
(at wall6_6 loc6_6 ) 
(under loc6_6 loc5_6 ) 
(rightTo loc6_6 loc6_5 ) 
(at wall6_7 loc6_7 ) 
(under loc6_7 loc5_7 ) 
(rightTo loc6_7 loc6_6 ) 
(empty loc7_0) 
(under loc7_0 loc6_0 ) 
(at wall7_1 loc7_1 ) 
(under loc7_1 loc6_1 ) 
(rightTo loc7_1 loc7_0 ) 
(empty loc7_2) 
(under loc7_2 loc6_2 ) 
(rightTo loc7_2 loc7_1 ) 
(empty loc7_3) 
(under loc7_3 loc6_3 ) 
(rightTo loc7_3 loc7_2 ) 
(empty loc7_4) 
(under loc7_4 loc6_4 ) 
(rightTo loc7_4 loc7_3 ) 
(at wall7_5 loc7_5 ) 
(under loc7_5 loc6_5 ) 
(rightTo loc7_5 loc7_4 ) 
(empty loc8_0) 
(under loc8_0 loc7_0 ) 
(at wall8_1 loc8_1 ) 
(under loc8_1 loc7_1 ) 
(rightTo loc8_1 loc8_0 ) 
(at wall8_2 loc8_2 ) 
(under loc8_2 loc7_2 ) 
(rightTo loc8_2 loc8_1 ) 
(at wall8_3 loc8_3 ) 
(under loc8_3 loc7_3 ) 
(rightTo loc8_3 loc8_2 ) 
(at wall8_4 loc8_4 ) 
(under loc8_4 loc7_4 ) 
(rightTo loc8_4 loc8_3 ) 
(at wall8_5 loc8_5 ) 
(under loc8_5 loc7_5 ) 
(rightTo loc8_5 loc8_4 ) 
  )
  (:goal 
    (forall (?b - box) 
    (wellPlaced ?b) )
  ))
