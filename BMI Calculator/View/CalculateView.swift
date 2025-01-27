//
//  CalculateView.swift
//  BMI Calculator
//
//  Created by murad on 29.09.2024.
//

import UIKit

protocol CalculateViewDelegate: AnyObject {
    func heightSliderValueChanged(_ value: Float)
    func weightSliderValueChanged(_ value: Float)
    func initialValueSliders(height: Float, weight: Float)
    func calculateButtonTapped()
}

class CalculateView: UIView {
    
    //MARK: - Properties
    private let backgroundImageView = BackgroundImageView(imageName: "calculate_background")
    
    private let verticalMainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textColor = .darkGray
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "CALCULATE YOUR BMI"
        return label
    }()
    
    private let heightTitleStackView = TitleSlidersStackView()
    private let heightLabel = SliderLabel(title: "Height")
    private let heightNumberLabel = SliderLabel(title: "1.5m")
    private let heightSlider: BaseSlider = {
        let slider = BaseSlider()
        slider.minimumValue = 0.0
        slider.maximumValue = 3.0
        slider.value = 1.5
        return slider
    }()
    
    private let weightTitleStackView = TitleSlidersStackView()
    private let weightLabel = SliderLabel(title: "Weight")
    private let weightNumberLabel = SliderLabel(title: "100kg")
    private let weightSlider: BaseSlider = {
        let slider = BaseSlider()
        slider.minimumValue = 0
        slider.maximumValue = 200
        slider.value = 100
        return slider
    }()
    
    private let calculateButton: BaseButton = {
        let button = BaseButton(title: "CALCULATE")
        button.titleLabel?.textColor = .white
        button.backgroundColor = UIColor(red: 98 / 255, green: 96 / 255, blue: 157 / 255, alpha: 1)
        return button
    }()
    
    weak var delegate: CalculateViewDelegate?
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI
    private func setupView() {
        addSubview(backgroundImageView)
        addSubview(verticalMainStackView)
        
        verticalMainStackView.addArrangedSubview(titleLabel)
        verticalMainStackView.addArrangedSubview(heightTitleStackView)
        verticalMainStackView.addArrangedSubview(heightSlider)
        verticalMainStackView.addArrangedSubview(weightTitleStackView)
        verticalMainStackView.addArrangedSubview(weightSlider)
        verticalMainStackView.addArrangedSubview(calculateButton)
        
        heightTitleStackView.addArrangedSubview(heightLabel)
        heightTitleStackView.addArrangedSubview(heightNumberLabel)
        
        weightTitleStackView.addArrangedSubview(weightLabel)
        weightTitleStackView.addArrangedSubview(weightNumberLabel)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            verticalMainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            verticalMainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            verticalMainStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            verticalMainStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            heightTitleStackView.heightAnchor.constraint(equalToConstant: 21),
            heightSlider.heightAnchor.constraint(equalToConstant: 60),
            weightTitleStackView.heightAnchor.constraint(equalToConstant: 21),
            weightSlider.heightAnchor.constraint(equalToConstant: 60),
            
            calculateButton.heightAnchor.constraint(equalToConstant: 51)
        ])
    }
    
    //MARK: - Methods
    
    private func setupTargets() {
        heightSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        weightSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
    }
    
    @objc private func sliderValueChanged(_ sender: UISlider) {
        let value = sender.value
        
        if sender == heightSlider {
            delegate?.heightSliderValueChanged(sender.value)
            heightNumberLabel.text = String(format: "%.2fm", value)
        } else {
            delegate?.weightSliderValueChanged(sender.value)
            weightNumberLabel.text = String(format: "%.fkg", value)
        }
    }
    
    @objc private func calculateButtonTapped() {
        delegate?.initialValueSliders(height: heightSlider.value, weight: weightSlider.value)
        delegate?.calculateButtonTapped()
    }
    
}
