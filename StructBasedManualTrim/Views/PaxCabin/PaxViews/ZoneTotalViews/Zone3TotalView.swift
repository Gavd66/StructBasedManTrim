//
//  Zone3TotalView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 11/6/21.
//

import SwiftUI

struct Zone3TotalView: View {
    @EnvironmentObject var cabin: Cabin
    var body: some View {

        VStack(alignment: .center) {
            HStack {
                Spacer()
                Text("\(Seats.inZone3.rawValue)")
                    .italic()
                    .bold()
                Spacer()
            }
            .padding(.bottom, 5)
            HStack {
                Spacer()
                VStack(alignment: .center) {
                    Text(" Total Pax")
                    Text("\(cabin.zone3.totalPax)")
                        .capsuleStyle()
                }
                .multilineTextAlignment(.center)
                Spacer()
                VStack {
                    Text("Total Weight")
                    Text("\(cabin.zone3TotalWeight) kg")
                        .capsuleStyle()
                }
                .multilineTextAlignment(.center)
                Spacer()
            }

        }
    }
}

struct Zone3TotalView_Previews: PreviewProvider {
    static var previews: some View {
        Zone3TotalView()
    }
}
