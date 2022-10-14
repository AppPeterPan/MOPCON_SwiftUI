//
//  PeriodPicker.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/30.
//

import SwiftUI

struct PeriodPicker: View {
    @Binding var periodData: PeriodData?
    let periodDataArray: [PeriodData]

    var body: some View {
        Picker("日期", selection: $periodData) {
            ForEach(periodDataArray) {
                Text($0.date.formatted(.dateTime.month(.defaultDigits).day()))
                    .tag($0 as PeriodData?)
            }
        }
        #if os(watchOS)
        .pickerStyle(.navigationLink)
        .frame(height: 40)
        #else
        .pickerStyle(.segmented)
        #endif
    }
}

struct PeriodPicker_Previews: PreviewProvider {
    static var previews: some View {
        let periodDataArray = [
            PeriodData(date: Date(timeIntervalSince1970: 1665763200), period: []),
            PeriodData(date: Date(timeIntervalSince1970: 1665849600), period: [])
        ]
        PeriodPicker(periodData: .constant(periodDataArray.first!), periodDataArray: periodDataArray)
            .padding()
            .previewCommonStyle(sizeThatFits: true)
    }
}
