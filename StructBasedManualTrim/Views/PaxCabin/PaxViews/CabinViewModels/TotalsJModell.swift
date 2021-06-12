//
//  TotalModel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 13/6/21.
//

import SwiftUI

struct TotalBuisModel: View {
    @EnvironmentObject var cabin: Cabin
    var zone: Pax
    var zoneTotal: Seats
    var zoneWeight: Int
    var body: some View {
        if zone.hasPaxInZone {

            VStack(alignment: .center) {
                HStack {
                    Spacer()
                    Text("\(zoneTotal.rawValue)")
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
                    // If zone 1 weight depends on Configuration need to provide an option for that, all other cases use ecconomy weights

                    if cabin.configuration == .standard {
                        VStack {
                            Text("Total Weight")
                            Text("\(cabin.zoneBuisnessWeight(for: zone)) kg")
                                .capsuleStyle()
                        }
                        .multilineTextAlignment(.center)
                    } else {
                        VStack {
                            Text("Total Weight")
                            Text("\(cabin.zoneEcconomylWeight(for: zone)) kg")
                                .capsuleStyle()
                        }
                        .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
            }
            .padding(.top)
        }
    }
}

