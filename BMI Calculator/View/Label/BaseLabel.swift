//
//  BaseLabel.swift
//  BMI Calculator
//
//  Created by murad on 29.09.2024.
//

import UIKit

class BaseLabel: UILabel {

    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String) {
        self.init()
        text = title
    }
    
    //MARK: - Setup
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .white
    }

}
