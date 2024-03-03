//
//  HTTPHelper.swift
//  LloydsTest
//
//  Created by Gaurav pande on 07/02/23.
//

import Foundation

enum HTTPHeaderFields {
    case applicationjson
    case applicationEncoded
    case none
}

class HttpHelper {
func GET(url: String, params: [String: String], httpHeader: HTTPHeaderFields, complete: @escaping (Bool, Data?) -> ()) {
        guard var components = URLComponents(string: url) else {
            print("Error: cannot create URL Compontents")
            return
        }
        components.queryItems = params.map { key, value in
            URLQueryItem(name: key, value: value)
        }

        guard let url = components.url else {
            print("Unable to create URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        switch httpHeader {
        case .applicationjson:
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        case .applicationEncoded:
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        case .none: break
        }
        let config = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: config)
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Unable to call get")
                print(error!)
                complete(false, nil)
                return
            }
            guard let data = data else {
                print("Unable to receive data")
                complete(false, nil)
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                print("HTTP request failed")
                complete(false, nil)
                return
            }
            complete(true, data)
        }.resume()
    }
}
