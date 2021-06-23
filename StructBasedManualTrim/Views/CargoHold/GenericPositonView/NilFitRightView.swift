//
//  NilFitRightView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 23/6/21.
//

import SwiftUI

struct NilFitRightView: View {
    var position: Int
    var body: some View {
        HStack {
            Spacer()
            Text("\(position)R  NIL FIT")
                .nilFitStyle()
            Spacer()
        }
    }
}

