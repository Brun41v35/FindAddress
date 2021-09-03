//
//  Address.swift
//  FindAddress
//
//  Created by Bruno Silva on 02/09/21.
//

import Foundation

struct Address: Codable {
    
    //MARK: - Properties
    let cep: String
    let logradouro: String
    let complemento: String
    let bairro: String
    let localidade: String
    let uf: String
    let ddd: String
}
