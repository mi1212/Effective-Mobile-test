//
//  NetworkDataFetcher.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 07.12.2022.
//

import Foundation

class NetworkDataFetcher {
    
    var networkService = NetworkService()
    
    // запрос поиска
    
    func fetchDataWelcome(completion: @escaping (ResultData?) -> ()) {
        networkService.requestWelcome() { (data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription )")
                completion(nil)
            }
            if let resultData = data {
                let decode = self.decodeJSON(type: ResultData.self, from: resultData)
                completion(decode)
            }
        }
    }
    
    func fetchDataCard(completion: @escaping (Card?) -> ()) {
        networkService.requestCard() { (data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription )")
                completion(nil)
            }
            if let resultData = data {
                let decode = self.decodeJSON(type: Card.self, from: resultData)
                completion(decode)
            }
        }
    }
    
    // парсинг
    
    func decodeJSON<T: Decodable> (type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
}
