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
    
    func fetchData(completion: @escaping (ResultData?) -> ()) {
        networkService.request(searchTerm: searchTerm) { (data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription )")
                completion(nil)
            }
            let decode = self.decodeJSON(type: ResultData.self, from: data)
            completion(decode)
        }
    }
    
    // парсинг
    
    func decodeJSON<T: Decodable> (type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXX"
//        decoder.dateDecodingStrategy = .formatted(dateFormatter)
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
