//
//  UnderFloorView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 8/6/21.
//

import SwiftUI

struct UnderFloorView: View {
    @ObservedObject var underFloor: UnderFloor
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Compartment 1").foregroundColor(.primary)) {
                    Position11View()
                    Spacer()
                    Position12View()
                    Spacer()
                    Position13View()
                    Spacer()
                    Position14View()
                    Spacer()
                }

                Section(header: Text("Compartment 2").foregroundColor(.primary)) {
                    Position21View()
                    Spacer()
                    Position22View()
                    Spacer()
                    Position23View()
                    Spacer()
                    Position24View()
                    Spacer()
                }

                Section(header: Text("Forward Hold Totals").foregroundColor(.primary)) {
                    ForwardHoldTotalsView()
                }
                Section(header: Text("Compartment 3").foregroundColor(.primary)) {
                    Position31View()
                    Spacer()
                    Position32View()
                    Spacer()
                    Position33View()
                    Spacer()
                }

                Section(header: Text("Compartment 4").foregroundColor(.primary)) {
                    Position41View()
                    Spacer()
                    Position42View()
                    Spacer()
                    Position43View()
                    Spacer()
                }

                Section(header: Text("Aft Hold Totals").foregroundColor(.primary)) {
                    AftHoldTotalsView()
                }
                Section(header: Text("Bulk Hold").foregroundColor(.primary)) {
                    BulkView()
                }
                Section(header: Text("Bulk Hold Totals").foregroundColor(.primary)) {
                    BulkHoldTotalView()
                }
            }
            .environmentObject(underFloor)
            .navigationBarTitle("Cargo Hold")
            .navigationBarItems(trailing: Button(action: underFloor.resetCargoToEmpty) {
                Image(systemName: "trash")
                    .font(.system(size: 30))
                    .foregroundColor(.accentColor)
                    .padding()
            })
        }
    }
}

struct UnderFloorView_Previews: PreviewProvider {
    static var previews: some View {
        UnderFloorView(underFloor: .example)
    }
}
