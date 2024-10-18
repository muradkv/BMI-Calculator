//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by murad on 29.09.2024.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: - Properties
    private let resultView = ResultView()
    private let bmiResult: BMI

    //MARK: - Initializer
    init(bmiResult: BMI) {
        self.bmiResult = bmiResult
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        bmiResult.color
    }
    
    func provideResultAdvice() -> String {
        bmiResult.advice
    }
    
    func recalculateButtonTapped() {
        dismiss(animated: true)
    }
    
    func provideResultValue() -> Float {
        return bmiResult.value
    }
}
