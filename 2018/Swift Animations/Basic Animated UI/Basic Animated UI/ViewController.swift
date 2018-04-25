//
//  ViewController.swift
//  Basic Animated UI
//
//  Created by Caleb Wells on 4/25/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let settingsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Settings", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.addTarget(self, action: #selector(handleSettingsPress), for: .touchUpInside)
        return button
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.addTarget(self, action: #selector(handleAddPress), for: .touchUpInside)
        return button
    }()
    
    let addView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.addTarget(self, action: #selector(handleDonePress), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpLayout()
    }
    
    func setUpLayout() {
        let stackView = UIStackView(arrangedSubviews: [settingsButton, addButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -50)
        ])
        
        // MARK: === AddView
        view.addSubview(addView)
        addView.addSubview(doneButton)
        
        NSLayoutConstraint.activate([
            addView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50),
            addView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            addView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            
            doneButton.topAnchor.constraint(equalTo: addView.topAnchor, constant: 12),
            doneButton.trailingAnchor.constraint(equalTo: addView.safeAreaLayoutGuide.trailingAnchor, constant: -12)
        ])
    }
    
    // MARK: === Handle buttons
    @objc func handleSettingsPress() {
        print("=== Settings")
    }
    
    @objc func handleAddPress() {
        animateViewOnScreen()
        print("=== Add")
    }
    
    @objc func handleDonePress() {
        animateViewOffScreen()
        print("=== Done")
    }
    
    // MARK: Animations! :)
    func animateViewOnScreen() {
        UIView.animate(withDuration: 1.5, delay: 0.5, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            NSLayoutConstraint.activate([
                self.addView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 20),
                self.addView.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: -100)
            ])
            self.view.layoutIfNeeded()
            self.view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 0.72)
        }, completion: nil)
    }
    
    func animateViewOffScreen() {
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            NSLayoutConstraint.activate([
                self.addView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 50),
                self.addView.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: -980)
                ])
            self.view.layoutIfNeeded()
            self.view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        }, completion: nil)
    }
}
