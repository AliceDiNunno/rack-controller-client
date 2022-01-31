//
//  ServerConfigurationEditView.swift
//  RackController-Client
//
//  Created by Alice Di Nunno on 30/01/2022.
//

import Foundation
import SwiftUI

struct ServerConfigurationEditView: View {
    @EnvironmentObject var serverConfiguration: ServerSettings
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Username", text: $serverConfiguration.user)
            }
            .navigationBarTitle("Server configuration")
        }
    }
}

struct ServerConfigurationEditView_Previews: PreviewProvider {
    static var previews: some View {
        InfraView()
    }
}
