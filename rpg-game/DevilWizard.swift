//
//  DevilWizard.swift
//  rpg-game
//
//  Created by Fakhourian, Eric on 6/30/16.
//  Copyright © 2016 Fakhourian, Eric. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    override var loot: [String] {
        return ["Magiv Wand", "Dark Amulet ", "Salted Pork "]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
    
    
}