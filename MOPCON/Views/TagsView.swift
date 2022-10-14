//
//  TagsView.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/29.
//

import SwiftUI

struct TagsView: View {
    let tags: [Tag]

    var body: some View {
        #if os(watchOS)
        let columnCount = 1
        #else
        let columnCount = 2
        #endif
        VStack(alignment: .leading) {
            let rowCount = (tags.count + 1) / columnCount
            ForEach(0..<rowCount, id: \.self) { rowNumber in
                HStack {
                    let range = calculateRange(columnCount: columnCount, rowNumber: rowNumber)
                    ForEach(range, id: \.self) { index in
                        Text(tags[index].name)
                            .lineLimit(1)
                            #if os(watchOS)
                            .font(.system(size: 12))
                            #else
                            .font(.system(size: 15))
                            #endif
                            .padding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
                            .background(
                                Capsule()
                                    .foregroundColor(.lightBlue)
                            )
                    }
                }
            }
        }
    }
    
    func calculateRange(columnCount: Int, rowNumber: Int) -> Range<Int> {
        let start = columnCount * rowNumber
        var end = columnCount * (rowNumber+1)
        if end > tags.count {
            end -= 1
        }
        return start..<end
    }
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(tags: Session.preview.tags)
            .padding()
            .previewCommonStyle(sizeThatFits: true)
    }
}
