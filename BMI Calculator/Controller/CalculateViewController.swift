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
    var height: Float = 0
    var weight: Float = 0
    
    //MARK: - Life cycle
    override func loadView() {
        view = calculateView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        calculateView.delegate = self
    }
}

//MARK: - Delegate
extension CalculateViewController: CalculateViewDelegate {
    func initialValueSliders(height: Float, weight: Float) {
        self.height = height
        self.weight = weight
    }
    
    func heightSliderValueChanged(_ value: Float) {
        height = value
    }
    
    func weightSliderValueChanged(_ value: Float) {
        weight = value
    }
    
    func calculateButtonTapped() {
        let bmi = weight / (height * 2)
        
        let destinationVC = ResultViewController()
        destinationVC.bmiValue = String(format: "%.1f", bmi)
        present(destinationVC, animated: true)
    }
}
