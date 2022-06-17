//
//  Engine.swift
//  rackcontroller-client
//
//  Created by Alice Di Nunno on 05/02/2022.
//

import Foundation
import Alamofire

extension RackControllerClient {
    func buildApiUrl(from route: String) -> String {
        var url = "http://\(settings.host):\(settings.port)/\(route)"
        
        
        while url.contains("//") {
            url = url.replacingOccurrences(of: "//", with: "/")
        }
        
        print(url)
        return url
    }
    
    func getStandardHeaders() -> HTTPHeaders {
        var headers = HTTPHeaders()
        
        if jwtToken != nil && jwtToken != "" {
            headers["Authorization"] = jwtToken
        }
        
        return headers
    }
    
    func getFromApi<T: Decodable>(route: String, completion: @escaping (Response<T>) -> (), error: ((String) -> ())? = nil) {
        let url = buildApiUrl(from: route)
                
        AF.request(url, headers: getStandardHeaders()).responseDecodable {
            response in
            
            self.handleResponse(data: response, completion: completion, error: error)
        }
    }
    
    func postToApi<T: Codable, U: Codable>(route: String, data: U, completion: @escaping (Response<T>) -> (), error: ((String) -> ())? = nil) {
        let url = buildApiUrl(from: route)
        
        AF.request(url, method: .post, parameters: data.dictionary, encoding: JSONEncoding.default, headers: getStandardHeaders()).responseDecodable {
            response in
            
            self.handleResponse(data: response, completion: completion, error: error)
        }
    }
    
    func handleResponse<T: Codable>(data: AFDataResponse<Response<T>>, completion: @escaping (Response<T>) -> (), error errcompletion: ((String) -> ())? = nil) {
            
        if let err = data.error {
            errcompletion?(err.errorDescription ?? "Unknown Error")
            return
        }
        
        if data.data == nil {
            errcompletion?("empty response from server")
            return
        }
        
        do { 
            completion(try JSONDecoder().decode(Response<T>.self, from: data.data!))
        } catch {
            errcompletion?(error.localizedDescription)
        }
    }
}

