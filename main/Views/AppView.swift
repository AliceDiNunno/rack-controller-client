//
//  AppView.swift
//  Shared
//
//  Created by Alice Di Nunno on 30/01/2022.
//

import SwiftUI

struct AppView: View {
    @StateObject var serverConfiguration = Configuration.ServerConfiguration()
    
    var body: some View {
        if serverConfiguration.hasServerInformations {
            HomeView()
        } else {
            ServerConfigurationEditView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
