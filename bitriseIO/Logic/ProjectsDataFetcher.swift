//
//  DataFetcher.swift
//  bitriseIO
//
//  Created by Matthias Friese on 17.11.19.
//  Copyright © 2019 komoot. All rights reserved.
//

import Foundation
import UIKit

class ProjectsDataFetcher: ObservableObject {
    @Published var projects : [BitriseProject] = []
    
    
    init() {
        loadProjects()
    }
    
    private func loadProjects() {
        guard let url = URL(string: "https://api.bitrise.io/v0.1/apps") else {
            assertionFailure()
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue(Configuration.shared.authorizationToken, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                do {
                    guard let data = data else {
                        print("no data. \(String(describing: error?.localizedDescription))")
                        return
                    }
                    let wrapper = try JSONDecoder().decode(ProjectWrapper.self, from: data)
                    DispatchQueue.main.async {
                        self.projects = wrapper.data
                    }
                } catch let parsingError {
                    print("error while parsing data. \(parsingError.localizedDescription)")
                }
            }.resume()
    }
    
    func loadAvatarImage(forProject project: BitriseProject) {
        var currentProject = project
        guard let urlString = project.avatarUrl, let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let image = UIImage(data: data) else {
                //something went wrong
                return
            }
            
            currentProject.avatarImage = image
        }
    }
}
