//
//  StatusDot.swift
//  rackcontroller-client (iOS)
//
//  Created by Alice Di Nunno on 02/02/2022.
//

import Foundation
import SwiftUI

struct StatusDot: View {
    @EnvironmentObject var authentication: AuthenticationClient
    
    var body: some View {
        Circle()
            .fill((authentication.isConnected ? (authentication.isAuthenticated ? .green : .yellow) : .red))
            .frame(width: 5, height: 5)
    }
}
