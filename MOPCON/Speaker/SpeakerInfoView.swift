//
//  SpeakerInfoView.swift
//  MOPCON
//
//  Created by Peter Pan on 2022/10/8.
//

import SwiftUI

struct SpeakerInfoView: View {
    let speaker: Speaker
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(speaker.name)
                .padding(.bottom, 10)
            Text(speaker.jobTitle)
                .foregroundColor(.gray)
                .font(.caption)
            TagsView(tags: speaker.tags ?? [])
        }
    }
}


struct SpeakerInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SpeakerInfoView(speaker: .preview)
            .padding()
            .previewCommonStyle(sizeThatFits: true)
    }
}
