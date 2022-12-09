//
//  NetworkService.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 07.12.2022.
//

import Foundation

class NetworkService {

    //  построение запроса данных по URL
    
    func requestWelcome(completion: @escaping (Data?, Error?) -> Void) {
        let url = self.urlRequestWelcome()
        var request = URLRequest(url: url)
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    func requestCard(completion: @escaping (Data?, Error?) -> Void) {
        let url = self.urlRequestCard()
        var request = URLRequest(url: url)
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }

    // параметры адреса
    
    private func urlRequestWelcome() -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "run.mocky.io"
        components.path = "/v3/654bd15e-b121-49ba-a588-960956b15175"
        return components.url!
    }
    
    private func urlRequestCard() -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "run.mocky.io"
        components.path = "/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
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
