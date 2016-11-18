//
//  SLHeroDetailViewController.swift
//  Project 18
//
//  Created by Santos on 18/11/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

class SLHeroDetailViewController: UIViewController {
    
    var heroName = String()

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroTypeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heroNameLabel.text = heroName
        heroTypeLabel.text = SLHeroManger.sharedInstance.getHeroByName(heroName)?.type
        heroImage.image = UIImage(named: heroName + ".png")
        
        self.navigationItem.title = "Hero Info"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: nil, action: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
