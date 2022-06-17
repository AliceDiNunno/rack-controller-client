//
//  ProjectView.swift
//  rackcontroller-client
//
//  Created by Alice Di Nunno on 06/02/2022.
//

import SwiftUI

class Poller<T: Codable>: ObservableObject {
    @Published var data: T? = nil
    
    init() {
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        
        timer.fire()
    }
    
    var apiCallback: ((@escaping (RackControllerClient.Response<T>)->(), ((String) -> ())?) -> ())? = nil
    
    @objc func fireTimer() {
        apiCallback?({
            self.data = $0.Data
            debugPrint(self.data)
        }, {
            debugPrint($0)
        })
    }
}

struct ProjectDetail: View {
    var body: some View {
        Text("Detail")
    }
}

struct ProjectView: View {
    @EnvironmentObject var client: RackControllerClient
    @StateObject var projectPoller = Poller<[RackControllerClient.ProjectClient.ProjectListResponse]>()
    
    var body: some View {
        NavigationView {
            HStack {
                if projectPoller.data == nil {
                    Text("No projects...")
                } else {
                    List(projectPoller.data!, id: \.ID) { item in
                        NavigationLink(destination: ProjectDetail()) {
                            Text(item.DisplayName)
                        }
                    }
                    
                }
            }.navigationTitle("Projects")
        }.onAppear {
            projectPoller.apiCallback = client.projects.getProjects
        }
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
    }
}
