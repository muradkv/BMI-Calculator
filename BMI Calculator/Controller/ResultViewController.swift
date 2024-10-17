//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by murad on 29.09.2024.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: - Properties
    let resultView = ResultView()
    var bmiValue = ""
    var advice = ""
    var color: UIColor = .brown

    //MARK: - Life cycle
    override func loadView() {
        view = resultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultView.delegate = self
        resultView.updateUI()
    }
}

extension ResultViewController: ResultViewDelegate {
    func provideResultColor() -> UIColor {
        color
    }
    
    func provideResultAdvice() -> String {
        advice
    }
    
    func recalculateButtonTapped() {
        dismiss(animated: true)
    }
    
    func provideResultValue() -> String {
        return bmiValue
    }
}
