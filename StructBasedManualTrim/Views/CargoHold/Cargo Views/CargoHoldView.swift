//
//  UnderFloorView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 8/6/21.
//

import SwiftUI



struct CargoHoldView: View {
   // @ObservedObject var cargoHold: CargoHold

    @EnvironmentObject var cargo: CargoHold
    //Haptic for overweight condition. Prewarm engine as each View Appears
    @State private var feedBack = UINotificationFeedbackGenerator()

    var total: Text {
        Text("\(cargo.overWeightAmount)")
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
                .onChange(of: cargo.compartment1TotalWeight, perform: cargo.validateCompartmentWeight)
                
                // Weight Validations against limits
                // Modifier order matters, check individual limits first
//                .onChange(of: cargo.compartment1TotalWeight, perform: cargo.checkCompartment1Weight)
//                .onChange(of: cargo.forwardHoldTotalWeight, perform: cargo.checkForwardHoldWeight)
//                .allowsHitTesting(cargo.compartment1Enabled)

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
                .onChange(of: cargo.compartment2TotalWeight, perform: cargo.validateCompartmentWeight)
//                .onChange(of: cargo.compartment2TotalWeight, perform: cargo.checkCompartment2Weight)
//                .onChange(of: cargo.forwardHoldTotalWeight, perform: cargo.checkForwardHoldWeight)
//                .allowsHitTesting(cargo.compartment2Enabled)

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
                .onChange(of: cargo.compartment3TotalWeight, perform: cargo.validateCompartmentWeight)
//                .onChange(of: cargo.compartment3TotalWeight, perform: cargo.checkCompartment3Weight)
//                .onChange(of: cargo.aftHoldTotalWeight, perform: cargo.checkAftHoldWeight)
//                .allowsHitTesting(cargo.compartment3Enabled)

                Section(header: Text("Compartment 4").foregroundColor(.primary)) {
                    Position41View()
                    Spacer()
                    Position42View()
                    Spacer()
                    Position43View()
                    Spacer()
                }
                .onAppear(perform: feedBack.prepare)
                .onChange(of: cargo.compartment4TotalWeight, perform: cargo.validateCompartmentWeight)
//                .onChange(of: cargo.compartment4TotalWeight, perform: cargo.checkCompartment4Weight)
//                .onChange(of: cargo.aftHoldTotalWeight, perform: cargo.checkAftHoldWeight)
//                .allowsHitTesting(cargo.compartment4Enabled)

                Section(header: Text("Aft Hold Totals").foregroundColor(.primary)) {
                    AftHoldTotalsView()
                }
                .onAppear(perform: feedBack.prepare)

                Section(header: Text("Bulk Hold").foregroundColor(.primary)) {
                    BulkView()
                }
                .onAppear(perform: feedBack.prepare)
                .onChange(of: cargo.compartment5TotalWeight, perform: cargo.validateCompartmentWeight)
//                .onChange(of: cargo.compartment5TotalWeight, perform: cargo.checkCompartment5Weight)
//                .allowsHitTesting(cargo.compartment5Enabled)

                Section(header: Text("Bulk Hold Totals").foregroundColor(.primary)) {
                    BulkHoldTotalView()
                }
                .onAppear(perform: feedBack.prepare)
            }
            .navigationBarTitle("Cargo Hold")
            .navigationBarItems(trailing: Button(action: cargo.resetCargoToEmpty) {
                Image(systemName: "trash")
                    .font(.system(size: 30))
                    .foregroundColor(.accentColor)
                    .padding()
            })
            .alert(item: $cargo.overWeightAlert) { weighAlert in
                self.feedBack.notificationOccurred(.error)
                return Alert(title: Text(cargo.title),
                             message: Text(cargo.message),
                             dismissButton: .destructive(Text("Remove last input"), action: {
                                cargo.removeOverWeightEntry()
                             }))
//                switch cargo.overWeightAlert {
//                case .compartment1:
//                    return Alert(
//                        title: Text("Compartment 1 Overweight"),
//                        message: Text("Remove \(total) kg from Compartment 1"),
//                        dismissButton: .default(Text("OK")))
//                case .compartment2:
//                    return Alert(
//                        title: Text("Compartment 2 Overweight"),
//                        message: Text("Remove \(total) kg from Compartment 2"),
//                        dismissButton: .default(Text("OK")))
//                case .compartment3:
//                    return Alert(
//                        title: Text("Compartment 3 Overweight"),
//                        message: Text("Remove \(total) kg from Compartment 3"),
//                        dismissButton: .default(Text("OK")))
//                case .compartment4:
//                    return Alert(
//                        title: Text("Compartment 4 Overweight"),
//                        message: Text("Remove \(total) kg from Compartment 4"),
//                        dismissButton: .default(Text("OK")))
//                case .compartment5:
//                    return Alert(
//                        title: Text("Compartment 5 Overweight"),
//                        message: Text("Remove \(total) kg from Compartment 5"),
//                        dismissButton: .default(Text("OK")))
//                case .forwardHold:
//                    return Alert(
//                        title: Text("Forward Hold Overweight"),
//                        message: Text("Remove \(total) kg in total from Compartments 1 & 2 "),
//                        dismissButton: .default(Text("OK")))
//                case .aftHold:
//                    return Alert(
//                        title: Text("AftHold is Overweight"),
//                        message: Text("Remove \(total) kg in total from Compartments 3 & 4 "),
//                        dismissButton: .default(Text("OK")))
//                case .none:
//                    return Alert(title: Text(""))
//                }
            }
        }
    }
}
