//
//  NetworkManager.swift
//  FindAddress
//
//  Created by Bruno Silva on 02/09/21.
//

import Foundation

class NetworkManager {
    
    //MARK: - Variables
    static let shared = NetworkManager()
    private let baseURL = "https://viacep.com.br/ws/"
    private let json = "/json"
    
    //MARK: - Init
    private init() {}
    
    //MARK: - Request
    func request(
        cep: String,
        onSuccess: @escaping (Address) -> Void,
        onError: @escaping (String) -> Void
    ) {
        let endpoint = baseURL + cep + json
        
        guard let url = URL(string: endpoint) else {
            onError("Some error happens with URL 😔")
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let _ = error {
                onError("We receive a error from server")
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                onError("Invalid response")
                return
            }
            
            guard let data = data else {
                onError("Invalid data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let cepInformation = try decoder.decode(Address.self, from: data)
                onSuccess(cepInformation)
            } catch {
                onError("Error with data")
            }
        }
        task.resume()
    }
}
