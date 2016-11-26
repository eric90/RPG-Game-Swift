//
//  Kimara.swift
//  rpg-game
//
//  Created by Fakhourian, Eric on 6/30/16.
//  Copyright © 2016 Fakhourian, Eric. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    
    let IMMUNE_MAX = 15
    
    override var loot: [String] {
         return ["Tough Hide ", " Kimara Venom", " Rare Trident"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttach(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAttach(attackPwr)
        } else {
            return false
        }
    }
}