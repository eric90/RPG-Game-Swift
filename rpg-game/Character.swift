//
//  Character.swift
//  rpg-game
//
//  Created by Fakhourian, Eric on 6/30/16.
//  Copyright © 2016 Fakhourian, Eric. All rights reserved.
//

import Foundation

class Character {
    private var _hp: Int = 100
    private var _attackpwr: Int = 10
    
    var attackPwr: Int {
        get {
            return _attackpwr
        }
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(startingHp: Int, attackPwr: Int){
        self._hp = startingHp
        self._attackpwr = attackPwr
    }
    
    func attemptAttach(attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        
        return true
    }
    
    
}