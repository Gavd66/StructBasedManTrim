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
    var zoneLimit: Seats

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
                Text("Seating Capacities")
                if zone == cabin.zone1 {
                    Text("Zone 1:  21")
                }
                if zone == cabin.zone2 {
                    Text("Zone 2:  27")
                }
                if zone == cabin.zone3 {
                    Text("Zone 3:  177")
                }
                if zone == cabin.zone4 {
                    Text("Zone 4:  110")
                }
                Text("Max infants:  22")
                Text("Infants reduced with pax  >  322")
            }
        }
    }
}

