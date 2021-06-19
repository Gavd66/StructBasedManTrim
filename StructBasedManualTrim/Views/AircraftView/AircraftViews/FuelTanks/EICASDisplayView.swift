//
//  EICASDisplayView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 19/6/21.
//

import SwiftUI

struct EICASDisplayView: View {
    @EnvironmentObject var aircraft: Aircraft
    var body: some View {

        HStack(spacing: 5) {
            if aircraft.hasFuelLoaded {
                HStack {
                    Spacer()
                    Text("Total Fuel")
                    Text("\(aircraft.totalFuel)")
                    Text("KG")
                    Spacer()
                }
                .loadedStyle()
                .capsuleStyle()
            } else {
                Text("No Fuel Loaded")
                    .nilFitStyle()
            }
        }
        .font(.system(size: 18))
    }
}

struct EICASDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        EICASDisplayView()
    }
}
