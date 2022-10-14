//
//  PreviewCommonStyleModifier.swift
//  MOPCON
//
//  Created by Peter Pan on 2022/10/11.
//

import SwiftUI

struct PreviewCommonStyleModifier: ViewModifier {
    let sizeThatFits: Bool
    
    func body(content: Content) -> some View {
        content
            .background(Color.background)
            .previewLayout(sizeThatFits ? .sizeThatFits : .device)
            .preferredColorScheme(.dark)
    }
    
}

extension View {
    func previewCommonStyle(sizeThatFits: Bool) -> some View {
        modifier(PreviewCommonStyleModifier(sizeThatFits: sizeThatFits))
    }
}
