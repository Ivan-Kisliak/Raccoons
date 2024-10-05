//
//  RaccoonManager.swift
//  Raccoons
//
//  Created by  Ivan Kiskyak on 5.10.24.
//

import Foundation

class RaccoonManager {
    func getRaccoons() -> [RaccoonModel] {
        return [
            RaccoonModel(imageName: ImageName.raccoonOne.rawValue,
                         text: Text.raccoonOne.rawValue),
            RaccoonModel(imageName: ImageName.raccoonTwo.rawValue,
                         text: Text.raccoonTwo.rawValue),
            RaccoonModel(imageName: ImageName.raccoonThree.rawValue,
                         text: Text.raccoonThree.rawValue),
            RaccoonModel(imageName: ImageName.raccoonFour.rawValue,
                         text: Text.raccoonFour.rawValue),
            RaccoonModel(imageName: ImageName.raccoonFive.rawValue,
                         text: Text.raccoonFive.rawValue)
        ]
    }
}

//MARK: - Nested Types

private extension RaccoonManager {
    enum ImageName: String {
        case raccoonOne = "raccoon1"
        case raccoonTwo = "raccoon2"
        case raccoonThree = "raccoon3"
        case raccoonFour = "raccoon4"
        case raccoonFive = "raccoon5"
    }
    
    enum Text: String {
        case raccoonOne = """
Raccoon one some text Raccoon one some text Raccoon one some text
"""
        case raccoonTwo = """
Raccoon two some text Raccoon two some text Raccoon two some text
"""
        case raccoonThree = """
Raccoon three some text Raccoon three some text Raccoon three some text
"""
        case raccoonFour = """
Raccoon four some text Raccoon four some text Raccoon four some text
"""
        case raccoonFive = """
Raccoon five some text Raccoon five some text Raccoon five some text 
"""
    }
}
