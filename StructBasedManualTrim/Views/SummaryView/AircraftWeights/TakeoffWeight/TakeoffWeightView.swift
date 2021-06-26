//
//  TakeoffWeightView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 24/6/21.
//

import SwiftUI

struct TakeoffWeightView: View {

    @EnvironmentObject var cargo: CargoHold
    @EnvironmentObject var cabin: Cabin
    @EnvironmentObject var aircraft: Aircraft

    var jet: Jet {
        Jet(cargo: cargo, cabin: cabin, aircraft: aircraft)
    }
    var body: some View {
        WeightOnlyView(title: "Taxi Fuel",
                       weightType: 400)
        if aircraft.nonStandardFuelDistribution {
            WeightIndexFormatView(title: "Left Tank TakeOff Fuel",
                                  weightType: aircraft.leftTankTakeoff.weight,
                                  indexUnit: aircraft.leftTankTakeoff.indexUnit)
            WeightIndexFormatView(title: "Centre Tank Takeoff Fuel",
                                  weightType: aircraft.centreTankTakeoff.weight,
                                  indexUnit: aircraft.centreTankTakeoff.indexUnit)
            WeightIndexFormatView(title: "Right Tank Takeoff Fuel",
                                  weightType: aircraft.rightTankTakeoff.weight,
                                  indexUnit: aircraft.rightTankTakeoff.indexUnit)
        }
        WeightIndexFormatView(title: "Takeoff Fuel",
                              weightType: jet.takeoffFuel.weight,
                              indexUnit: jet.takeoffFuel.indexUnit)
        HighlightView(title: "Takeoff Weight",
                      weightType: jet.takeoff.weight,
                      indexUnit: jet.takeoff.indexUnit)

    }
}

struct TakeoffWeightView_Previews: PreviewProvider {
    static var previews: some View {
        TakeoffWeightView()
    }
}
