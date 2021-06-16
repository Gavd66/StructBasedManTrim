//
//  TotalEcconomyModel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 13/6/21.
//

import SwiftUI

struct YTotals: View {

    @EnvironmentObject var cabin: Cabin
    var zone: Pax
    var zoneLimit: SeatingLogic

    var body: some View {

        VStack(alignment: .center) {
            HStack {
                Spacer()
                Text("\(zoneLimit.rawValue)")
                    .italic()
                    .bold()
                Spacer()
            }
            .padding(.bottom, 5)
            HStack {
                Spacer()
                VStack(alignment: .center) {
                    Text(" Total Pax")
                    Text("\(zone.totalPax)")
                        .capsuleStyle()
                }
                .multilineTextAlignment(.center)
                Spacer()
                VStack {
                    Text("Total Weight")
                    Text("\(cabin.zoneEcconomylWeight(for: zone)) kg")
                        .capsuleStyle()
                }
                .multilineTextAlignment(.center)
                Spacer()
            }
        }
        .animation(.easeIn)
        .contextMenu {
            VStack {
                Text("Seating Capacity")
                if zone == cabin.zone1 {
                    Text("Zone 1:  21 seats")
                }
                if zone == cabin.zone2 {
                    Text("Zone 2:  27 seats")
                }
                if zone == cabin.zone3 {
                    Text("Zone 3:  177 seats")
                }
                if zone == cabin.zone4 {
                    Text("Zone 4:  110 seats")
                }
//                Text("Max permitted infants")
//                if cabin.permittedInfantNumber == 22 {
//                    Text("Currently: \(cabin.permittedInfantNumber)")
//                } else {
//                    Text("Reduced to \(cabin.permittedInfantNumber) due pax numbers")
//                }
            }
        }
    }
}

