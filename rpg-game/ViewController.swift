//
//  ViewController.swift
//  rpg-game
//
//  Created by Fakhourian, Eric on 6/30/16.
//  Copyright © 2016 Fakhourian, Eric. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var printLbl: UILabel!

    @IBOutlet weak var playerHpLbl: UILabel!
    
    @IBOutlet weak var enemyHpLbl: UILabel!
    
    @IBOutlet weak var enemyImage: UIImageView!
    
    @IBOutlet weak var chestBtn: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    
    var chestMessage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        player = Player(name: "Eric", hp: 110, attackPwr: 20)
        
        generateEnemy( )
        
        playerHpLbl.text = "\(player.hp) HP"
    }
    
    func generateEnemy( ) {
        let rand = Int(arc4random_uniform(2))
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
        }else {
            enemy = DevilWizard(startingHp: 60, attackPwr: 15)
        }
        
        enemyImage.hidden = false
    }

    
    @IBAction func onChestTapped(sender: AnyObject) {
        chestBtn.hidden = true
        printLbl.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateEnemy", userInfo: nil, repeats: false)
        
    }
    
    @IBAction func attackTapped(sender: AnyObject) {
        if enemy.attemptAttach(player.attackPwr){
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHpLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attached was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot( ) {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestBtn.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHpLbl.text = ""
            printLbl.text = "Killed \(enemy.type)"
            enemyImage.hidden = true
        }
    }
}


