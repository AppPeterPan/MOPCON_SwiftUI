//
//  MOPCONError.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/26.
//

import Foundation

enum MOPCONError: Error {
    case urlError
    case missingData
    case networkError
    case unexpectedError(error: Error)
}
