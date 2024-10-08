//
//  RaccoonModel.swift
//  Raccoons
//
//  Created by  Ivan Kiskyak on 5.10.24.
//

import Foundation

struct RaccoonModel {
    let imageName: String
    let text: String
}

//MARK: - Comparable
extension RaccoonModel: Comparable {
    static func < (lhs: RaccoonModel, rhs: RaccoonModel) -> Bool {
        lhs.imageName < rhs.imageName
    }
}

//MARK: - CustomStringConvertible
extension RaccoonModel: CustomStringConvertible {
    var description: String {
        "Название картинки: \(imageName), описание: \(text)"
    }
}
