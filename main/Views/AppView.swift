//
//  AppView.swift
//  Shared
//
//  Created by Alice Di Nunno on 30/01/2022.
//

import SwiftUI

struct AppView: View {
    @StateObject private var serverConfiguration = ServerSettings()
    
    var body: some View {
        HStack {
            if serverConfiguration.hasServerInformations {
                HomeView()
            } else {
                ServerConfigurationEditView()
            }
        }.environmentObject(serverConfiguration)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
