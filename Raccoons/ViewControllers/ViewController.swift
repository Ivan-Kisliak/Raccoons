//
//  ViewController.swift
//  Raccoons
//
//  Created by  Ivan Kiskyak on 5.10.24.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Property services
    
    var raccoonDataManager: IRaccoonDataManageable?
    
    //MARK: - Property UI
    private let imageView = UIImageView()
    private let textLabel = UILabel()
    private let lastButton = CustomButton(title: "Last",
                                          titleColor: .white,
                                          bgColor: .systemCyan,
                                          isShadow: true)
    private let nextButton = CustomButton(title: "Next",
                                          titleColor: .black,
                                          bgColor: .white,
                                          isShadow: true)
    private let firstButton = CustomButton(title: "First",
                                           titleColor: .white,
                                           bgColor: .systemRed)
    private let horizintalStackView = UIStackView()
    private let verticalMainStackView = UIStackView()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addAction()
        setupLayout()
    }
}

//MARK: - Actions
private extension ViewController {
    func addAction() {
        let lastButtonAction = UIAction { _ in
            if let lastRaccoon = self.raccoonDataManager?.getLastRaccoon() {
                self.imageView.image = UIImage(named: lastRaccoon.imageName)
                self.textLabel.text = lastRaccoon.text
            }
        }
        lastButton.addAction(lastButtonAction, for: .touchUpInside)
        
        let nextButtonAction = UIAction { _ in
            if let nextRaccoon = self.raccoonDataManager?.getNextRaccoon() {
                self.imageView.image = UIImage(named: nextRaccoon.imageName)
                self.textLabel.text = nextRaccoon.text
            }
        }
        nextButton.addAction(nextButtonAction, for: .touchUpInside)
        
        let firstButtonAction = UIAction { _ in
            if let firstRaccoon = self.raccoonDataManager?.getFirstRaccoon() {
                self.imageView.image = UIImage(named: firstRaccoon.imageName)
                self.textLabel.text = firstRaccoon.text
            }
        }
        firstButton.addAction(firstButtonAction, for: .touchUpInside)
    }
}

//MARK: - Setup View
private extension ViewController {
    func setupView() {
        view.backgroundColor = .white
        
        setupImageView()
        setupTextLabel()
        setupHorizontalStackView()
        setupVerticalMainStackView()
        
        view.addSubview(verticalMainStackView)
        view.addSubview(firstButton)
    }
    
    func setupImageView() {
        if let raccoon = raccoonDataManager?.getCurrentRaccoon() {
            imageView.image = UIImage(named: raccoon.imageName)
        }
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
    }
    
    func setupTextLabel() {
        let raccoon = raccoonDataManager?.getCurrentRaccoon()
        textLabel.text = raccoon?.text
        textLabel.font = .systemFont(ofSize: 18)
        textLabel.numberOfLines = 3
    }
    
    func setupHorizontalStackView() {
        horizintalStackView.axis = .horizontal
        horizintalStackView.distribution = .fillEqually
        horizintalStackView.alignment = .fill
        horizintalStackView.spacing = 30
        
        horizintalStackView.addArrangesSubviews([lastButton, nextButton])
    }
    
    func setupVerticalMainStackView() {
        verticalMainStackView.axis = .vertical
        verticalMainStackView.distribution = .equalSpacing
        verticalMainStackView.alignment = .fill
        verticalMainStackView.spacing = 50
        
        verticalMainStackView.addArrangesSubviews([imageView,
                                                   textLabel,
                                                   horizintalStackView])
    }
}

//MARK: - Setup Layout
private extension ViewController {
    
    func setupLayout() {
        
        verticalMainStackView.translatesAutoresizingMaskIntoConstraints = false
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            verticalMainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            verticalMainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalMainStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            
            imageView.heightAnchor.constraint(equalTo: verticalMainStackView.widthAnchor),
            
            firstButton.topAnchor.constraint(equalTo: verticalMainStackView.bottomAnchor, constant: 120),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.widthAnchor.constraint(equalTo: verticalMainStackView.widthAnchor, multiplier: 0.45)
        ])
    }
}

