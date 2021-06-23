//
//  EmptyLoadView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 8/6/21.
//

import SwiftUI

struct EmptyLoadView: View {
    @EnvironmentObject var cargo: CargoHold

    var body: some View {
        if cargo.hasCargo {
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
                    Text("\(cargo.forwardHoldTotalWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Aft Hold")
                    Text("\(cargo.aftHoldTotalWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Bulk Hold")
                    Text("\(cargo.compartment5TotalWeight) kg")
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
                Text("All cargo holds are empty")
                Text("Use trash to empty all holds")
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
