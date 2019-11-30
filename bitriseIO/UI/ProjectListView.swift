//
//  ProjectListView.swift
//  bitrise io
//
//  Created by Matthias Friese on 16.11.19.
//  Copyright © 2019 komoot. All rights reserved.
//

import SwiftUI

struct ProjectListView: View {
    @ObservedObject var fetcher =  ProjectsDataFetcher()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fetcher.projects) { project in
                    HStack {
                        Image(uiImage: project.avatarImage)
                            .resizable()
                            .frame(width: 42.0, height: 42.0)
                        VStack(alignment: .leading) {
                            Text(project.title)
                            Text(project.projectType)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Home"))
        }
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        
        ProjectListView()
    }
}
