//
//  ZeroAndTakeoffView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 24/6/21.
//

import SwiftUI

struct HighlightView: View {
    var title: String
    var weightType: Int
    var indexUnit: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .italic()
                .bold()
            HStack {
                Text("\(weightType) kg")
                    .weightCapsule()
                  

                Spacer()
                Text("\(indexUnit, specifier: "%.1f") IU")
                    .weightCapsule()
            }
        }
        .loadedStyle()
    }
}


