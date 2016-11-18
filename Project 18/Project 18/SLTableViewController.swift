//
//  SLTableViewController.swift
//  Project 18
//
//  Created by Santos on 14/11/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

class SLTableViewController: UITableViewController {

//    let heroes : [String: [String]] =
//        ["A": ["Anti-Mage", "Axe", "Ancient Apparition", "Alchemist", "Abaddon", "Arc Warden"],
//         "B": ["Bane", "Bloodseeker", "Beastmaster", "Broodmother", "Bounty Hunter", "Batrider", "Brewmaster", "Bristleback"],
//         "C": ["Crystal Maiden", "Clockwerk", "Clinkz", "Chen", "Chaos Knight", "Centaur Warrunner"],
//         "D": ["Drow Ranger", "Death Prophet", "Dragon Knight", "Dazzle", "Dark Seer", "Doom", "Disruptor"],
//         "E": ["Earthshaker", "Enigma", "Enchantress", "Elder Titan", "Ember Spirit", "Earth Spirit"],
//         "F": ["Faceless Void"],
//         "G": ["Gyrocopter"],
//         "H": ["Huskar"],
//         "I": ["Invoker", "Io"],
//         "J": ["Juggernaut", "Jakiro"],
//         "K": ["Kunkka", "Keeper of the Light"],
//         "L": ["Lina", "Lich", "Lion", "Luna", "Leshrac", "Lifestealer", "Lycan", "Lone Druid", "Legion Commander"],
//         "M": ["Mirana", "Morphling", "Meepo", "Medusa", "Magnus"],
//         "N": ["Necrophos", "Nature", "Night Stalker", "Nyx Assassin", "Naga Siren"],
//         "O": ["Omniknight", "Outworld Devourer", "Ogre Magi", "Oracle"],
//         "P": ["Phantom Lancer", "Puck", "Pudge", "Phantom Assassin", "Pugna", "Phoenix"],
//         "Q": ["Queen of Pain"],
//         "R": ["Razor", "Riki", "Rubick"],
//         "S": ["Shadow Fiend", "Sand King", "Storm Spirit", "Sven", "Shadow Shaman", "Slardar", "Sniper", "Spectre", "Spirit Breaker", "Silencer", "Shadow Demon", "Slark", "Skywrath Mage"],
//         "T": ["Tiny", "Tidehunter", "Tinker", "Templar Assassin", "Treant Protector", "Troll Warlord", "Timbersaw", "Tusk", "Terrorblade", "Techies"],
//         "U": ["Ursa", "Undying"],
//         "V": ["Vengeful Spirit", "Venomancer", "Viper", "Visage"],
//         "W": ["Windranger", "Witch Doctor", "Warlock", "Wraith King", "Weaver", "Winter Wyvern"],
//         "Z": ["Zeus"],
//         ]
//
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationItem.title = "Dota2 Heros"
        
        //init hero list
        self.initHeroList()
        
        //修改navigationBar颜色
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.00, green:0.56, blue:0.96, alpha:1.00)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        //添加按钮
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .camera, target: nil, action: nil)

        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: nil, action: nil)
    }
    
    func initHeroList() {
        //add 6 hero
        let hero_1 : SLHero = SLHero(name: "Anti-Mage", type: "Agility")
        let hero_2 : SLHero = SLHero(name: "Axe", type: "Strength")
        let hero_3 : SLHero = SLHero(name: "Ancient Apparition", type: "Intelligence")
        let hero_4 : SLHero = SLHero(name: "Dragon Knight", type: "Strength")
        let hero_5 : SLHero = SLHero(name: "Huskar", type: "Strength")
        let hero_6 : SLHero = SLHero(name: "Zeus", type: "Intelligence")
        
        SLHeroManger.sharedInstance.addHero(hero_1)
        SLHeroManger.sharedInstance.addHero(hero_2)
        SLHeroManger.sharedInstance.addHero(hero_3)
        SLHeroManger.sharedInstance.addHero(hero_4)
        SLHeroManger.sharedInstance.addHero(hero_5)
        SLHeroManger.sharedInstance.addHero(hero_6)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SLHeroManger.sharedInstance.HeroList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = SLHeroManger.sharedInstance.HeroList[indexPath.row].name
        let image = UIImage(named: SLHeroManger.sharedInstance.HeroList[indexPath.row].name! + ".png")
        cell.imageView?.image = image
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "HEROS"
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    

     // MARK: - Navigation
    
    let heroDetailSegueIdentifier = "showHeroDetailSegue"
    
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        if segue.identifier == heroDetailSegueIdentifier, let destination = segue.destination as? SLHeroDetailViewController, let heroIndex = tableView.indexPathForSelectedRow?.row {
            destination.heroName = SLHeroManger.sharedInstance.HeroList[heroIndex].name!
        }
        
     }


}
