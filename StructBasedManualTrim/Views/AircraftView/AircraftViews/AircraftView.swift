//
//  AircraftView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 17/6/21.
//

import SwiftUI

struct AircraftView: View {

    @EnvironmentObject var aircraft: Aircraft
    var feedback = UINotificationFeedbackGenerator()
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
                .onAppear(perform: feedback.prepare)
                .onChange(of: aircraft.fuelValue, perform: aircraft.checkForFuelError)
                
                Section(header: Text("Flight Plan Fuel Burn")
                            .foregroundColor(.primary)) {
                    FuelBurnView()
                }
                .onAppear(perform: feedback.prepare)
                .onChange(of: aircraft.fuelValue, perform: aircraft.checkForFuelError)
            }// Form
            .navigationTitle("Aircraft")
            .alert(item: $aircraft.fuelError) { fuelError in
                self.feedback.notificationOccurred(.error)
                return Alert(
                    title: Text(aircraft.errorTitle),
                    message: Text(aircraft.errorMessage),
                    dismissButton: .destructive(Text("Remove Last Input"), action: aircraft.removeFuel))
            }
        }
    }
}

struct AircraftView_Previews: PreviewProvider {
    static var previews: some View {
        AircraftView()
    }
}
