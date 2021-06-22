//
//  AdjustmentView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 22/6/21.
//

import SwiftUI

struct AdjustmentView: View {

    @EnvironmentObject var cabin: Cabin
    @EnvironmentObject var aircraft: Aircraft

    var body: some View {
        VStack(spacing: 15) {

            if cabin.jumpseat != .none {
                WeightIndexFormatView(
                    title: "Jumpseat Use",
                    weightType: cabin.jumpseat.numbers.weight,
                    indexUnit: cabin.jumpseat.numbers.indexUnit)
            }
            if cabin.cabinCrew != .nine {
                WeightIndexFormatView(
                    title: "Cabin Crew Numbers",
                    weightType: cabin.cabinCrew.numbers.weight,
                    indexUnit: cabin.cabinCrew.numbers.indexUnit)
            }
            if cabin.moveCabinCrew == true {
                WeightIndexFormatView(
                    title: "Cabin Crew Shift",
                    weightType: cabin.cabinCrewShift.weight,
                    indexUnit: cabin.cabinCrewShift.indexUnit)
            }
            if cabin.instrumentOnSeat == true {
                WeightIndexFormatView(
                    title: "Musical Instrument",
                    weightType: cabin.instrument.number.weight,
                    indexUnit: cabin.instrument.number.indexUnit)
            }
            if cabin.serviceDogInCabin == true {
                WeightIndexFormatView(
                    title: "Service Dog",
                    weightType: cabin.serviceDogNumber.weight,
                    indexUnit: cabin.serviceDogNumber.indexUnit)
            }
            if cabin.oversizePaxInCabin == true {
                WeightIndexFormatView(
                    title: "Oversize Pax",
                    weightType: cabin.oversizePaxNumber.weight,
                    indexUnit: cabin.oversizePaxNumber.indexUnit)
            }
            if aircraft.galleyConfiguration != .dom {
                WeightIndexFormatView(
                    title: "Galley Configuration",
                    weightType: aircraft.galleyConfiguration.details.weight,
                    indexUnit: aircraft.galleyConfiguration.details.indexUnit)
            }
            if aircraft.potableWater != .from284Litres {
                WeightIndexFormatView(
                    title: "Potable Water",
                    weightType: aircraft.potableWater.amount.weight,
                    indexUnit: aircraft.potableWater.amount.indexUnit)
            }

            if  cabin.jumpseat == .none
                && cabin.cabinCrew == .nine
                && cabin.moveCabinCrew == false
                && cabin.instrumentOnSeat == false
                && cabin.serviceDogInCabin == false
                && cabin.oversizePaxInCabin == false
                && aircraft.galleyConfiguration == .dom
                && aircraft.potableWater == .from284Litres {
                Text("No Adjustments")
                    .nilFitStyle()
            }
        }// master VStack
    }
}

struct AdjustmentView_Previews: PreviewProvider {
    static var previews: some View {
        AdjustmentView()
    }
}
