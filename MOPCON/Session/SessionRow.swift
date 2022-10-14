//
//  SessionRow.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/27.
//

import SwiftUI

struct SessionRow: View {
    let session: Session
    let showFloor: Bool
    let isSelected: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Image(systemName: "airplane.circle")
                Text(session.time)
                    .foregroundColor(.lightBlue)
                Spacer()
                #if !os(watchOS)
                Image(systemName: "star")
                #endif
            }
            .foregroundColor(.accentColor)

            Text(session.topic)
                .bold()
            
            TagsView(tags: session.tags)
            
            HStack {
                Text(session.speaker.name)
                Spacer()
                Image(systemName: "mappin.circle")
                    .foregroundColor(.lightBlue)
                Text(session.room)
                if showFloor,
                   let floor = session.floor {
                    Text(floor)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.lightBlue, lineWidth: 1)
        )
        .padding()
        .background(isSelected ? Color.rowSelect : Color.background)
    }
}

struct SessionRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SessionRow(session: .preview, showFloor: false, isSelected: false)
                .previewDisplayName("Session Row without floor")
            SessionRow(session: .preview, showFloor: false, isSelected: true)
                .previewDisplayName("Session Row without floor(select)")
            SessionRow(session: .preview, showFloor: true, isSelected: false)
                .previewDisplayName("Session Row with floor")
        }
        .previewCommonStyle(sizeThatFits: true)
    }
}
