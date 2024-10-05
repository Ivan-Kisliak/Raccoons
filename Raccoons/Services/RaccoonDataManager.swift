//
//  RaccoonDataManager.swift
//  Raccoons
//
//  Created by  Ivan Kiskyak on 5.10.24.
//

import Foundation

class RaccoonDataManager {
    private var raccoons: [RaccoonModel] = []
    private var currentIndex = 0
    
    init(raccoons: [RaccoonModel]) {
        self.raccoons = raccoons
    }
    
    func getCurrentRaccoon() -> RaccoonModel {
        raccoons[currentIndex]
    }
    
    func getNextRaccoon() -> RaccoonModel {
        if currentIndex < raccoons.count - 1 {
            currentIndex += 1
        }
        return getCurrentRaccoon()
    }
    
    func getLastRaccoon() -> RaccoonModel {
        if currentIndex > 0 {
            currentIndex -= 1
        }
        return getCurrentRaccoon()
    }
    
    func getFirstRaccoon() -> RaccoonModel {
        currentIndex = 0
        return getCurrentRaccoon()
    }
}
