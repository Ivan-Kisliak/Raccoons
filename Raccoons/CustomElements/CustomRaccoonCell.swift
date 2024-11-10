//
//  CustomRaccoonCell.swift
//  Raccoons
//
//  Created by  Ivan Kiskyak on 8.11.24.
//

import UIKit

class CustomRaccoonCell: UITableViewCell {
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let imageRaccoon = UIImageView()
    private let checkMarkButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
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

//MARK: - Setting
private extension CustomRaccoonCell {
    func setup() {
        addSubview()
        setupTitleLabel()
        setupDescriptionLabel()
        setupImageRaccoon()
        setupLayout()
    }
    
    func addSubview() {
        [titleLabel,
         descriptionLabel,
         imageRaccoon,
         checkMarkButton].forEach {
            contentView.addSubview($0)
        }
    }
}

//MARK: - Settings Views
private extension CustomRaccoonCell {
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
}

// MARK: - Layout
private extension CustomRaccoonCell {
    func setupLayout() {
        [titleLabel,
         descriptionLabel,
         imageRaccoon,
         checkMarkButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            imageRaccoon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageRaccoon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imageRaccoon.widthAnchor.constraint(equalToConstant: 100),
            imageRaccoon.heightAnchor.constraint(equalToConstant: 100),
            imageRaccoon.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -20),
            
            titleLabel.leadingAnchor.constraint(equalTo: imageRaccoon.trailingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: checkMarkButton.leadingAnchor, constant: -8),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            checkMarkButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            checkMarkButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            checkMarkButton.widthAnchor.constraint(equalToConstant: 20),
            checkMarkButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}


