//
//  AdjustedOperatingWeightView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 22/6/21.
//

import SwiftUI

struct AdjustedOperatingWeightView: View {

    @EnvironmentObject var cabin: Cabin
    @EnvironmentObject var aircraft: Aircraft

    var adjustedOperating: (weight: Int, indexUnit: Double) {
        
        let weight = aircraft.totalAdjustment.weight
            + cabin.crewAndExtraSeatAdjustment.weight
        let indexUnit = aircraft.totalAdjustment.indexUnit
            + cabin.crewAndExtraSeatAdjustment.indexUnit

        return ( weight, indexUnit)
    }

    var body: some View {
        WeightIndexFormatView(
            title: aircraft.registration.rawValue,
            weightType: adjustedOperating.weight,
            indexUnit: adjustedOperating.indexUnit)
    }
}

struct AdjustedOperatingWeightView_Previews: PreviewProvider {
    static var previews: some View {
        AdjustedOperatingWeightView()
    }
}
