//
//  LicenseAgreementViewController.swift
//  Raccoons
//
//  Created by  Ivan Kiskyak on 29.10.24.
//

import UIKit

class LicenseAgreementViewController: UIViewController {
    
    var textManager: ITextManageable?
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let titleLabel = UILabel()
    private let textLicenseLabel = UILabel()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
    }
}

//MARK: - Setting View
private extension LicenseAgreementViewController {
    func setupView() {
        view.backgroundColor = .systemGray3
        
        setupScrollView()
        
        view.addSubview(scrollView)
    }
    
}

//MARK: - Setting Subview
private extension LicenseAgreementViewController {
    func setupScrollView() {
        setupContentView()
        setupTitleLabel()
        setupTextLicenseLabel()
        
        scrollView.addSubview(contentView)
    }
    
    func setupContentView() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(textLicenseLabel)
    }
    
    func setupTitleLabel() {
        titleLabel.text =
        "LICENSED APPLICATION END USER LICENSE AGREEMENT"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
    }
    
    func setupTextLicenseLabel() {
        textLicenseLabel.text = textManager?.getLicenseText()
        textLicenseLabel.font = UIFont.systemFont(ofSize: 16)
        textLicenseLabel.numberOfLines = 0
    }
}

//MARK: - Setup Layout
private extension LicenseAgreementViewController {
    func setupLayout() {
        
        [scrollView,
         contentView,
         titleLabel,
         textLicenseLabel
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            contentView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 20),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            textLicenseLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            textLicenseLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            textLicenseLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            textLicenseLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
