//
//  CounterViewController.swift
//  Counter
//
//  Created by Grady Jenkins on 4/15/17.
//  Copyright © 2017 GradyJenkins. All rights reserved.
//

import UIKit
import Foundation

class CounterViewController: UIViewController {
    
    var counter: Int = 0
    
    let inputContainerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.layer.masksToBounds = true
        return view
        
    }()
    
    let counterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(80)
        return label
    }()
    
    let tapButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 58, g: 21, b: 128)
        button.setTitle("Tap", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
        button.addTarget(self, action: #selector(handleCounter), for: .touchUpInside)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 68, g: 219, b: 159)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(handleReset))
        navigationItem.title = "Counter"
        
        counterLabel.text = "\(counter)"
        
        //instantiating the input viewer
        view.addSubview(inputContainerView)
        view.addSubview(tapButton)
        
        setupInputContainerView()
        setupLogRegButton()
    }
    
    func setupLogRegButton(){
        
        //Constraints :  need x,y, width and height
        tapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tapButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 12).isActive = true
        
        //how wide
        tapButton.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        tapButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
    }
    
    func setupInputContainerView() {
        
        //Constraints :  need x,y, width and height
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200).isActive = true
        inputContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        inputContainerView.addSubview(counterLabel)
        
        counterLabel.centerXAnchor.constraint(equalTo: inputContainerView.centerXAnchor).isActive = true
        counterLabel.centerYAnchor.constraint(equalTo: inputContainerView.centerYAnchor).isActive = true
        counterLabel.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        counterLabel.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        counterLabel.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor).isActive = true
        
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func handleReset() {
        counter = 0
        print(counter)
        counterLabel.text = "\(counter)"
    }

    func handleCounter() {
        counter += 1
        print(counter)
        counterLabel.text = "\(counter)"
    }
    
    
    
    
    
    
    
    
    
    
}
extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
