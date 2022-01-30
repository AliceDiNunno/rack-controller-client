//
//  RackControllerServerConfig.swift
//  RackController-Client
//
//  Created by Alice Di Nunno on 30/01/2022.
//

import Foundation

extension Configuration {
    struct Server: Codable {
        var Host: String
        var Port: Int
        
        var User: String
        var Password: String
    }

    class ServerConfiguration: ConfigCore<Server> {
        let storedServerConfigurationKey = "RackControllerServerConfiguration"

        @Published var hasValidServerInformations = false
        
        init() {
            super.init(configKey: storedServerConfigurationKey)
            
            hasValidServerInformations = getConfiguration() != nil
        }
    }
}
