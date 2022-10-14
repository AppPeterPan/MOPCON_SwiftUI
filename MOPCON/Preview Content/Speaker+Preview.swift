//
//  Speaker+Preview.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/29.
//

import Foundation

extension Speaker {
    static var preview: Self {
        let response: ApiResponse<Speaker> = load("speaker 214.json")
        return response.data
    }
}
