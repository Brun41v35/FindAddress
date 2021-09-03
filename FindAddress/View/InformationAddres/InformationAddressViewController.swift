//
//  InformationAddressViewController.swift
//  FindAddress
//
//  Created by Bruno Silva on 02/09/21.
//

import UIKit

class InformationAddressViewController: UIViewController {
    
    //MARK: - Variabless
    private let informationView = InformationAddressView()
    
    //MARK: - LifeCycle
    override func loadView() {
        view = informationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Setup
    private func setup() {
        setupNavigationTitle()
        didTapSearchButton()
    }
    
    private func setupNavigationTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //MARK: - Functions
    private func didTapSearchButton() {
        informationView.searchButton.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
    }
    
    //MARK: - Actions
    @objc private func searchAction() {
        informationView.loadingIndicator.startAnimating()
        guard let userCep = informationView.cepTextField.text else { return }
        NetworkManager.shared.request(cep: userCep) { response in
            DispatchQueue.main.async {
                self.informationView.loadingIndicator.stopAnimating()
                self.informationView.cepLabel.text = response.cep
                self.informationView.publicPlaceLabel.text = response.logradouro
                self.informationView.complementLabel.text = response.complemento.isEmpty ? "Sem valor" : response.complemento
                self.informationView.districtLabel.text = response.bairro
                self.informationView.locationLabel.text = response.localidade
                self.informationView.ufLabel.text = response.uf
            }
        } onError: { errorMessage in
            print(errorMessage)
        }
    }
}
