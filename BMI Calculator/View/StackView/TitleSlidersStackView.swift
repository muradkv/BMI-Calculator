//
//  TitleSlidersStackView.swift
//  BMI Calculator
//
//  Created by murad on 29.09.2024.
//

import UIKit

class TitleSlidersStackView: UIStackView {
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        spacing = 0
        alignment = .fill
    }
    
}
