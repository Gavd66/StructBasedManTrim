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
        } else {
            HStack {
                Spacer()
            Text("No cargo or containers loaded, the entire underfloor is empty")
                .multilineTextAlignment(.center)
                .foregroundColor(.accentColor)
                Spacer()
            }
        }
    }
}

struct EmptyLoadView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyLoadView()
    }
}
