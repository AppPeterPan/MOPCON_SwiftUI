//
//  Tag.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/29.
//

import Foundation

struct Tag: Decodable {
    let name: String
    let color: TagColor
}

struct TagColor: Decodable {
    let mobile: String
}
