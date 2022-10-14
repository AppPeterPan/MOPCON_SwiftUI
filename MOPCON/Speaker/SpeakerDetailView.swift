//
//  SpeakerDetailView.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/29.
//

import SwiftUI

struct SpeakerDetailView: View {
    let speaker: Speaker

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 30) {
                VStack(spacing: 10) {
                    SpeakerImage(url: speaker.imgURL)
                    Text(speaker.name)
                    Text("\(speaker.jobTitle)@\(speaker.company)")
                        .foregroundColor(.gray)
                        .font(.caption)
                }
               
                if let link = speaker.link {
                    Link(destination: link) {
                        Image(systemName: "link")
                            .imageScale(.large)
                    }
                    .foregroundColor(.accentColor)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("關於講者")
                    Text(speaker.bio ?? "")
                }
                
                if let session = speaker.session {
                    SessionRow(session: session, showFloor: true, isSelected: false)
                }
            }
            .padding()
        }
        .navigationTitle("講者")
        .commonStyle()
    }
}

struct SpeakerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SpeakerDetailView(speaker: .preview)
                .previewCommonStyle(sizeThatFits: false)
        }
    }
}
