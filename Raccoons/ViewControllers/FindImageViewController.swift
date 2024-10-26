//
//  FindImageViewController.swift
//  Raccoons
//
//  Created by  Ivan Kiskyak on 23.10.24.
//

import UIKit

class FindImageViewController: UIViewController {
    //MARK: - Property Services
    var raccoonDataManager: IRaccoonDataManageable?
    
    //MARK: - Property View
    private let titleLabel = UILabel()
    private let textField = UITextField()
    private let checkButton = CustomButton(title: "Проверить",
                                           titleColor: .blue,
                                           bgColor: .clear)
    private let imageView = UIImageView()
    private let textLabel = UILabel()
    private let verticalStackView = UIStackView()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setupView()
        setupLayout()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        getActionButton()
    }
}

//MARK: - Set Delegate
private extension FindImageViewController {
    func setDelegate() {
        checkButton.delegate = self
        textField.delegate = self
    }
}

//MARK: - Setup View
private extension FindImageViewController {
    func setupView() {
        view.backgroundColor = .systemGray5
        
        setupTitleLabel()
        setupTextField()
        setupImageView()
        setupTextLabel()
        setupVerticalStackView()
        
        view.addSubview(titleLabel)
        view.addSubview(textField)
        view.addSubview(verticalStackView)
    }
    
    func setupTitleLabel() {
        titleLabel.text = "Введите название картинки"
        titleLabel.font = UIFont.systemFont(ofSize: 18)
    }
    
    func setupTextField() {
        textField.placeholder = "Название картинки"
        textField.borderStyle = .roundedRect
    }
    
    func setupCheckButton() {
        checkButton.setTitle("Проверить", for: .normal)
    }
    
    func setupImageView() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
    }
    
    func setupTextLabel() {
        textLabel.font = UIFont.systemFont(ofSize: 18)
    }
    
    func setupVerticalStackView() {
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .equalSpacing
        verticalStackView.alignment = .fill
        verticalStackView.spacing = 50
        verticalStackView.addArrangesSubviews([checkButton,
                                              imageView,
                                              textLabel])
    }
}

//MARK: - Setup Layout
private extension FindImageViewController {
    func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            verticalStackView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 30),
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            
            imageView.heightAnchor.constraint(equalTo: verticalStackView.widthAnchor)
        ])
    }
}

//MARK: - ICustomButtonDelegate
extension FindImageViewController: ICustomButtonDelegate {
    func pressedButton(_ button: UIButton) {
        getActionButton()
    }
}

//MARK: - UITextFieldDelegate
extension FindImageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        getActionButton()
        
        return true
    }
}

//MARK: - Private Methods
private extension FindImageViewController {
    func getActionButton() {
        view.endEditing(true)
        
        let text = textField.text?.lowercased() ?? ""
        
        guard let findRaccoon = raccoonDataManager?.findRaccoon(imageName: text) else {
            titleLabel.text = "Такой картинки нет"
            textField.text = ""
            imageView.isHidden = true
            textLabel.isHidden = true
            return
        }
        
        titleLabel.text = "Такая картинка есть"
        imageView.isHidden = false
        imageView.image = UIImage(named: findRaccoon.imageName)
        textLabel.isHidden = false
        textLabel.text = findRaccoon.text
        textField.text = ""
    }
}
