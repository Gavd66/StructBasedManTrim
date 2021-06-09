//
//  UnderFloorView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 8/6/21.
//

import SwiftUI

// To do: Alert for the overweight conditions, look at the enum way from Clark and also the optional way from HWS.

struct CargoHoldView: View {
    @ObservedObject var underFloor: UnderFloor

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Cargo Overview").foregroundColor(.primary)) {
                    EmptyLoadView()
                }
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
                // Weight Validations against limits
                .onChange(of: underFloor.compartment1TotalWeight, perform: underFloor.checkCompartment1Weight)
                .onChange(of: underFloor.forwardHoldTotalWeight, perform: underFloor.checkForwardHoldWeight)

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
                .onChange(of: underFloor.compartment2TotalWeight, perform: underFloor.checkCompartment2Weight)
                .onChange(of: underFloor.forwardHoldTotalWeight, perform: underFloor.checkForwardHoldWeight)

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
                .onChange(of: underFloor.compartment3TotalWeight, perform: underFloor.checkCompartment3Weight)
                .onChange(of: underFloor.aftHoldTotalWeight, perform: underFloor.checkAftHoldWeight)

                Section(header: Text("Compartment 4").foregroundColor(.primary)) {
                    Position41View()
                    Spacer()
                    Position42View()
                    Spacer()
                    Position43View()
                    Spacer()
                }
                .onChange(of: underFloor.compartment4TotalWeight, perform: underFloor.checkCompartment4Weight)
                .onChange(of: underFloor.aftHoldTotalWeight, perform: underFloor.checkAftHoldWeight)

                Section(header: Text("Aft Hold Totals").foregroundColor(.primary)) {
                    AftHoldTotalsView()
                }

                Section(header: Text("Bulk Hold").foregroundColor(.primary)) {
                    BulkView()
                }
                .onChange(of: underFloor.compartment5TotalWeight, perform: underFloor.checkCompartment5Weight)

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
            .alert(isPresented: $underFloor.overweightCondition) {
                switch underFloor.weightAlertType {
                case .compartment1Overweight:
                   return Alert(title: Text("Compartment 1 Overweight"), message: Text("Remove Load"), dismissButton: .default(Text("ok")))
                case .compartment2Overweight:
                   return Alert(title: Text("Compartment 2 Overweight"), message: Text("Remove Load"), dismissButton: .default(Text("Ok")))
                case .compartment3Overweight:
                   return Alert(title: Text("Compartment 3 Overweight"), message: Text("Remove Load"), dismissButton: .default(Text("ok")))
                case .compartment4Overweight:
                   return Alert(title: Text("Compartment 4 Overweight"), message: Text("Remove Load"), dismissButton: .default(Text("ok")))
                case .compartment5Overweight:
                    return Alert(title: Text("Compartment 5 Overweight"), message: Text("Remove Load"), dismissButton: .default(Text("ok")))
                case .forwardHoldOverweight:
                    return Alert(title: Text("Forward Hold Overweight"), message: Text("Remove Load"), dismissButton: .default(Text("ok")))
                case .aftHoldOverweight:
                    return Alert(title: Text("AftHold is Overweight"), message: Text("Remove Load"), dismissButton: .default(Text("ok")))
                }
            }
        }
    }
}
