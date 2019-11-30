//
//  Configuration.swift
//  bitriseIO
//
//  Created by Matthias Friese on 17.11.19.
//  Copyright © 2019 komoot. All rights reserved.
//

import Foundation

class Configuration {
    
    static let shared = Configuration()
    
    private(set) var authorizationToken: String
    
    private init() {
        #warning("build UI to enter token")
        self.authorizationToken = "mT1ilThbADGWfxtAyfQtsgpgYkN3PFujCcDe3FpBKwUwcUtmGHv-alFOlsm5DW_pmvKfk2R7saGqcM8LlEssyA"
    }
    
}
