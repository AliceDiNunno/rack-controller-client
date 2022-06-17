//
//  StatusDot.swift
//  rackcontroller-client (iOS)
//
//  Created by Alice Di Nunno on 02/02/2022.
//

import Foundation
import SwiftUI

struct StatusDot: View {
    @EnvironmentObject var service: RackControllerClient
 
    var body: some View {
        if !(service.isConnected && service.isAuthenticated) {
            Image(systemName: "circle.dashed")
                .foregroundColor((service.isConnected ? (service.isAuthenticated ? .green : .yellow) : .red))
                .frame(width: 25, height: 25).padding(15)
        }
    }
}
