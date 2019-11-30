//
//  BitriseProject.swift
//  bitrise io
//
//  Created by Matthias Friese on 16.11.19.
//  Copyright © 2019 komoot. All rights reserved.
//

import Foundation
import UIKit

struct BitriseProject: Decodable,
    Identifiable {
    
    struct Owner: Decodable {
        let name: String
        let accountType: String
        
        enum CodingKeys: String, CodingKey {
            case name
            case accountType = "account_type"
        }
    }
    
    let id: String
    let title: String
    let status: Int
    let isDisabled: Bool
    let avatarUrl: String?
    let isPublic: Bool
    let projectType: String
    let owner: Owner
    var avatarImage: UIImage = UIImage(systemName: "person.circle")!
    
    enum CodingKeys: String, CodingKey {
        case id = "slug"
        case title
        case status
        case isDisabled = "is_disabled"
        case avatarUrl = "avatar_url"
        case isPublic = "is_public"
        case projectType = "project_type"
        case owner
    }
}
