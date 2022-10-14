//
//  CommonStyleModifier.swift
//  MOPCON
//
//  Created by Peter Pan on 2022/10/11.
//

import SwiftUI

struct CommonStyleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .background(Color.background)
            #if os(iOS)
            .toolbarBackground(.visible, for: .tabBar, .navigationBar)
            .toolbarBackground(Color.background, for: .tabBar, .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            #endif
    }
}

extension View {
    func commonStyle() -> some View {
        modifier(CommonStyleModifier())
    }
}
