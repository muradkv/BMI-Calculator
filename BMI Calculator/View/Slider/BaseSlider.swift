//
//  BaseSlider.swift
//  BMI Calculator
//
//  Created by murad on 29.09.2024.
//

import UIKit

class BaseSlider: UISlider {

    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        thumbTintColor = UIColor(red: 116 / 255, green: 114 / 255, blue: 210 / 255, alpha: 0.5)
        minimumTrackTintColor = UIColor(red: 116 / 255, green: 114 / 255, blue: 210 / 255, alpha: 0.5)
        isContinuous = true
    }
}
