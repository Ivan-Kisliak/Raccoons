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
        
        setupDelegate()
        setupView()
        setupLayout()
    }
}

//MARK: - Setup Delegate
private extension ViewController {
    func setupDelegate() {
        lastButton.delegate = self
        nextButton.delegate = self
        firstButton.delegate = self
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

//MARK: -ICustomButtonDelegate
extension ViewController: ICustomButtonDelegate {
    private func getRaccoonModel(_ model: RaccoonModel?) {
        if let model {
            imageView.image = UIImage(named: model.imageName)
            textLabel.text = model.text
        }
    }
    
    func pressedButton(_ button: UIButton) {
        switch button {
        case lastButton: 
            getRaccoonModel(raccoonDataManager?.getLastRaccoon())
        case nextButton:
            getRaccoonModel(raccoonDataManager?.getNextRaccoon())
        case firstButton:
            getRaccoonModel(raccoonDataManager?.getFirstRaccoon())
        default:
            print("Error")
            break
        }
    }
}

