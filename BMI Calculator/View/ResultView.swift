//
//  ResultView.swift
//  BMI Calculator
//
//  Created by murad on 29.09.2024.
//

import UIKit

class ResultView: UIView {
    
    //MARK: - Properties
    private let backgroundImageView: BackgroundImageView = {
        let imageView = BackgroundImageView(imageName: "result_background")
        imageView.backgroundColor = UIColor(red: 51 / 255, green: 123 / 255, blue: 197 / 255, alpha: 1.0)
        return imageView
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    private let resultNameLabel: BaseLabel = {
        let label = BaseLabel(title: "YOUR RESULT")
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let resultNumberLabel: BaseLabel = {
        let label = BaseLabel(title: "19.5")
        label.font = UIFont.systemFont(ofSize: 80, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let resultAdviceLabel: BaseLabel = {
        let label = BaseLabel(title: "EAT SOME MORE SNACKS!")
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.textAlignment = .center
        return label
    }()
    
    private let recalculateButton: BaseButton = {
        let button = BaseButton(title: "RECALCULATE")
        button.setTitleColor(UIColor(red: 116 / 255, green: 114 / 255, blue: 210 / 255, alpha: 1), for: .normal)
        button.backgroundColor = .white
        return button
    }()

    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI
    private func setupView() {
        addSubview(backgroundImageView)
        addSubview(verticalStackView)
        addSubview(recalculateButton)
        
        verticalStackView.addArrangedSubview(resultNameLabel)
        verticalStackView.addArrangedSubview(resultNumberLabel)
        verticalStackView.addArrangedSubview(resultAdviceLabel)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            verticalStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            verticalStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            recalculateButton.heightAnchor.constraint(equalToConstant: 51),
            recalculateButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            recalculateButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            recalculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
