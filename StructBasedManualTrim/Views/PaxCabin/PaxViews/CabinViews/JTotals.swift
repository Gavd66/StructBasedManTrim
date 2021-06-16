//
//  TotalModel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 13/6/21.
//

import SwiftUI

struct JTotals: View {

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

            HStack {
                Spacer()
                VStack(alignment: .center) {
                    Text(" Total Pax")
                    Text("\(zone.totalPax)")
                        .capsuleStyle()
                        .animation(.default)
                }
                .multilineTextAlignment(.center)
                Spacer()

                if cabin.jWeight == .buisness {
                    VStack {
                        Text("Total Weight")
                        Text("\(cabin.zoneBuisnessWeight(for: zone)) kg")
                            .capsuleStyle()
                            .animation(.default)
                    }
                    .multilineTextAlignment(.center)
                } else {
                    VStack {
                        Text("Total Weight")
                        Text("\(cabin.zoneEcconomylWeight(for: zone)) kg")
                            .capsuleStyle()
                            .animation(.default)
                    }
                    .multilineTextAlignment(.center)
                }
                Spacer()
            }
        }
        .contextMenu {
            VStack {
                Text("Seating Capacity")
                Text("Zone 1:  21 seats")
                
            }
        }
    }// end body
}

