//
//  TestDownloader.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/27.
//

import Foundation

class TestDownloader: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000...500_000_000))
        let fileUrl: URL
        switch url.lastPathComponent {
        case "session":
            fileUrl = Bundle.main.url(forResource: "session.json", withExtension: nil)!
        case "speaker":
            fileUrl = Bundle.main.url(forResource: "speaker.json", withExtension: nil)!
        default:
            fatalError("wrong url")
        }
        return try Data(contentsOf: fileUrl)
    }
}
