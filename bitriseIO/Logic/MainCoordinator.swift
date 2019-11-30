//
//  MainCoordinator.swift
//  bitrise io
//
//  Created by Matthias Friese on 16.11.19.
//  Copyright © 2019 komoot. All rights reserved.
//

import UIKit
import SwiftUI

class MainCoordinator {
    
    private let window: UIWindow
    private lazy var projectListView: ProjectListView = {
        // Create the SwiftUI view that provides the window contents.
        let projectListView = ProjectListView()
        return projectListView
    }()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
        window.rootViewController = UIHostingController(rootView: projectListView)
    }
    
}
