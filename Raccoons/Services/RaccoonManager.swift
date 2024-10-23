//
//  RaccoonManager.swift
//  Raccoons
//
//  Created by  Ivan Kiskyak on 5.10.24.
//

import Foundation

protocol IRaccoonManageable {
    func getRaccoons() -> [RaccoonModel]
}

class RaccoonManager: IRaccoonManageable {
    func getRaccoons() -> [RaccoonModel] {
        [RaccoonModel(imageName: ImageName.raccoonThree.rawValue,
                      text: Text.raccoonThree.rawValue),
         RaccoonModel(imageName: ImageName.raccoonFour.rawValue,
                      text: Text.raccoonFour.rawValue),
         RaccoonModel(imageName: ImageName.raccoonOne.rawValue,
                      text: Text.raccoonOne.rawValue),
         RaccoonModel(imageName: ImageName.raccoonFive.rawValue,
                      text: Text.raccoonFive.rawValue),
         RaccoonModel(imageName: ImageName.raccoonTwo.rawValue,
                      text: Text.raccoonTwo.rawValue)]
    }
}

//MARK: - Nested Types

private extension RaccoonManager {
    enum ImageName: String {
        case raccoonOne = "Raccoon1"
        case raccoonTwo = "Raccoon2"
        case raccoonThree = "Raccoon3"
        case raccoonFour = "Raccoon4"
        case raccoonFive = "Raccoon5"
    }
    
    enum Text: String {
        case raccoonOne = "Raccoon one some text"
        case raccoonTwo = "Raccoon two some text"
        case raccoonThree = "Raccoon three some text"
        case raccoonFour = "Raccoon four some text"
        case raccoonFive = "Raccoon five some text"
    }
}
