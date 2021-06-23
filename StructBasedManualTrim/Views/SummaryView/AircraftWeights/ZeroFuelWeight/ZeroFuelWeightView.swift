//
//  ZeroFuelWeightView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 22/6/21.
//

import SwiftUI

struct ZeroFuelWeightView: View {

    @EnvironmentObject var cargoHold: CargoHold
    @EnvironmentObject var cabin: Cabin
    @EnvironmentObject var aircraft: Aircraft
    var zfwOverweight = false

    var zeroFuel: (weight: Int, indexUnti: Double) {
        let weight = aircraft.totalAdjustment.weight
            + cargoHold.totalAdjustment.weight
            + cabin.totalAdjustment.weight
        let indexUnit = aircraft.totalAdjustment.indexUnit
            + cargoHold.totalAdjustment.indexUnit
            + cabin.totalAdjustment.indexUnit

        return (weight, indexUnit)
    }



    var body: some View {
        WeightIndexFormatView(
            title: "\(aircraft.registration.rawValue)",
            weightType: zeroFuel.weight,
            indexUnit: zeroFuel.indexUnti)
    }
}



struct ZeroFuelWeightView_Previews: PreviewProvider {
    static var previews: some View {
        ZeroFuelWeightView()
    }
}
