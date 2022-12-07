//
//  NetworkService.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 07.12.2022.
//

import Foundation

class NetworkService {

    //  построение запроса данных по URL
    
    func request(searchTerm: String, completion: @escaping (Data?, Error?) -> Void) {
        let parametrs = self.requestParametrs(searchTerm: searchTerm)
        let url = self.url(params: parametrs)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeader()
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    // параметры хэдера
    
    private func prepareHeader() -> [String: String]? {
        var headers = [String: String]()
        headers["Authorization"] = "654bd15e-b121-49ba-a588-960956b15175"
        return headers
    }
    
    
    // параметры запроса
    
    private func requestParametrs(searchTerm: String?) -> [String: String] {
        var parametrs = [String: String]()
        return parametrs
    }
    
    // параметры адреса
    
    private func url(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "run.mocky.io"
        components.path = "/v3"
        components.queryItems = params.map {URLQueryItem(name: $0, value: $1)}
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
