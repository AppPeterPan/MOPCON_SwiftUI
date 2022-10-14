//
//  Period+Preview.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/29.
//

import Foundation

extension Period {
    static var open: Self {
        Period(startedAt: Date(timeIntervalSince1970: 1665794700), endedAt: Date(timeIntervalSince1970: 1665795600), event: "開幕 Opening", room: [])
    }
    static var end: Self {
        Period(startedAt: Date(timeIntervalSince1970: 1665913500), endedAt: nil, event: "END", room: [])
    }
}
