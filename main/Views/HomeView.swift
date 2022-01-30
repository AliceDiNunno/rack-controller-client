//
//  HomeView.swift
//  RackController-Client
//
//  Created by Alice Di Nunno on 30/01/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            Text("The content of the first view")
              .tabItem {
                 Image(systemName: "square.grid.4x3.fill")
                 Text("Dashboard")
               }
            
            InfraView()
              .tabItem {
                 Image(systemName: "xserve")
                 Text("Infra")
              }
            
            Text("The content of the second view")
              .tabItem {
                 Image(systemName: "square.3.layers.3d.down.left")
                 Text("Projects")
               }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}