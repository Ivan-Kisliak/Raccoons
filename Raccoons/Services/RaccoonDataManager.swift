//
//  RaccoonDataManager.swift
//  Raccoons
//
//  Created by  Ivan Kiskyak on 5.10.24.
//

import Foundation

protocol IRaccoonDataManageable {
    init(raccoons: [RaccoonModel])
    func getCurrentRaccoon() -> RaccoonModel
    func getNextRaccoon() -> RaccoonModel
    func getLastRaccoon() -> RaccoonModel
    func getFirstRaccoon() -> RaccoonModel
}

class RaccoonDataManager: IRaccoonDataManageable {
    private var raccoons: [RaccoonModel] = []
    private var currentIndex = 0
    
    required init(raccoons: [RaccoonModel]) {
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
    
    func sortRaccoonImageName() {
        raccoons.sort(by: <)
    }
    
    func printInfo() {
        raccoons.forEach { print($0) }
    }
}



