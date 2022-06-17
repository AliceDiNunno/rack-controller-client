//
//  HomeView.swift
//  RackController-Client
//
//  Created by Alice Di Nunno on 30/01/2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject var client = RackControllerClient()
    @State private var selection = 2
    @State private var showingConnectionInformations = false
    
    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                Text("The content of the first view")
                  .tabItem {
                     Image(systemName: "square.grid.4x3.fill")
                     Text("Dashboard")
                   }
                  .tag(0)
                
                InfraView()
                  .tabItem {
                     Image(systemName: "xserve")
                     Text("Infra")
                  }
                  .tag(1)
                
                ProjectView()
                  .tabItem {
                     Image(systemName: "square.3.layers.3d.down.left")
                     Text("Projects")
                   }
                  .tag(2)
            }
            
            VStack {
                StatusDot().onTapGesture {
                    showingConnectionInformations = true
                }
                Spacer()
            }
        }.sheet(isPresented: $showingConnectionInformations) {
            ServerConfigurationEditView()
        }.environmentObject(client)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
