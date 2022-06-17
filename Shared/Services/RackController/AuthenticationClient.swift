//
//  AuthenticationClient.swift
//  RackController-Client
//
//  Created by Alice Di Nunno on 30/01/2022.
//

import Foundation
import Alamofire
struct JSON {
    static let encoder = JSONEncoder()
}
extension Encodable {
    subscript(key: String) -> Any? {
        return dictionary[key]
    }
    var dictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: JSON.encoder.encode(self))) as? [String: Any] ?? [:]
    }
}

extension RackControllerClient {
    struct AccessTokenRequest: Codable {
        var Mail: String
        var Password: String
    }
    
    struct AccessTokenResponse: Codable {
        var AccessToken: String
    }
    
    struct JWTTokenRequest: Codable {
        var UserAccessToken: String
    }
    
    struct JWTTokenResponse: Codable {
        var JwtToken: String
    }
    
    class AuthenticationClient: ObservableObject {
        var parent: RackControllerClient?

        func generateAuthToken(mail: String, password: String, completion: @escaping (Response<AccessTokenResponse>) -> (), error errcompletion: ((String) -> ())? = nil) {
            guard parent != nil else {
                return
            }
                        
            let request = AccessTokenRequest(Mail: mail, Password: password)
            
            parent?.postToApi(route: RackControllerClient.Routes.createAuthenticationTokenRoute, data: request, completion: completion, error: errcompletion)
        }
    
        func generateJWTToken(accessToken: String, completion: @escaping (Response<JWTTokenResponse>) -> (), error errcompletion: ((String) -> ())? = nil) {
            let request = JWTTokenRequest(UserAccessToken: accessToken)
            
            parent?.postToApi(route: RackControllerClient.Routes.jwtManagementRoute, data: request, completion: completion, error: errcompletion)
        }
    }
}
