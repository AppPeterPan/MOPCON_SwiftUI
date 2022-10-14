//
//  Session.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/26.
//

import Foundation

struct PeriodData: Decodable {
    let date: Date
    let period: [Period]
}

extension PeriodData: Hashable, Identifiable {
    var id: Self { self }
    
    static func == (lhs: PeriodData, rhs: PeriodData) -> Bool {
        lhs.date == rhs.date
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(date)
    }
}

struct Period: Decodable {
    let startedAt: Date
    let endedAt: Date?
    let event: String
    let room: [Session]
    var time: String {
        endedAt.map {
            DateIntervalFormatter.hourMinFormatter.string(from: startedAt, to: $0)
        } ?? ""
    }
}

extension Period: Identifiable {
    var id: Date { startedAt }
}

struct Session: Decodable {
    let topic: String
    let summary: String
    let speakers: [Speaker]
    let sessionId: Int
    let room: String
    let tags: [Tag]
    let startedAt: Date
    let endedAt: Date
    let floor: String?
    
    var time: String {
        DateIntervalFormatter.hourMinFormatter.string(from: startedAt, to: endedAt)
    }
    var speaker: Speaker { speakers[0] }
}

extension Session: Identifiable, Hashable {
    var id: Self { self }
    
    static func == (lhs: Session, rhs: Session) -> Bool {
        lhs.sessionId == rhs.sessionId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(sessionId)
    }
}

