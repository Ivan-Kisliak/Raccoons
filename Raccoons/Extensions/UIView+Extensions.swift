//
//  UIView+Extensions.swift
//  Raccoons
//
//  Created by  Ivan Kiskyak on 15.10.24.
//

import UIKit

extension UIView {
    func getCountButtons(_ views: UIView...) -> Int {
        views.reduce(into: 0) { $0 += $1 is UIButton ? 1 : 0 }
    }
    
    func printNameCustomButtons(_ views: UIView...) {
        views.forEach {
            if let button = $0 as? CustomButton {
                print(button.nameInstance ?? "Unnowed name")
            }
        }
    }
}
