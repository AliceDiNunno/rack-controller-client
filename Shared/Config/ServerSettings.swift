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
            save()
        }
    }
    
    private var portKey = "port"
    @Published var port: Int {
        didSet {
            save()
        }
    }
    
    
    private var userKey = "user"
    @Published var user: String {
        didSet {
            save()
        }
    }
    
    private var passwordKey = "password"
    @Published var password: String {
        didSet {
            save()
        }
    }
    
    private var hasServerInformationsKey = "hasServerInformations"
    @Published var hasServerInformations: Bool {
        didSet {
            save()
        }
    }
    
    override init() {
        self.host = UserDefaults.standard.value(forKey: hostKey) as? String ?? ""
        self.port = UserDefaults.standard.integer(forKey: portKey)
        
        self.user = UserDefaults.standard.value(forKey: userKey) as? String ?? ""
        self.password = UserDefaults.standard.value(forKey: passwordKey) as? String ?? ""
        
        self.hasServerInformations = UserDefaults.standard.object(forKey: hasServerInformationsKey) as? Bool ?? false
        
        super.init()
    }
         
    func save() {
        set(hasServerInformations, forKey: hasServerInformationsKey)
        set(host, forKey: hostKey)
        set(port, forKey: portKey)
        set(user, forKey: userKey)
        set(password, forKey: passwordKey)
    }
}
