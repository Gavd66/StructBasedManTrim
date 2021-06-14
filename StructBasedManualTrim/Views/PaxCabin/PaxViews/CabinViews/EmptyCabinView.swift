//
//  EmptyCabinView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 10/6/21.
//

import SwiftUI

struct EmptyCabinView: View {

    @EnvironmentObject var cabin: Cabin
    var body: some View {

        if cabin.hasPax {
            VStack {

                HStack {
                    Spacer()
                    Text("Totals")
                        .italic()
                        .bold()
                    Spacer()
                }

                HStack {
                    Spacer()
                    VStack(alignment:.center, spacing: 5) {
                        Text("Pax")
                        Text("\(cabin.totalInfants)")
                            .capsuleStyle()
                            .multilineTextAlignment(.center)
                    }

                    VStack(alignment:.center, spacing: 5) {
                        Text("Crew")
                        Text("\(cabin.totalCrewNumber)")
                            .capsuleStyle()
                            .multilineTextAlignment(.center)
                    }

                    VStack(alignment:.center, spacing: 5) {
                        Text("POB")
                        Text("\(cabin.totalPOB)")
                            .capsuleStyle()
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }// End CabinTotal HStack
            }// End main Vstack
            .contextMenu {
                VStack(alignment: .center) {
                    Text("Max Pax Capacity 354 including Infants")
                    Text("Max Infants 22")
                    Text("Max Cabin Crew Seats 12")
                }
                .multilineTextAlignment(.center)
            }

        } else {

            VStack(alignment: .center) {

                HStack {
                    Spacer()
                    VStack(alignment: .center) {
                        Text("POB 2")
                        Text("No Cabin Crew or Passengers Carried")
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                }
            }
            .foregroundColor(.accentColor)
            .contextMenu {
                VStack {
                    Text("Only displyed if Cabin has no occupants")
                    Text("Trash Sets POB to 2")
                }
            }
        }// End if
    }
}

struct EmptyCabinView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyCabinView()
    }
}
