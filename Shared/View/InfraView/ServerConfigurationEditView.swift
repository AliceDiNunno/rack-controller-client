//
//  ServerConfigurationEditView.swift
//  RackController-Client
//
//  Created by Alice Di Nunno on 30/01/2022.
//

import Foundation
import SwiftUI

struct ValidableField: View {
    var placeHolder: String
    @Binding var text: String
    var body: some View {
        HStack {
            TextField(placeHolder, text: $text)
            .onChange(of: text) {
                print($0)
            }
            Spacer()
            Image(systemName: "plus")
        }
    }
}

struct ServerConfigurationEditView: View {
    @EnvironmentObject var serverConfiguration: ServerSettings
    
    var body: some View {
        Form {
            Section(header: Text("Server")) {
                TextField("Host", text: $serverConfiguration.host)
                TextField("Port", value: $serverConfiguration.port, formatter: NumberFormatter())
            }
            Section(header: Text("Credentials")) {
                TextField("Username", text: $serverConfiguration.user)
                SecureField("Password", text: $serverConfiguration.password)
            }
        }
        .navigationBarTitle("Server configuration")
        .navigationBarItems(trailing: HStack {
            Button("Done") {
                serverConfiguration.save()
                serverConfiguration.hasServerInformations = true
            }
        })
    }
}

struct ServerConfigurationEditView_Previews: PreviewProvider {
    static var previews: some View {
        InfraView()
    }
}
