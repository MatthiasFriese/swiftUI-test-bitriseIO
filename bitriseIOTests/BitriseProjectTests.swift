//
//  BitriseProjectTests.swift
//  bitrise ioTests
//
//  Created by Matthias Friese on 16.11.19.
//  Copyright © 2019 komoot. All rights reserved.
//

import XCTest
@testable import bitriseIO

class BitriseProjectTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParseProjectData() {
        let path = Bundle(for: BitriseProjectTests.self).path(forResource: "Apps", ofType: "json")
        let fileUrl = URL(fileURLWithPath: path!)
        let jsonData = try! Data(contentsOf: fileUrl)
        
        let decoder = JSONDecoder()
        do {
            let wrapper = try decoder.decode(ProjectWrapper.self, from: jsonData)
            
            XCTAssertNotNil(wrapper)
            XCTAssertEqual(3, wrapper.data.count)

            let sortedProjects = wrapper.data.sorted { (project1, project2) -> Bool in
                project1.slug < project2.slug
            }
            let firstProject = sortedProjects.first
            
            XCTAssertNotNil(firstProject)
            
            XCTAssertEqual(firstProject!.slug, "2a36eaa0fbcab183")
            
        } catch let error {
            print(error)
        }
        
    }

}
