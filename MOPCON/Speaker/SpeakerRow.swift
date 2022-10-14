//
//  SpeakerRow.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/29.
//

import SwiftUI

struct SpeakerRow: View {
    let speaker: Speaker
    
    var body: some View {
        HStack {
            SpeakerImage(url: speaker.imgURL)
            SpeakerInfoView(speaker: speaker)
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.lightBlue, lineWidth: 1)
        )
    }
}

struct SpeakerRow_Previews: PreviewProvider {
    static var previews: some View {
        SpeakerRow(speaker: .preview)
            .padding()
            .previewCommonStyle(sizeThatFits: true)
    }
}

