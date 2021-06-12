//
//  Zone1TotalView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 11/6/21.
//

import SwiftUI

struct Zone1TotalView: View {
    @EnvironmentObject var cabin: Cabin
    var body: some View {

        VStack(alignment: .center) {
            HStack {
                Spacer()
                Text("\(Seats.inZone1.rawValue)")
                    .italic()
                    .bold()
                Spacer()
            }
            .padding(.bottom, 5)
            HStack {
                Spacer()
                VStack(alignment: .center) {
                    Text(" Total Pax")
                    Text("\(cabin.zone1.totalPax)")
                        .capsuleStyle()
                }
                .multilineTextAlignment(.center)
                Spacer()
                if cabin.configuration == .standard {
                    VStack {
                        Text("Total Weight")
                        Text("\(cabin.zone1StandardWeight) kg")
                            .capsuleStyle()
                    }
                    .multilineTextAlignment(.center)
                } else if cabin.configuration == .domestic {
                    VStack {
                        Text("Total Weight")
                        Text("\(cabin.zone1DomesticWeight) kg")
                            .capsuleStyle()
                    }
                    .multilineTextAlignment(.center)
                }


                Spacer()
            }
            
        }
    }
}

struct Zone1TotalView_Previews: PreviewProvider {
    static var previews: some View {
        Zone1TotalView()
    }
}
