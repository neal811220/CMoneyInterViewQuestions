//
//  ViewController.swift
//  CMoneyInterViewQuestions
//
//  Created by Neal on 2020/4/7.
//  Copyright © 2020 neal812220. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let requestAPIButton: UIButton = {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitleColor(UIColor.blue, for: .normal)
        
        button.setTitle("Request API", for: .normal)
        
        button.addTarget(self, action: #selector(transitionsToAPIContent), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        setupRequestAPIButton()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: SetupInfo
    
    func setupRequestAPIButton() {
        
        view.addSubview(requestAPIButton)
        
        requestAPIButton.anchor(centerX: view.centerXAnchor, centerY: view.centerYAnchor)
    }
    
    @objc func transitionsToAPIContent() {
        
        let apiContentVC = Transitions.transitionsAPIContent()
        
        show(apiContentVC, sender: nil)
    }
}

