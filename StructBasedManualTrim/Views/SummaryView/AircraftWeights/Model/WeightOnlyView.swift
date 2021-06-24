//
//  WeightOnlyView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 24/6/21.
//

import SwiftUI

struct WeightOnlyView: View {

    var title: String
    var weightType: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .italic()
                .bold()
            HStack {
                Text("\(weightType) kg")
                Spacer()
            }
        }
    }
}



