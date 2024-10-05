//
//  UIStackView+addArrangesSubviews.swift
//  Raccoons
//
//  Created by  Ivan Kiskyak on 5.10.24.
//

import UIKit

extension UIStackView {
    func addArrangesSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }
}
