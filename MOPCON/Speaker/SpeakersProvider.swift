//
//  SpeakersProvider.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/29.
//

import Foundation

@MainActor
class SpeakersProvider: ObservableObject {
    @Published var speakers: [Speaker] = []
    private let apiEnvironment: APIEnvironment

    init(apiEnvironment: APIEnvironment = .network) {
        self.apiEnvironment = apiEnvironment
    }
    
    func fetch() async throws {
        let response = try await GetSpeakersRequest().send(apiEnvironment: apiEnvironment)
        speakers = response.data
    }
}
