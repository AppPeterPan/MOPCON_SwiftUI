//
//  APIRequest.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/26.
//

import Foundation

let mopconHost = "mopcon.org"

protocol APIRequest {
    associatedtype Response
    var path: String { get }
    var request: URLRequest { get }
}

extension APIRequest {
    var host: String { mopconHost }
}

extension APIRequest {
    var request: URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = "/api/2022/\(path)"
        let request = URLRequest(url: components.url!)
        return request
    }
}

extension APIRequest where Response: Decodable {
    func send(apiEnvironment: APIEnvironment = .network) async throws -> Response {
        guard let url = request.url else { throw MOPCONError.urlError }
        let downloader: any HTTPDataDownloader = apiEnvironment == .network ? URLSession.shared : TestDownloader()
        let data = try await downloader.httpData(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        return try decoder.decode(Response.self, from: data)
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
