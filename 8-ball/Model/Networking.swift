//
//  Networking.swift
//  8-ball
//
//  Created by Valerii Dulia on 19.10.2021.
//

import Foundation


// MARK: - Protocols
protocol NetworkingProtocol {
    func fetchAnswer(_ completion: @escaping (Answer) -> Void)
}

// MARK: - Networking
class Networking: NetworkingProtocol {
    
    // MARK: - Static properties
    
 static let shared = Networking()
    
    // MARK: - Public methods

    func fetchAnswer(_ completion: @escaping (Answer) -> Void) {
        let urlString = "https://8ball.delegator.com/magic/JSON/any"
        fetchData(urlString: urlString, completion)
    }
      
    // MARK: - Private methods
    private func fetchData<T: Decodable>(urlString: String, _ completion: @escaping (T) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            if let data = data {
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(result)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    private init() {}
}
