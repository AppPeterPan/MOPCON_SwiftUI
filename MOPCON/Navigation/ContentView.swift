//
//  ContentView.swift
//  MOPCON
//
//  Created by Peter Pan on 2022/10/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SessionsView()
                .tabItem {
                    Label("議程", systemImage: "calendar")
                }
            SpeakersView()
                .tabItem {
                    Label("講者", systemImage: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
