//
//  PaxCabinView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 9/6/21.
//

import SwiftUI

//TODO:- Add infant logic, cabin tables, cabin crew picker and jumpseat picker
struct PaxCabinView: View {

    @EnvironmentObject var cabin: Cabin

    var body: some View {

        NavigationView {
            Form {
                Group { // Pax Cabin Group

                    Section {
                        EmptyCabinView()
                    }

                    Section(header: Text("J Class Weights")
                                .foregroundColor(.primary)) {
                        ConfigurationView()
                    }

                    Section(header: Text("Cabin Zone 1")
                                .foregroundColor(.primary)) {
                        Zone1View()

                    }
                    .onChange(of: cabin.zone1.totalPax, perform: cabin.validPaxLoad)
//                    .onChange(of: cabin.zone1.infants, perform: cabin.overSeatingCheck)
                    .allowsHitTesting(cabin.zone1Unlocked)
                   // .adaptsToKeyboard()


                    Section {
                        JTotals(cabin: _cabin, zone: cabin.zone1, zoneLimit: Seats.inZone1)
                    }

                    Section(header: Text("Cabin Zone 2")
                                .foregroundColor(.primary)) {
                        Zone2View()
                            
                    }
                    .onChange(of: cabin.zone2.totalPax, perform: cabin.validPaxLoad)
                   // .onChange(of: cabin.zone2.infants, perform: cabin.overSeatingCheck)
                    .allowsHitTesting(cabin.zone2Unlocked)

                    Section {
                        YTotals(cabin: _cabin, zone: cabin.zone2, zoneLimit: Seats.inZone2)
                    }

                    Section(header: Text("Cabin Zone 3")
                                .foregroundColor(.primary)) {
                        Zone3View()
                    }
                    .onChange(of: cabin.zone3.totalPax, perform: cabin.validPaxLoad)
                   // .onChange(of: cabin.zone3.infants, perform: cabin.overSeatingCheck)
                    .allowsHitTesting(cabin.zone3Unlocked)

                    Section {
                        YTotals(cabin: _cabin, zone: cabin.zone3, zoneLimit: Seats.inZone3)
                    }

                    Section(header: Text("Cabin Zone 4")
                                .foregroundColor(.primary)) {
                        Zone4View()
                    }
                    .onChange(of: cabin.zone4.totalPax, perform: cabin.validPaxLoad)
//                    .onChange(of: cabin.zone4.infants, perform: cabin.validPaxLoad)
                    .allowsHitTesting(cabin.zone4Unlocked)

                    Section {
                        YTotals(cabin: _cabin, zone: cabin.zone4, zoneLimit: Seats.inZone4)
                    }
                }// End Pax Cabin Group

                Section {
                    EmptyCabinView()
                }

            }
            .navigationTitle("Persons on Board")
            .navigationBarItems(trailing: Button(action: cabin.resetCabin) {
                Image(systemName: "trash")
                    .font(.system(size: 30))
                    .foregroundColor(.accentColor)
                    .padding()
            })
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
