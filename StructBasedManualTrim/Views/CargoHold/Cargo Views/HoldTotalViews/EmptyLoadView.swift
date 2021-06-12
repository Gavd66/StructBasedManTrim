//
//  EmptyLoadView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 8/6/21.
//

import SwiftUI

struct EmptyLoadView: View {
    @EnvironmentObject var cargoHold: CargoHold

    var body: some View {
        if cargoHold.hasCargo {
        VStack {
            HStack {
                Spacer()
                Text("Cargo Totals")
                    .italic()
                    .bold()
                Spacer()
            }
            HStack {
                VStack(alignment: .center, spacing: 5) {
                    Text("Fwd Hold")
                    Text("\(cargoHold.forwardHoldTotalWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Aft Hold")
                    Text("\(cargoHold.aftHoldTotalWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Bulk Hold")
                    Text("\(cargoHold.compartment5TotalWeight) kg")
                        .capsuleStyle()
                }
            }
        }//
        .contextMenu {
            VStack {
            Text("Limits for each Hold")
                Text("Fwd: \(Underfloor.forwardHold.limitWeight) kg")
                Text("Aft: \(Underfloor.aftHold.limitWeight) kg")
                Text("Bulk: \(Underfloor.compartment5.limitWeight) kg")
            }
        }
        } else {
            HStack {
                Spacer()
            Text("No cargo or containers loaded, the entire underfloor is empty")
                .multilineTextAlignment(.center)
                .foregroundColor(.accentColor)
                Spacer()
            } // End H
            .contextMenu {
                VStack {
                Text("Only displyed if all holds are empty")
                Text("Use trash to reset to empty when required")
                }
            }
        }
    }
}

struct EmptyLoadView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyLoadView()
    }
}
