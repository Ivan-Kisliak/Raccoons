//
//  CustomView.swift
//  Raccoons
//
//  Created by  Ivan Kiskyak on 12.11.24.
//

import UIKit

class CustomView: UIView {
    
    var action: (() -> ())?
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let imageRaccoon = UIImageView()
    private let checkMarkButton = UIButton()
    private var toogleCheckMark = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.2) {
            self.backgroundColor = .systemGray
            self.layer.borderColor = UIColor.black.cgColor
        } completion: { _ in
            self.backgroundColor = .white
            self.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(raccoon: RaccoonModel) {
        titleLabel.text = raccoon.imageName
        descriptionLabel.text = raccoon.text
        imageRaccoon.image = UIImage(named: raccoon.imageName)
        
        checkMarkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
    }
}

//MARK: - Actions
private extension CustomView {
    @objc
    private func checkMarkButtonAction() {
        toogleCheckMark.toggle()
        let chechMark = toogleCheckMark ? "checkmark.square": "checkmark.square.fill"
        checkMarkButton.setImage(UIImage(systemName: chechMark), for: .normal)
        
        action?()
    }
}

//MARK: - Settings
private extension CustomView {
    func setup() {
        layer.cornerRadius = 20
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        backgroundColor = .white
        addSubview()
        setupTitleLabel()
        setupDescriptionLabel()
        setupImageRaccoon()
        setupCheckMarkButton()
        setupLayout()
    }
    
    func addSubview() {
        [titleLabel,
         descriptionLabel,
         imageRaccoon,
         checkMarkButton].forEach {
            addSubview($0)
        }
    }
    
    func setupTitleLabel() {
        titleLabel.font = .boldSystemFont(ofSize: 24)
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.numberOfLines = 0
    }
    
    func setupImageRaccoon() {
        imageRaccoon.contentMode = .scaleAspectFill
        imageRaccoon.clipsToBounds = true
    }
    
    func setupCheckMarkButton() {
        checkMarkButton.addTarget(self, action: #selector(checkMarkButtonAction), for: .touchUpInside)
    }
}

//MARK: - Layout
private extension CustomView {
    func setupLayout() {
        [titleLabel,
         descriptionLabel,
         imageRaccoon,
         checkMarkButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let constraint = imageRaccoon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        constraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            imageRaccoon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageRaccoon.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            imageRaccoon.widthAnchor.constraint(equalToConstant: 100),
            imageRaccoon.heightAnchor.constraint(equalToConstant: 100),
            constraint,
            
            titleLabel.leadingAnchor.constraint(equalTo: imageRaccoon.trailingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: checkMarkButton.leadingAnchor, constant: -8),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            checkMarkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            checkMarkButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            checkMarkButton.widthAnchor.constraint(equalToConstant: 20),
            checkMarkButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
