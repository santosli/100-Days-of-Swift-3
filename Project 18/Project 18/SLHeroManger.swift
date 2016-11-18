//
//  SLHeroManger.swift
//  Project 18
//
//  Created by Santos on 14/11/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

class SLHeroManger: NSObject {
    static let sharedInstance = SLHeroManger()
    
    //防止第三方调用初始化方法来跳过单例
    private override init() {
        super.init()
    }
    
    var HeroList : [SLHero] = [SLHero]()
    
    func addHero(_ hero: SLHero) {
        self.HeroList.append(hero)
    }
    
    func getHeroByName (_ heroName: String) -> SLHero? {
        for hero in HeroList {
            if hero.name == heroName {
                return hero
            }
        }
        return nil
    }
    
    
}
