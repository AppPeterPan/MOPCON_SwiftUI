//
//  SessionDetailView.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/25.
//

import SwiftUI

struct SessionDetailView: View {
    let session: Session
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                let speaker = session.speaker
                SpeakerImage(url: speaker.imgURL)
                    .padding(.top, 20)
                VStack {
                    Text(speaker.name)
                    Text("\(speaker.jobTitle)@\(speaker.company)")
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                VStack(alignment: .leading, spacing: 14) {
                    #if os(watchOS)
                    let space = 5.0
                    #else
                    let space = 30.0
                    #endif
                    HStack(spacing: space) {
                        Label {
                            Text(session.time)
                        } icon: {
                            Image(systemName: "clock")
                                .foregroundColor(.lightBlue)
                        }
                        Label {
                            Text(session.room)
                        } icon: {
                            Image(systemName: "mappin.circle")
                                .foregroundColor(.lightBlue)
                        }
                    }
                    #if os(watchOS)
                    .font(.system(size: 12))
                    #endif
                    Text(session.topic)
                    TagsView(tags: session.tags)
                }
                Divider()
                    .overlay(.white)
                
                Text(session.summary)
            }
            .padding(.horizontal)
        }
        .navigationTitle("演講資訊")
        .commonStyle()
    }
}

struct SessionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SessionDetailView(session: .preview)
                .previewCommonStyle(sizeThatFits: false)
        }
    }
}
