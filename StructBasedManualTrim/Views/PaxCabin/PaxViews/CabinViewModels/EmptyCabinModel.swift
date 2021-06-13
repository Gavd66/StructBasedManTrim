//
//  EmptyCabinView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 10/6/21.
//

import SwiftUI

struct EmptyCabinModel: View {

    @EnvironmentObject var cabin: Cabin
    var body: some View {
        if cabin.hasPax {
            VStack {
                HStack {
                    Spacer()
                    Text("POB")
                        .italic()
                        .bold()
                    Spacer()
                }
                .padding([.bottom, .top], 5)
                HStack {
                    Spacer()
                    VStack(alignment:.center, spacing: 5) {
                        Text("Pax")
                        Text("\(cabin.totalPaxNumbers)")
                            .capsuleStyle()
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack(alignment:.center, spacing: 5) {
                        Text("Crew")
                        Text("\(cabin.totalCrewNumber)")
                            .capsuleStyle()
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack(alignment:.center, spacing: 5) {
                        Text("Total")
                        Text("\(cabin.totalPOB)")
                            .capsuleStyle()
                            .multilineTextAlignment(.center)
                    }
                    Spacer()

                }// End CabinTotal HStack

            }// End main Vstack
        } else {
            VStack(alignment: .center) {
                HStack {
                    Spacer()
                    Text("POB: 2. No Cabin Crew or Passengers Carried")
                        .multilineTextAlignment(.center)
                    Spacer()
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
        EmptyCabinModel()
    }
}
