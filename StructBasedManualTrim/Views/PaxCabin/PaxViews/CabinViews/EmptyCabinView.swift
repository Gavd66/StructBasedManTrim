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

        if cabin.hasPax || cabin.totalCrewNumber > 2 {
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
                        Text("\(cabin.totalPaxNumbers)")
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
                    Text("Max Pax Total: 354")
                    Text("Max permitted infants:")
                    if cabin.permittedInfantNumber == 22 {
                        Text("Currently \(cabin.permittedInfantNumber)")
                    } else {
                        Text("Reduced to \(cabin.permittedInfantNumber) due pax numbers")
                    }
                    Text("Max Cabin Crew Seats: 11")
                    Text("Max Cabin Crew: 12 using seat 42C")
                }
                .multilineTextAlignment(.center)
            }
        } else {
            VStack(alignment: .center) {
                HStack {
                    Spacer()
                    VStack(alignment: .center) {
                        Text("POB 2")
                            .transition(.scale)
                        Text("No Extra Crew, Cabin Crew or Passengers Carried")
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
        }// End else
    }// Body
}

struct EmptyCabinView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyCabinView()
    }
}
