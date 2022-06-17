//
//  HealthClient.swift
//  rackcontroller-client
//
//  Created by Alice Di Nunno on 04/02/2022.
//

import Foundation
import Alamofire

extension RackControllerClient {
    class HealthClient {
        var parent: RackControllerClient?
        
        struct HealthResponse: Codable {
            var Running: Bool
        }
        
        func getHealth(completion: @escaping (Response<HealthResponse>) -> (), error errcompletion: ((String) -> ())? = nil) {
            parent?.getFromApi(route: "\(RackControllerClient.Routes.healthRoute)", completion: completion, error: errcompletion)
        }
    }
}
