//
//  Client.swift
//  rackcontroller-client
//
//  Created by Alice Di Nunno on 04/02/2022.
//

import Foundation
import Alamofire

class RackControllerClient: ObservableObject {
    struct Response<ResponseObject: Codable>: Codable {
        var Success: Bool
        var Message: String
        var Host: String
        
        var Data: ResponseObject?
    }
    
    var settings = ServerSettings()

    static var routes = Routes()
    
    @Published var authentication: AuthenticationClient
    @Published var health: HealthClient
    @Published var projects: ProjectClient
    
    @Published var isConnected = false
    @Published var isAuthenticated = false

    var accessToken: String? = nil
    var jwtToken: String? = nil
    
    init() {
        authentication = AuthenticationClient()
        health = HealthClient()
        projects = ProjectClient()
        
        authentication.parent = self
        health.parent = self
        projects.parent = self
         
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(heartbeatTimer), userInfo: nil, repeats: true)
        
        heartbeatTimer()
    }
    
    @objc func heartbeatTimer() {
        health.getHealth(completion: {
            if $0.Success {
                self.isConnected = true
            }
            
            if !self.isAuthenticated {
                if self.accessToken == nil || self.accessToken == "" {
                    self.authentication.generateAuthToken(mail: self.settings.user, password: self.settings.password, completion: {
                        if let token = $0.Data?.AccessToken {
                            if token != "" {
                                self.accessToken = token
                            }
                        }
                    }, error: {
                      print($0)
                    })
                }
                else if self.jwtToken == nil || self.jwtToken == "" {
                    self.authentication.generateJWTToken(accessToken: self.accessToken!, completion: {
                        if let token = $0.Data?.JwtToken {
                            if token != "" {
                                self.jwtToken = token
                                self.isAuthenticated = true
                            }
                        }
                    }, error: {
                        self.accessToken = nil
                        print($0)
                    })
                }
            }
        }, error: {
            print($0)
            self.isConnected = false
        })
    }
}
