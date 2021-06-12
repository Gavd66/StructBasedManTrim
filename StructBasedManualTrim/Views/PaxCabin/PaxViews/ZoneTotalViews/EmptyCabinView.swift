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
                    Text("POB")
                        .italic()
                        .bold()
                    Spacer()
                }
//                HStack {
//                    VStack(alignment:.center, spacing: 5) {
//                        Text("Pax including Infants")
//                        Text("M: \(cabin.zone1.males),F: \(cabin.zone1.females), C: \(cabin.zone1.children),I: \(cabin.zone1.infants)")
//                    }
//                    VStack(alignment:.center, spacing: 5) {
//                        Text("Crew")
//                        Text("Tech: \(cabin.zone1.males),Cabin: \(cabin.zone1.females)")
//                    }
//                    VStack(alignment:.center, spacing: 5) {
//                        Text("Total POB")
//                        Text("M: \(cabin.zone1.males),F: \(cabin.zone1.females), C: \(cabin.zone1.children),I: \(cabin.zone1.infants)")
//                    }
//                    VStack(alignment:.center, spacing: 5) {
//                        Text("Zone 1 Pax Numbers")
//                        Text("M: \(cabin.zone1.males),F: \(cabin.zone1.females), C: \(cabin.zone1.children),I: \(cabin.zone1.infants)")
//                    }
//
//
//                }// End CabinTotal HStack

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
        EmptyCabinView()
    }
}
