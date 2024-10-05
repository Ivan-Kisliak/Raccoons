//
//  CustomButton.swift
//  Raccoons
//
//  Created by  Ivan Kiskyak on 5.10.24.
//

import UIKit

class CustomButton: UIButton {
    
//MARK: - Intitializers
    init(title: String,
         titleColor: UIColor,
         bgColor: UIColor,
         isShadow: Bool = false) {
        super.init(frame: .zero)
        
        setupView(title: title,
                  titleColor: titleColor,
                  bgColor: bgColor,
                  isShadow: isShadow)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - Life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let shadowPath = UIBezierPath(rect: bounds)
        layer.shadowPath = shadowPath.cgPath
    }
}

//MARK: - Setup View
private extension CustomButton {
    
    func setupView(title: String,
                   titleColor: UIColor,
                   bgColor: UIColor,
                   isShadow: Bool) {
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = bgColor
        layer.cornerRadius = 10
        
        if isShadow {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.7
            layer.shadowOffset = CGSize(width: 5, height: 5)
            layer.shadowRadius = 10
        }
        
        heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
}

