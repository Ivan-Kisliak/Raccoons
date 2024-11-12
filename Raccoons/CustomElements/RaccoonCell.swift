//
//  RaccoonCell.swift
//  Raccoons
//
//  Created by  Ivan Kiskyak on 12.11.24.
//

import UIKit

class RaccoonCell: UITableViewCell {
    private let customView = CustomView()
    
    var action: ((UITableViewCell) -> ())?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(raccoon: RaccoonModel) {
        customView.configure(raccoon: raccoon)
        customView.action = toogleCheckMarkButton
    }
    
    private func toogleCheckMarkButton() {
        action?(self)
    }
}

//MARK: - Settings
private extension RaccoonCell {
    func setup() {
        backgroundColor = .gray
        contentView.addSubview(customView)
        setuLayout()
    }
}

//MARK: - Layout
private extension RaccoonCell {
    func setuLayout() {
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: contentView.topAnchor),
            customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
    }
}
