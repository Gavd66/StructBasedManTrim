//
//  NoRegistrationView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 21/6/21.
//

import SwiftUI

struct NoRegistrationView: View {

    @EnvironmentObject var aircraft: Aircraft
    var body: some View {
        if aircraft.registration != .none || aircraft.totalFuel != 0 || aircraft.fuelBurn != 0 {
            VStack {
                HStack {
                    Spacer()
                    Text("Details")
                        .italic()
                        .bold()
                    Spacer()
                }

                HStack {
                    Spacer()
                    VStack(alignment:.center, spacing: 5) {
                        Text("Rego")
                        Text("\(aircraft.registration.rawValue)")
                            .capsuleStyle()
                            .multilineTextAlignment(.center)
                    }

                    VStack(alignment:.center, spacing: 5) {
                        Text("Total Fuel")
                        Text("\(aircraft.totalFuelTonnes, specifier: "%.1f") T")
                            .capsuleStyle()
                            .multilineTextAlignment(.center)
                    }

                    VStack(alignment:.center, spacing: 5) {
                        Text("Fuel Burn")
                        Text("\(aircraft.fuelBurnTonnes, specifier: "%.1f") T")
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
                    VStack(alignment: .center) {
                        Text("Aircraft Registration not Set")
                            .transition(.scale)
                        Text("Fuel Qantity and Fuel Burn set to zero")
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                }
            }
            .foregroundColor(.accentColor)
            .contextMenu {
                VStack {
                    Text("No rego or fuel values set")
                    Text("Galley set to Domestic")
                    Text("Water set to full")
                    Text("Trash resets all fields")
                }
            }
        }
    }
}

struct NoRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        NoRegistrationView()
    }
}
