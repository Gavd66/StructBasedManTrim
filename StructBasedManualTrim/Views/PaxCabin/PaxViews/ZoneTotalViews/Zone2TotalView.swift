//
//  Zone2TotalView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 11/6/21.
//

import SwiftUI

struct Zone2TotalView: View {
    @EnvironmentObject var cabin: Cabin
    var body: some View {

        VStack(alignment: .center) {
            HStack {
                Spacer()
                Text("\(Seats.inZone2.rawValue)")
                    .italic()
                    .bold()
                Spacer()
            }
            .padding(.bottom, 5)
            HStack {
                Spacer()
                VStack(alignment: .center) {
                    Text(" Total Pax")
                    Text("\(cabin.zone2.totalPax)")
                        .capsuleStyle()
                }
                .multilineTextAlignment(.center)
                Spacer()
                VStack {
                    Text("Total Weight")
                    Text("\(cabin.zone2TotalWeight) kg")
                        .capsuleStyle()
                }
                .multilineTextAlignment(.center)
                Spacer()
            }

        }
    }
}

struct Zone2TotalView_Previews: PreviewProvider {
    static var previews: some View {
        Zone2TotalView()
    }
}
