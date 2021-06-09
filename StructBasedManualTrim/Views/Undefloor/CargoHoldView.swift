//
//  UnderFloorView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 8/6/21.
//

import SwiftUI



struct CargoHoldView: View {
    @ObservedObject var underFloor: UnderFloor

    //Haptic for overweight condition. Prewarm engine as each View Appears
    @State private var feedBack = UINotificationFeedbackGenerator()

    var total: Text {
        Text("\(underFloor.overweightAmount)")
    }

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
                .onAppear(perform: feedBack.prepare)
                // Weight Validations against limits
                .onChange(of: underFloor.compartment1TotalWeight, perform: underFloor.checkCompartment1Weight)
                .onChange(of: underFloor.forwardHoldTotalWeight, perform: underFloor.checkForwardHoldWeight)
                .allowsHitTesting(underFloor.compartment1Enabled)

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
                .onAppear(perform: feedBack.prepare)
                .onChange(of: underFloor.compartment2TotalWeight, perform: underFloor.checkCompartment2Weight)
                .onChange(of: underFloor.forwardHoldTotalWeight, perform: underFloor.checkForwardHoldWeight)
                .allowsHitTesting(underFloor.compartment2Enabled)

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
                .onAppear(perform: feedBack.prepare)
                .onChange(of: underFloor.compartment3TotalWeight, perform: underFloor.checkCompartment3Weight)
                .onChange(of: underFloor.aftHoldTotalWeight, perform: underFloor.checkAftHoldWeight)
                .allowsHitTesting(underFloor.compartment3Enabled)

                Section(header: Text("Compartment 4").foregroundColor(.primary)) {
                    Position41View()
                    Spacer()
                    Position42View()
                    Spacer()
                    Position43View()
                    Spacer()
                }
                .onAppear(perform: feedBack.prepare)
                .onChange(of: underFloor.compartment4TotalWeight, perform: underFloor.checkCompartment4Weight)
                .onChange(of: underFloor.aftHoldTotalWeight, perform: underFloor.checkAftHoldWeight)
                .allowsHitTesting(underFloor.compartment4Enabled)

                Section(header: Text("Aft Hold Totals").foregroundColor(.primary)) {
                    AftHoldTotalsView()
                }
                .onAppear(perform: feedBack.prepare)

                Section(header: Text("Bulk Hold").foregroundColor(.primary)) {
                    BulkView()
                }
                .onAppear(perform: feedBack.prepare)
                .onChange(of: underFloor.compartment5TotalWeight, perform: underFloor.checkCompartment5Weight)
                .allowsHitTesting(underFloor.compartment5Enabled)

                Section(header: Text("Bulk Hold Totals").foregroundColor(.primary)) {
                    BulkHoldTotalView()
                }
                .onAppear(perform: feedBack.prepare)
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
                self.feedBack.notificationOccurred(.error)
                switch underFloor.weightAlertType {
                case .compartment1Overweight:
                   return Alert(
                    title: Text("Compartment 1 Overweight"),
                    message: Text("Remove \(total) kg from Compartment 1"),
                    dismissButton: .default(Text("OK")))
                case .compartment2Overweight:
                   return Alert(
                    title: Text("Compartment 2 Overweight"),
                    message: Text("Remove \(total) kg from Compartment 2"),
                    dismissButton: .default(Text("OK")))
                case .compartment3Overweight:
                   return Alert(
                    title: Text("Compartment 3 Overweight"),
                    message: Text("Remove \(total) kg from Compartment 3"),
                    dismissButton: .default(Text("OK")))
                case .compartment4Overweight:
                   return Alert(
                    title: Text("Compartment 4 Overweight"),
                    message: Text("Remove \(total) kg from Compartment 4"),
                    dismissButton: .default(Text("OK")))
                case .compartment5Overweight:
                    return Alert(
                        title: Text("Compartment 5 Overweight"),
                        message: Text("Remove \(total) kg from Compartment 5"),
                        dismissButton: .default(Text("OK")))
                case .forwardHoldOverweight:
                    return Alert(
                        title: Text("Forward Hold Overweight"),
                        message: Text("Remove \(total) kg in total from Compartments 1 & 2 "),
                        dismissButton: .default(Text("OK")))
                case .aftHoldOverweight:
                    return Alert(
                        title: Text("AftHold is Overweight"),
                        message: Text("Remove \(total) kg in total from Compartments 3 & 4 "),
                        dismissButton: .default(Text("OK")))
                }

            }

        }
    }
}
