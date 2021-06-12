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
    var zoneTotal: Seats
    var body: some View {
        if zone.hasPaxInZone {
            withAnimation {
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
                            VStack {
                                Text("Total Weight")
                                Text("\(cabin.zoneEcconomylWeight(for: zone)) kg")
                                    .capsuleStyle()
                            }
                            .multilineTextAlignment(.center)

                        Spacer()
                    }
                }
            .padding(.top)
            }
        }
    }
}

