//
//  RackControllerServerConfig.swift
//  RackController-Client
//
//  Created by Alice Di Nunno on 30/01/2022.
//

import Foundation

class Settings: ObservableObject {
    public func set(_ value: Any?, forKey defaultName: String) {
        DispatchQueue.main.async {
            UserDefaults.standard.setValue(value, forKey: defaultName)
        }
    }
}

class ServerSettings: Settings {
    private var hostKey = "host"
    @Published var host: String {
        didSet {
            print("SET HOST")
            set(host, forKey: hostKey)
        }
    }
    
    private var portKey = "port"
    @Published var port: Int {
        didSet {
            print("SET PORT")
            set(port, forKey: portKey)
        }
    }
    
    
    private var userKey = "user"
    @Published var user: String {
        didSet {
            print("SET USER")
            set(user, forKey: "user")
        }
    }
    
    private var passwordKey = "password"
    @Published var password: String {
        didSet {
            print("SET PASS")
            set(password, forKey: passwordKey)
        }
    }
    
    private var hasServerInformationsKey = "hasServerInformations"
    @Published var hasServerInformations: Bool {
        didSet {
            set(hasServerInformations, forKey: hasServerInformationsKey)
        }
    }
    
    override init() {
        
        self.host = UserDefaults.standard.value(forKey: hostKey) as? String ?? ""
        self.port = UserDefaults.standard.integer(forKey: portKey) ?? 30000
        
        self.user = UserDefaults.standard.value(forKey: userKey) as? String ?? ""
        self.password = UserDefaults.standard.value(forKey: passwordKey) as? String ?? ""
        
        self.hasServerInformations = UserDefaults.standard.object(forKey: hasServerInformationsKey) as? Bool ?? false

        super.init()
    }
}
