//
//  APIService.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/26.
//

import Foundation

struct GetSessionsRequest: APIRequest {
    let path = "session"
    typealias Response = ApiResponse<[PeriodData]>
}

// 此 App 沒用到
struct GetSessionDetailRequest: APIRequest {
    var path: String { "session/\(id)" }
    let id: Int
    typealias Response = ApiResponse<Session>
}

struct GetSpeakersRequest: APIRequest {
    let path = "speaker"
    typealias Response = ApiResponse<[Speaker]>
}

