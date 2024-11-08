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
    func findRaccoon(imageName: String) -> RaccoonModel?
    func getAllRacoons() -> [RaccoonModel]
    func removeRaccoon(index: Int)
    func changeMarkRaccoon(index: Int)
    func getIsMarkRaccoon() -> [RaccoonModel]
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
    
    func findRaccoon(imageName: String) -> RaccoonModel? {
        raccoons.first { $0.imageName == imageName }
    }
    
    func getAllRacoons() -> [RaccoonModel] {
        raccoons
    }
    
    func removeRaccoon(index: Int) {
        raccoons.remove(at: index)
    }
    
    func changeMarkRaccoon(index: Int) {
        raccoons[index].isMark.toggle()
    }
    
    func getIsMarkRaccoon() -> [RaccoonModel] {
        raccoons.filter { $0.isMark }
    }
}



