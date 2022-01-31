//
//  RackControllerServerConfig.swift
//  RackController-Client
//
//  Created by Alice Di Nunno on 30/01/2022.
//

import Foundation

class ServerSettings: ObservableObject {
    private var hostKey = "host"
    @Published var host: String {
        didSet {
            UserDefaults.standard.set(host, forKey: hostKey)
        }
    }
    
   private var portKey = "port"
   @Published var port: Int {
       didSet {
           UserDefaults.standard.set(port, forKey: portKey)
       }
   }
    
     
    private var userKey = "user"
    @Published var user: String {
        didSet {
            UserDefaults.standard.set(user, forKey: "user")
        }
    }
    
    private var passwordKey = "password"
    @Published var password: String {
        didSet {
            UserDefaults.standard.set(password, forKey: passwordKey)
        }
    }
     
    private var hasServerInformationsKey = "hasServerInformations"
    @Published var hasServerInformations: Bool {
        didSet {
            UserDefaults.standard.set(hasServerInformations, forKey: hasServerInformationsKey)
        }
    }
    
    init() {
        self.host = UserDefaults.standard.object(forKey: hostKey) as? String ?? ""
        self.port = UserDefaults.standard.object(forKey: portKey) as? Int ?? 30000
        
        self.user = UserDefaults.standard.object(forKey: userKey) as? String ?? ""
        self.password = UserDefaults.standard.object(forKey: passwordKey) as? String ?? ""
        
        self.hasServerInformations = UserDefaults.standard.object(forKey: hasServerInformationsKey) as? Bool ?? false
    }
}
