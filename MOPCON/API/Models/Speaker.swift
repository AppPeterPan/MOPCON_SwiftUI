//
//  Speaker.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/26.
//

import Foundation

struct Speaker: Decodable {
    let speakerId: Int
    let name: String
    let jobTitle: String
    let company: String
    let img: Img
    let bio: String?
    let sessionId: Int?
    let tags: [Tag]?
    let topic: String?
    let summary: String?
    let room: String?
    let startedAt: Date?
    let endedAt: Date?
    let floor: String?
    let linkOther: String
    let linkFb: String
    let linkGithub: String
    let linkTwitter: String

    var imgURL: URL? {
        URL(string: "https://\(mopconHost)/\(img.mobile)")
    }
    
    var link: URL? {
        if let url = URL(string: linkOther) {
            return url
        } else if let url = URL(string: linkFb) {
            return url
        } else if let url = URL(string: linkGithub) {
            return url
        } else if let url = URL(string: linkTwitter) {
            return url
        } else {
            return nil 
        }
    }
    
    var session: Session? {
        if let topic,
           let summary,
           let sessionId,
           let room,
           let startedAt,
           let endedAt {
            return Session(topic: topic, summary: summary, speakers: [self], sessionId: sessionId, room: room, tags: tags ?? [], startedAt: startedAt, endedAt: endedAt, floor: floor)
        } else {
            return nil
        }
    }

}

extension Speaker: Identifiable {
    var id: Int { speakerId }
}

struct Img: Decodable {
    let mobile: String
}
