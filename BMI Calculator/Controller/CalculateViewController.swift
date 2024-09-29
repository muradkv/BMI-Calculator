//
//  ViewController.swift
//  BMI Calculator
//
//  Created by murad on 29.09.2024.
//

import UIKit

class CalculateViewController: UIViewController {
    
    //MARK: - Properties
    let calculateView = CalculateView()
    
    //MARK: - Life cycle
    override func loadView() {
        view = calculateView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    private func setupUI() {
        
    }

}

