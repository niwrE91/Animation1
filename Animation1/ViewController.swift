//
//  ViewController.swift
//  Animation1
//
//  Created by Erwin Warkentin on 26.06.19.
//  Copyright © 2019 Erwin Warkentin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//set up UI
    let titleLabel = UILabel()
    let bodyLable = UILabel()

    fileprivate func setupLabels() {
        titleLabel.textColor = .white
        bodyLable.textColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.text = "Welcome To Company XYZ"
        titleLabel.font = UIFont(name: "Arial", size: 34)
        bodyLable.numberOfLines = 0
        bodyLable.text = "Hello there! Thanks so much for downloading our brand new app and giging us a try. Make sure to leace us a good review in the AppStore."
    }
    
    fileprivate func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, bodyLable])
        stackView.axis = .vertical
        stackView.spacing = 8
        view.addSubview(stackView)
        
//enables autolayout
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupLabels()
        setupStackView()
        
        
//Fun Animations
//Recognize that you tap the screen
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimations)))
    }
    
    
    
    @objc fileprivate func handleTapAnimations() {
        print("Animating")
        
//Animation for titleLabel
        UIView.animate(withDuration: 0.5, delay: 0,usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
            
        }) { (_) in
    
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.titleLabel.alpha = 0
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
                
            })
        }
        
//Animation for bodyLabel
        UIView.animate(withDuration: 0.5, delay: 0.5,usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.bodyLable.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.bodyLable.alpha = 0
                self.bodyLable.transform = self.bodyLable.transform.translatedBy(x: 0, y: -200)
                
            })
        }
        
    }


}

