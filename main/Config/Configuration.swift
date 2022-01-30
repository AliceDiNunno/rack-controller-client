//
//  Configuration.swift
//  RackController-Client
//
//  Created by Alice Di Nunno on 30/01/2022.
//

import Foundation
 
class Configuration {
    internal class ConfigCore<T: Codable>: ObservableObject {
        private let defaults = UserDefaults.standard
        let configKey: String

        
        init(configKey: String) {
            self.configKey = configKey
             
        }
        
        public func getConfiguration() -> T? {
            if let savedConfigurationObject = defaults.object(forKey: configKey) as? Data {
                let decoder = JSONDecoder()
                if let configurationObject = try? decoder.decode(T.self, from: savedConfigurationObject) {
                    return configurationObject
                }
            }
            return nil
        }
        
        public func saveConfiguration(configuration: T) {
            let encoder = JSONEncoder()
            if let configurationObject = try? encoder.encode(configuration) {
                defaults.set(configurationObject, forKey: configKey)
            } 
        }
    }
}
