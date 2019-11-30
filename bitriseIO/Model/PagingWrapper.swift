//
//  PagingWrapper.swift
//  bitrise io
//
//  Created by Matthias Friese on 16.11.19.
//  Copyright © 2019 komoot. All rights reserved.
//

import Foundation

struct Page: Decodable {
    let totalItemsCount: Int
    let pageItemLimit: Int
    
    enum PageKeys: String, CodingKey {
        case totalItemsCount = "total_item_count"
        case pageItemLimit = "page_item_limit"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: PageKeys.self)
        self.totalItemsCount = try values.decode(Int.self, forKey: .totalItemsCount)
        self.pageItemLimit = try values.decode(Int.self, forKey: .pageItemLimit)
    }
}

#warning("Try to extract this handling into a protocol")
struct ProjectWrapper: Decodable {
    let data: [BitriseProject]
    let paging: Page
    
    enum ProjectCodingKey : String, CodingKey {
        case data
        case paging
    }
}
