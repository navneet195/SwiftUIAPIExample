//
//  Constants.swift
//  SwiftUIAPIExample
//
//  Created by Navnit Baldha on 17/11/19.
//  Copyright © 2019 Navneet. All rights reserved.
//

import Foundation
import UIKit

// Applicaiton Shared Secret Key
var appSecretKey = "api-key=qt2ggwWhoc559LcNCbKd4SI40tvbRiaS"
var appApiKey = "98b027a2-fd56-41c5-ad13-9c4e01a1e317"

// Userdefaults
var userdefaults = UserDefaults.standard
var imageName = "Default.png"


// Navigation Title Name
var listViewName = "Top Stories"
var detailViewName = "Top Stories Detail"

// Application API Request
var applicationJosn = "application/json"
var acceptType = "Accept"

struct Constants {
    
    static let apiUrl = "https://api.nytimes.com/svc/"
    static let versionApi = "topstories/v2/science.json?"
    
}

class CellName {
    static let articleTableviewCell = "ArticleTableviewCell"
}
