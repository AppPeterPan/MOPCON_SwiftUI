//
//  DateIntervalFormatter+Extension.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/27.
//

import Foundation

extension DateIntervalFormatter {
    static let hourMinFormatter = {
        let formatter = DateIntervalFormatter()
        formatter.dateTemplate = "HH:mm"
        return formatter
    }()
}
