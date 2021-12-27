//
//  ServiceManager.swift
//  WorldBeers
//
//  Created by Pavlos Simas on 15/12/21.
//

import Foundation

class ServiceManager {
    public static let shared = ServiceManager()

    func callService<T: Decodable>(urlString: String, method: HTTPMethod, success: @escaping ((T) -> Void), fail: @escaping ((HTTPError) -> Void)) {
        let url = URL(string: urlString)
        guard let urlObj = url else {
            fail(.urlFailed)
            return
        }
        let session = URLSession.shared
        var request = URLRequest(url: urlObj)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest, completionHandler: { data, _, error in

            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    fail(.noData)
                    return
                }
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(T.self, from: data) {
                    success(json)
                } else {
                    fail(.parsingFailed)
                }
            }
        })
        task.resume()
    }
}
