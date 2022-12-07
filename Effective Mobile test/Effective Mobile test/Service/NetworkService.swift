//
//  NetworkService.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 07.12.2022.
//

import Foundation

class NetworkService {

    //  построение запроса данных по URL
    
    func request(completion: @escaping (Data?, Error?) -> Void) {
        let url = self.urlRequest()
        var request = URLRequest(url: url)
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }

    // параметры адреса
    
    private func urlRequest() -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "run.mocky.io"
        components.path = "/v3/654bd15e-b121-49ba-a588-960956b15175"
        return components.url!
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
            
        }
    }
}
