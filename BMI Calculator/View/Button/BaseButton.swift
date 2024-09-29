//
//  BaseButton.swift
//  BMI Calculator
//
//  Created by murad on 29.09.2024.
//

import UIKit

class BaseButton: UIButton {

    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        setTitle(title, for: .normal)
    }
    
    //MARK: - Setup
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.font = UIFont.systemFont(ofSize: 20)
        layer.cornerRadius = 10
        clipsToBounds = true 
    }
    
}
