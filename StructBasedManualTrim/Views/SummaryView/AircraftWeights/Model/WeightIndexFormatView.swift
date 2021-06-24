//
//  WeightIndexFormatView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 21/6/21.
//

import SwiftUI

struct WeightIndexFormatView: View {

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
                Spacer()
                Text("\(indexUnit, specifier: "%.1f") IU")
            }
        }
    }
}


