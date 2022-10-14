//
//  SpeakerImage.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/29.
//

import SwiftUI
import NukeUI

struct SpeakerImage: View {
    let url: URL?
    
    var body: some View {
        LazyImage(url: url) { state in
            if let image = state.image {
                image
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .foregroundColor(.accentColor)
            }
        }
        .scaledToFill()
        .frame(width: 80, height: 80)
        .clipShape(Circle())
    }
}

struct SpeakerImage_Previews: PreviewProvider {
    static var previews: some View {
        SpeakerImage(url: Speaker.preview.imgURL)
            .previewLayout(.sizeThatFits)
    }
}
