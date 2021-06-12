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
                        EmptyCabinModel()
                    }

                    Section(header: Text("J Class Weights")
                                .foregroundColor(.primary)) {
                        ConfigurationModel()
                    }
                    Section(header:
                        Text("Cabin Zone 1").foregroundColor(.primary)) {
                        JModel(cabin: _cabin, number: 1, bindingZone: $cabin.zone1, zone: cabin.zone1, zoneLimit: Seats.inZone1).padding(.bottom)
                    }
                    .onChange(of: cabin.zone1.seatsOccupied, perform: cabin.overSeatingCheck)
                    .allowsHitTesting(cabin.zone1Unlocked)

                    Section(header:
                        Text("Cabin Zone 2").foregroundColor(.primary)) {
                        YModel(cabin: _cabin, zoneNumber: 2, bindingZone: $cabin.zone2, zone: cabin.zone2, zoneLimit: Seats.inZone2).padding(.bottom)
                    }
                    .onChange(of: cabin.zone2.seatsOccupied, perform: cabin.overSeatingCheck)
                    .allowsHitTesting(cabin.zone2Unlocked)


                    Section(header:
                        Text("Cabin Zone 3").foregroundColor(.primary)) {
                        YModel(cabin: _cabin, zoneNumber: 3, bindingZone: $cabin.zone3, zone: cabin.zone3, zoneLimit: Seats.inZone3).padding(.bottom)
                    }
                    .onChange(of: cabin.zone3.seatsOccupied, perform: cabin.overSeatingCheck)
                    .allowsHitTesting(cabin.zone3Unlocked)

                    Section(header:
                        Text("Cabin Zone 4").foregroundColor(.primary)) {
                        YModel(cabin: _cabin, zoneNumber: 4, bindingZone: $cabin.zone4, zone: cabin.zone4, zoneLimit: Seats.inZone4).padding(.bottom)
                    }
                    .onChange(of: cabin.zone4.seatsOccupied, perform: cabin.overSeatingCheck)
                    .allowsHitTesting(cabin.zone4Unlocked)

                }// End Pax Cabin Group

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
