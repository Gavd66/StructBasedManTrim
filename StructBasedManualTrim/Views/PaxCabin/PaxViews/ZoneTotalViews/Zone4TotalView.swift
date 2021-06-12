//
//  Zone4TotalView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 11/6/21.
//

import SwiftUI

struct Zone4TotalView: View {
    @EnvironmentObject var cabin: Cabin
    var body: some View {

        VStack(alignment: .center) {
            HStack {
                Spacer()
                Text("\(Seats.inZone4.rawValue)")
                    .italic()
                    .bold()
                Spacer()
            }
            .padding(.bottom, 5)
            HStack {
                Spacer()
                VStack(alignment: .center) {
                    Text(" Total Pax")
                    Text("\(cabin.zone4.totalPax)")
                        .capsuleStyle()
                }
                .multilineTextAlignment(.center)
                Spacer()
                VStack {
                    Text("Total Weight")
                    Text("\(cabin.zone4TotalWeight) kg")
                        .capsuleStyle()
                }
                .multilineTextAlignment(.center)
                Spacer()
            }

        }
    }
}

struct Zone4TotalView_Previews: PreviewProvider {
    static var previews: some View {
        Zone4TotalView()
    }
}
