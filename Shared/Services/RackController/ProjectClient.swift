//
//  ProjectClient.swift
//  rackcontroller-client
//
//  Created by Alice Di Nunno on 06/02/2022.
//

import Foundation

extension RackControllerClient {
    class ProjectClient {
        var parent: RackControllerClient?
        
        struct ProjectListResponse: Codable {
            var ID: String
            var DisplayName: String
            var Slug: String
            var EventKey: String
            var UserID: String
        }
        
        func getProjects(completion: @escaping (Response<[ProjectListResponse]>) -> (), error errcompletion: ((String) -> ())? = nil) {
            parent?.getFromApi(route: RackControllerClient.Routes.projectsRoute, completion: completion, error: errcompletion)
        }
    }
}
