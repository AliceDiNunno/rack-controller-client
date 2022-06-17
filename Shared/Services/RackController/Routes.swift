//
//  Routes.swift
//  rackcontroller-client
//
//  Created by Alice Di Nunno on 04/02/2022.
//

import Foundation

extension RackControllerClient {
    class Routes {
        static let healthRoute = "/health"
        
        static let authenticationRoute = "/authentication"
        static let createAuthenticationTokenRoute = "\(authenticationRoute)/token"
        static let jwtManagementRoute = "\(authenticationRoute)/jwt"
    
        static let projectsRoute = "/projects"
    }
}
