//
//  AircraftView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 17/6/21.
//

import SwiftUI

struct AircraftView: View {

    @EnvironmentObject var aircraft: Aircraft
    var body: some View {

        NavigationView {
            Form {
                Section(header: Text("Aircraft Registration")
                            .foregroundColor(.primary)) {
                    RegistrationView()
                }
                Section(header: Text("Galley Configuration")
                            .foregroundColor(.primary)) {
                    GalleyConfigurationView()
                }
                Section(header: Text("Fuel on EICAS Display")
                            .foregroundColor(.primary)) {
                    FuelView()
                }
                Section(header: Text("Flight Plan Fuel Burn")
                            .foregroundColor(.primary)) {
                    FuelBurnView()
                }
            }// Form
            .navigationTitle("Aircraft")
            .alert(item: $aircraft.fuelError) { fuelError in
                Alert(title: Text(aircraft.fuelError?.rawValue ?? ""), message: Text(aircraft.fuelError?.message ?? ""), dismissButton: .destructive(Text("Remove last entry")))
            }
        }
    }
}

struct AircraftView_Previews: PreviewProvider {
    static var previews: some View {
        AircraftView()
    }
}
