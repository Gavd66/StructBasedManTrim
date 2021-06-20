//
//  PotableWaterView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 20/6/21.
//

import SwiftUI

struct PotableWaterView: View {

    @EnvironmentObject var aircrart: Aircraft
    var body: some View {

        Picker("Water level", selection: $aircrart.potableWater) {
            ForEach(PotableWater.allCases, id: \.self) {
                Text("\($0.rawValue)")
            }
        }
    }
}

struct PotableWaterView_Previews: PreviewProvider {
    static var previews: some View {
        PotableWaterView()
    }
}
