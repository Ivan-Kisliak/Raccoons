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
    private let nameImageLabel = UILabel()
    private let horizintalStackView = UIStackView()
    private let verticalMainStackView = UIStackView()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setNameInstance()
        setupView()
        setupLayout()
        
        print("UIButttons count: \(view.getCountButtons(lastButton, nextButton, firstButton))")
        view.printNameCustomButtons(lastButton, nextButton, firstButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: imageView)
        
        if imageView.bounds.contains(touchLocation) {
            textLabel.text = "Image name: \(setImageNameText())"
            nameImageLabel.isHidden = false
            nameImageLabel.text = "Image name: \(setImageNameText())"
        }
    }
}

//MARK: - Set Delegate
private extension ViewController {
    func setDelegate() {
        lastButton.delegate = self
        nextButton.delegate = self
        firstButton.delegate = self
    }
}

//MARK: - Set name instance custom elements
private extension ViewController {
    func setNameInstance() {
        lastButton.nameInstance = "LastButton"
        nextButton.nameInstance = "NextButton"
        firstButton.nameInstance = "FirstButton"
    }
}

//MARK: - Setup View
private extension ViewController {
    func setupView() {
        view.backgroundColor = .white
        
        setupImageView()
        setupTextLabel()
        setupNameImageLabel()
        setupHorizontalStackView()
        setupVerticalMainStackView()
        
        view.addSubview(verticalMainStackView)
        view.addSubview(firstButton)
        view.addSubview(nameImageLabel)
    }

    func setupImageView() {
        if let raccoon = raccoonDataManager?.getCurrentRaccoon() {
            imageView.image = UIImage(named: raccoon.imageName)
        }
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.isUserInteractionEnabled = true
    }
    
    func setupTextLabel() {
        let raccoon = raccoonDataManager?.getCurrentRaccoon()
        textLabel.text = raccoon?.text
        textLabel.font = .systemFont(ofSize: 20)
        textLabel.numberOfLines = 3
    }
    
    func setupNameImageLabel() {
        nameImageLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        nameImageLabel.textColor = .systemBlue
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
        nameImageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            verticalMainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            verticalMainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalMainStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            
            imageView.heightAnchor.constraint(equalTo: verticalMainStackView.widthAnchor),
            
            firstButton.topAnchor.constraint(equalTo: verticalMainStackView.bottomAnchor, constant: 100),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.widthAnchor.constraint(equalTo: verticalMainStackView.widthAnchor, multiplier: 0.45),
            
            nameImageLabel.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 50),
            nameImageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

//MARK: - Private methods
private extension ViewController {
    func setImageNameText() -> String {
        raccoonDataManager?.getCurrentRaccoon().imageName ?? "nil"
    }
    
    func setImageAndText(model: RaccoonModel?) {
        if let model {
            imageView.image = UIImage(named: model.imageName)
            textLabel.text = model.text
        }
    }
}

//MARK: -ICustomButtonDelegate
extension ViewController: ICustomButtonDelegate {
    func pressedButton(_ button: UIButton) {
        switch button {
        case lastButton:
            setImageAndText(model: raccoonDataManager?.getLastRaccoon())
        case nextButton:
            setImageAndText(model: raccoonDataManager?.getNextRaccoon())
        case firstButton:
            setImageAndText(model: raccoonDataManager?.getFirstRaccoon())
        default:
            print("Error")
            break
        }
        nameImageLabel.isHidden = true
    }
}

