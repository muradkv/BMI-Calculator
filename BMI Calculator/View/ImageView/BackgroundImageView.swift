//
//  BackgroundImageView.swift
//  BMI Calculator
//
//  Created by murad on 29.09.2024.
//

import UIKit

class BackgroundImageView: UIImageView {

    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(imageName: String) {
        self.init(frame: .zero)
        image = UIImage(named: imageName)
    }
    
    //MARK: - Setup
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
