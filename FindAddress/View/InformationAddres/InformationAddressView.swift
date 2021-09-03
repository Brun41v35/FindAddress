//
//  InformationAddressView.swift
//  FindAddress
//
//  Created by Bruno Silva on 02/09/21.
//

import UIKit

public class InformationAddressView: UIView {
    
    //MARK: - Variables
    lazy var cepTextField = makeTextField()
    lazy var searchButton = makeButton()
    lazy var loadingIndicator = makeLoading()
    lazy var stack = makeStack()
    lazy var cepLabel = makeLabel()
    lazy var publicPlaceLabel = makeLabel()
    lazy var complementLabel = makeLabel()
    lazy var districtLabel = makeLabel()
    lazy var locationLabel = makeLabel()
    lazy var ufLabel = makeLabel()
    
    //MARK: - Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    private func setup() {
        setupBackgroundColor()
        addViews()
        addConstraints()
    }
    
    private func setupBackgroundColor() {
        backgroundColor = .systemBackground
    }
    
    private func addViews() {
        addSubview(cepTextField)
        addSubview(searchButton)
        addSubview(loadingIndicator)
        addSubview(stack)
        stack.addArrangedSubview(cepLabel)
        stack.addArrangedSubview(publicPlaceLabel)
        stack.addArrangedSubview(complementLabel)
        stack.addArrangedSubview(districtLabel)
        stack.addArrangedSubview(locationLabel)
        stack.addArrangedSubview(ufLabel)
    }
    
    //MARK: - Functions View
    private func makeTextField() -> UITextField {
        let textField = UITextField()
        textField.placeholder = "CEP"
        textField.textAlignment = .center
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    private func makeButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Buscar", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 5
        button.layer.masksToBounds = false
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private func makeLoading() -> UIActivityIndicatorView {
        let loading = UIActivityIndicatorView()
        loading.color = UIColor.gray
        loading.translatesAutoresizingMaskIntoConstraints = false
        return loading
    }
    
    private func makeStack() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func makeLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    //MARK: - Constraints
    private func addConstraints() {
        NSLayoutConstraint.activate([
            cepTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            cepTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cepTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cepTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            searchButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            searchButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: cepTextField.bottomAnchor, constant: 10),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: searchButton.topAnchor, constant: -20)
        ])
    }
}
