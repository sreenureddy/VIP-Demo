//
//  WorkmateAPI.swift
//  WorkmateDemo
//
//  Created by tmprf6 on 13/2/20.
//  Copyright © 2020 sreenu ramana. All rights reserved.
//

import Foundation

struct WorkmateAPI {
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.helpster.tech/v1") else {
            fatalError("base url could not configured")
        }
        return url
    }
    
    var loginAPI: URL {
        let url: URL = baseURL.appendingPathComponent("/auth/login/")
        return url
    }
    
    var staffRequest: URL {
        let url: URL = baseURL.appendingPathComponent("/staff-requests/26074/")
        return url
    }
    
    var clockIn: URL {
        let url: URL = baseURL.appendingPathComponent("/staff-requests/26074/clock-in/")
        return url
    }
    
    var clockOut: URL {
        let url: URL = baseURL.appendingPathComponent("/staff-requests/26074/clock-out/")
        return url
    }
}
