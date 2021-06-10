//
//  UnderFloorView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 8/6/21.
//

import SwiftUI



struct CargoHoldView: View {
   // @ObservedObject var cargoHold: CargoHold

    @EnvironmentObject var cargoHold: CargoHold
    //Haptic for overweight condition. Prewarm engine as each View Appears
    @State private var feedBack = UINotificationFeedbackGenerator()

    var total: Text {
        Text("\(cargoHold.overWeightAmount)")
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
                //Warm Haptic engine as each view appears
                .onAppear(perform: feedBack.prepare)
                // Weight Validations against limits
                // Modifier order matters, check individual limits first
                .onChange(of: cargoHold.compartment1TotalWeight, perform: cargoHold.checkCompartment1Weight)
                .onChange(of: cargoHold.forwardHoldTotalWeight, perform: cargoHold.checkForwardHoldWeight)
                .allowsHitTesting(cargoHold.compartment1Enabled)

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
                .onChange(of: cargoHold.compartment2TotalWeight, perform: cargoHold.checkCompartment2Weight)
                .onChange(of: cargoHold.forwardHoldTotalWeight, perform: cargoHold.checkForwardHoldWeight)
                .allowsHitTesting(cargoHold.compartment2Enabled)

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
                .onChange(of: cargoHold.compartment3TotalWeight, perform: cargoHold.checkCompartment3Weight)
                .onChange(of: cargoHold.aftHoldTotalWeight, perform: cargoHold.checkAftHoldWeight)
                .allowsHitTesting(cargoHold.compartment3Enabled)

                Section(header: Text("Compartment 4").foregroundColor(.primary)) {
                    Position41View()
                    Spacer()
                    Position42View()
                    Spacer()
                    Position43View()
                    Spacer()
                }
                .onAppear(perform: feedBack.prepare)
                .onChange(of: cargoHold.compartment4TotalWeight, perform: cargoHold.checkCompartment4Weight)
                .onChange(of: cargoHold.aftHoldTotalWeight, perform: cargoHold.checkAftHoldWeight)
                .allowsHitTesting(cargoHold.compartment4Enabled)

                Section(header: Text("Aft Hold Totals").foregroundColor(.primary)) {
                    AftHoldTotalsView()
                }
                .onAppear(perform: feedBack.prepare)

                Section(header: Text("Bulk Hold").foregroundColor(.primary)) {
                    BulkView()
                }
                .onAppear(perform: feedBack.prepare)
                .onChange(of: cargoHold.compartment5TotalWeight, perform: cargoHold.checkCompartment5Weight)
                .allowsHitTesting(cargoHold.compartment5Enabled)

                Section(header: Text("Bulk Hold Totals").foregroundColor(.primary)) {
                    BulkHoldTotalView()
                }
                .onAppear(perform: feedBack.prepare)
            }
            .navigationBarTitle("Cargo Hold")
            .navigationBarItems(trailing: Button(action: cargoHold.resetCargoToEmpty) {
                Image(systemName: "trash")
                    .font(.system(size: 30))
                    .foregroundColor(.accentColor)
                    .padding()
            })
            .alert(item: $cargoHold.overWeightAlert) { weighAlert in
                self.feedBack.notificationOccurred(.error)
                switch cargoHold.overWeightAlert {
                case .compartment1:
                    return Alert(
                        title: Text("Compartment 1 Overweight"),
                        message: Text("Remove \(total) kg from Compartment 1"),
                        dismissButton: .default(Text("OK")))
                case .compartment2:
                    return Alert(
                        title: Text("Compartment 2 Overweight"),
                        message: Text("Remove \(total) kg from Compartment 2"),
                        dismissButton: .default(Text("OK")))
                case .compartment3:
                    return Alert(
                        title: Text("Compartment 3 Overweight"),
                        message: Text("Remove \(total) kg from Compartment 3"),
                        dismissButton: .default(Text("OK")))
                case .compartment4:
                    return Alert(
                        title: Text("Compartment 4 Overweight"),
                        message: Text("Remove \(total) kg from Compartment 4"),
                        dismissButton: .default(Text("OK")))
                case .compartment5:
                    return Alert(
                        title: Text("Compartment 5 Overweight"),
                        message: Text("Remove \(total) kg from Compartment 5"),
                        dismissButton: .default(Text("OK")))
                case .forwardHold:
                    return Alert(
                        title: Text("Forward Hold Overweight"),
                        message: Text("Remove \(total) kg in total from Compartments 1 & 2 "),
                        dismissButton: .default(Text("OK")))
                case .aftHold:
                    return Alert(
                        title: Text("AftHold is Overweight"),
                        message: Text("Remove \(total) kg in total from Compartments 3 & 4 "),
                        dismissButton: .default(Text("OK")))
                case .none:
                    return Alert(title: Text(""))
                }
            }
        }
    }
}
