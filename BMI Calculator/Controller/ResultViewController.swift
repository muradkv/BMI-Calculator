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
    func recalculateButtonTapped() {
        dismiss(animated: true)
    }
    
    func provideResultValue() -> String {
        return bmiValue
    }
}
