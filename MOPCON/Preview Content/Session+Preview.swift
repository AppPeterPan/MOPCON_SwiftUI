//
//  Session+Preview.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/27.
//

import Foundation

extension Session {
    static var preview: Self {
        let response: ApiResponse<Session> = load("session 2022013.json")
        let session = response.data
        return session
        
    }
}
