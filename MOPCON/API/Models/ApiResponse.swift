//
//  ApiResponse.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/29.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let success: Bool
    let message: String
    let data: T
}
