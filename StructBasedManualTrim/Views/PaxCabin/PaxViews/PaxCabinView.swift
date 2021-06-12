//
//  PaxCabinView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 9/6/21.
//

import SwiftUI

struct PaxCabinView: View {
    @EnvironmentObject var cabin: Cabin
    var body: some View {
        NavigationView {
            Form {
                // Pax Cabin Group
                Group {

                    Section {
                        EmptyCabinView()
                    }

                    Section(header: Text("J Class Weights")
                                .foregroundColor(.primary)) {
                        ConfigurationView()
                    }
                    Section(header:
                        Text("Cabin Zone 1").foregroundColor(.primary)) {
                        Zone1View().padding(.bottom)
                    }
                    .onChange(of: cabin.zone1.seatsOccupied, perform: cabin.overSeatingCheck)
                    .allowsHitTesting(cabin.zone1Unlocked)

                    Section(header:
                        Text("Cabin Zone 2").foregroundColor(.primary)) {
                        Zone2View().padding(.bottom)
                    }
                    .onChange(of: cabin.zone2.seatsOccupied, perform: cabin.overSeatingCheck)
                    .allowsHitTesting(cabin.zone2Unlocked)


                    Section(header:
                        Text("Cabin Zone 3").foregroundColor(.primary)) {
                        Zone3View().padding(.bottom)
                    }
                    .onChange(of: cabin.zone3.seatsOccupied, perform: cabin.overSeatingCheck)
                    .allowsHitTesting(cabin.zone3Unlocked)


                    Section(header:
                        Text("Cabin Zone 4").foregroundColor(.primary)) {
                        Zone4View().padding(.bottom)
                    }
                    .onChange(of: cabin.zone4.seatsOccupied, perform: cabin.overSeatingCheck)
                    .allowsHitTesting(cabin.zone4Unlocked)

                }// End Pax Cabin Group

            }
            .navigationTitle("Persons on Board")
            .alert(item: $cabin.seatingError) { seatingError in
                Alert(title: Text(cabin.zoneTitle), message: Text(cabin.zoneMessage), dismissButton: .default(Text("OK")))

            }
        }
    }
}

struct PaxCabinView_Previews: PreviewProvider {
    static var previews: some View {
        PaxCabinView()
    }
}
