//
//  CabinView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 22/6/21.
//

import SwiftUI

struct CabinView: View {

    @EnvironmentObject var cabin: Cabin
    var body: some View {
        VStack(spacing: 15) {
            if cabin.zone1Weight != 0 {
                WeightIndexFormatView(
                    title: "Zone 1",
                    weightType: cabin.zone1Weight,
                    indexUnit: cabin.indexUnitZone1)
            }
            if cabin.zone2.ecconomyWeight != 0 {
                WeightIndexFormatView(
                    title: "Zone 2",
                    weightType: cabin.zone2.ecconomyWeight,
                    indexUnit: cabin.indexUnitZone2)
            }
            if cabin.zone3.ecconomyWeight != 0 {
                WeightIndexFormatView(
                    title: "Zone 3",
                    weightType: cabin.zone3.ecconomyWeight,
                    indexUnit: cabin.indexUnitZone3)
            }
            if cabin.zone4.ecconomyWeight != 0 {
                WeightIndexFormatView(
                    title: "Zone 4",
                    weightType: cabin.zone4.ecconomyWeight,
                    indexUnit: cabin.indexUnitZone4)
            }

            if cabin.zone1Weight == 0
                && cabin.zone2.ecconomyWeight == 0
                && cabin.zone3.ecconomyWeight == 0
                && cabin.zone4.ecconomyWeight == 0 {
                HStack {
                    Spacer()
                    Text("No Pax")
                    Spacer()
                }
                .nilFitStyle()

            }

        }
    }
}

struct CabinView_Previews: PreviewProvider {
    static var previews: some View {
        CabinView()
    }
}
