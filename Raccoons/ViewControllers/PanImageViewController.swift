//
//  PanImageViewController.swift
//  Raccoons
//
//  Created by  Ivan Kiskyak on 27.10.24.
//

import UIKit

class PanImageViewController: UIViewController {
    
//MARK:  - Property
    var raccoonDataManager: IRaccoonDataManageable?
    
    private var imageView = UIImageView()
    private let panGestureRecognaizer = UIPanGestureRecognizer()
    private var panGestureAnchorPoint: CGPoint?
    
    private var centerXConstraint: NSLayoutConstraint!
    private var topConstraint: NSLayoutConstraint!
   
//MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        setupGestureRecognaizer()
    }
    
    @objc
    func handlePanGesture(_ gestureRecognaizer: UIGestureRecognizer) {
        guard panGestureRecognaizer === gestureRecognaizer else {
            return
        }
        
        switch gestureRecognaizer.state {
        case .began:
            panGestureAnchorPoint = gestureRecognaizer.location(in: view)
        case .changed:
            guard let panGestureAnchorPoint else {
                return
            }
            
            let gesturePoint = gestureRecognaizer.location(in: view)

            centerXConstraint.constant += gesturePoint.x - panGestureAnchorPoint.x
            topConstraint.constant += gesturePoint.y -
                panGestureAnchorPoint.y
            
            self.panGestureAnchorPoint = gesturePoint
        case .ended, .cancelled:
            panGestureAnchorPoint = nil
        case .failed, .possible:
            break
        @unknown default:
            break
        }
    }
}

//MARK: - Setting View
private extension PanImageViewController {
    func setupView() {
        view.backgroundColor = .white
        
        setupImageView()
        
        view.addSubview(imageView)
    }
    
    func setupImageView() {
        if let currentRaccoon = raccoonDataManager?.getCurrentRaccoon() {
            imageView.image = UIImage(named: currentRaccoon.imageName)
        }
        imageView.isUserInteractionEnabled = true
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }
    
    func setupGestureRecognaizer() {
        panGestureRecognaizer.addTarget(self, action: #selector(handlePanGesture(_ :)))
        panGestureRecognaizer.maximumNumberOfTouches = 1
        
        imageView.addGestureRecognizer(panGestureRecognaizer)
    }
}

//MARK: - Setup Layout
private extension PanImageViewController {
    func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        centerXConstraint = imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        topConstraint = imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        
        
        NSLayoutConstraint.activate([
            centerXConstraint,
            topConstraint,
            
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}


