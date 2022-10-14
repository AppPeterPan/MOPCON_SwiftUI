//
//  PeriodRow.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/29.
//

import SwiftUI

struct PeriodRow: View {
    let period: Period
    
    var body: some View {
        HStack {
            if let _ = period.endedAt {
                Text(period.time)
                Spacer()
                Text(period.event)
            } else {
                Text(period.event)
            }
        }
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(.gray)
        .cornerRadius(6)
        
    }
}

struct PeriodRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PeriodRow(period: .open)
                .previewDisplayName("PeriodRow open")
            PeriodRow(period: .end)
                .previewDisplayName("PeriodRow end")
        }
        .padding()
        .previewCommonStyle(sizeThatFits: true)
    }
}
