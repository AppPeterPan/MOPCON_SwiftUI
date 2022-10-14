//
//  SpeakersView.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/29.
//

import SwiftUI

struct SpeakersView: View {
    @StateObject var provider = SpeakersProvider()
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(provider.speakers) { speaker in
                        ZStack {
                            SpeakerRow(speaker: speaker)
                            NavigationLink {
                                SpeakerDetailView(speaker: speaker)
                            } label: {
                                EmptyView()
                            }
                            .opacity(0)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.background)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("講者")
            .commonStyle()
            .task {
                if provider.speakers.isEmpty {
                    do {
                        try await provider.fetch()
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
}

struct SpeakersView_Previews: PreviewProvider {
    static var previews: some View {
        SpeakersView(provider: SpeakersProvider(apiEnvironment: .local))
            .previewCommonStyle(sizeThatFits: false)
    }
}
