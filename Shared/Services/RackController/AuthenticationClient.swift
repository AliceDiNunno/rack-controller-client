//
//  AuthenticationClient.swift
//  RackController-Client
//
//  Created by Alice Di Nunno on 30/01/2022.
//

import Foundation

class AuthenticationClient: ObservableObject {
    @Published var isConnected = false
    @Published var isAuthenticated = false
    
    var timer: Timer? = nil
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        fireTimer()
    }
    
    @objc func fireTimer() {
        if isConnected {
            if !isAuthenticated {
                isAuthenticated.toggle()
            } else {
                isConnected.toggle()
            }
        } else {
            isConnected.toggle()
        }
    }
}
