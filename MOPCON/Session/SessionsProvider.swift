//
//  SessionsProvider.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/26.
//

import Foundation

@MainActor
class SessionsProvider: ObservableObject {
    @Published var periodDataArray: [PeriodData] = []
    private let apiEnvironment: APIEnvironment

    init(apiEnvironment: APIEnvironment = .network) {
        self.apiEnvironment = apiEnvironment
    }
    
    func fetch() async throws {
        let response = try await GetSessionsRequest().send(apiEnvironment: apiEnvironment)
        periodDataArray = response.data
    }
}
