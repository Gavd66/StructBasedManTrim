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
                Group { // Registration Group
                    Section {
                        NoRegistrationView()
                    }
                    Section(header: Text("Aircraft Registration")
                                .foregroundColor(.primary)) {
                        RegistrationView()
                    }
                }
                Group { // Weight Group
                    Section(header: Text("Galley Configuration")
                                .foregroundColor(.primary)) {
                        GalleyConfigurationView()
                    }
                    Section(header: Text("Potable Water")
                                .foregroundColor(.primary)) {
                        PotableWaterView()
                    }
                    Section(header: Text("Operating Weights")
                                .foregroundColor(.primary)) {
                        OperatingWeightView()
                    }

                }
                Group { // Fuel Group
                    Section(header: Text("Fuel on EICAS")
                                .foregroundColor(.primary)) {
                        FuelView()
                    }
                    .onAppear(perform: feedback.prepare)
                    .onChange(of: aircraft.fuelValue, perform: aircraft.checkForFuelError)

                    Section(header: Text("Fuel Distribution")
                                .foregroundColor(.primary)) {
                        FuelDistributionViews()
                    }

                    Section(header: Text("Flight Plan Fuel Burn")
                                .foregroundColor(.primary)) {
                        FuelBurnView()
                    }
                    .onAppear(perform: feedback.prepare)
                    .onChange(of: aircraft.fuelValue, perform: aircraft.checkForFuelError)
                }
                Section {
                    NoRegistrationView()
                }
            }// Form
            .navigationTitle("Aircraft")
            .navigationBarItems(trailing: Button(action: aircraft.reset) {
                Image(systemName: "trash")
                    .font(.system(size: 30))
                    .foregroundColor(.accentColor)
                    .padding()
            })
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
