//
//  NilFitLeftView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 23/6/21.
//

import SwiftUI

struct NilFitLeftView: View {

    var position: Int
    var body: some View {
        HStack {
            Spacer()
            Text("\(position)L  NIL FIT")
                .nilFitStyle()
            Spacer()
        }
    }
}

