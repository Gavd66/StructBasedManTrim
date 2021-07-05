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
                        .onChange(
                            of: cargo.position11.totalWeight,
                            perform: cargo.validateCompartmentWeight)
                    Spacer()
                    Position12View()
                        .onChange(
                            of: cargo.position12.totalWeight,
                            perform: cargo.validateCompartmentWeight)
                    Spacer()
                    Position13View()
                        .onChange(
                            of: cargo.position13.totalWeight,
                            perform: cargo.validateCompartmentWeight)
                    Spacer()
                    Position14View()
                        .onChange(
                            of: cargo.position14.totalWeight,
                            perform: cargo.validateCompartmentWeight)
                    Spacer()
                }
                //Warm Haptic engine as each view appears
                .onAppear(perform: feedBack.prepare)

                Section(header: Text("Compartment 2").foregroundColor(.primary)) {
                    Position21View()
                        .onChange(
                            of: cargo.position21.totalWeight,
                            perform: cargo.validateCompartmentWeight)
                    Spacer()
                    Position22View()
                        .onChange(
                            of: cargo.position22.totalWeight,
                            perform: cargo.validateCompartmentWeight)
                    Spacer()
                    Position23View()
                        .onChange(
                            of: cargo.position23.totalWeight,
                            perform: cargo.validateCompartmentWeight)
                    Spacer()
                    Position24View()
                        .onChange(
                            of: cargo.position24.totalWeight,
                            perform: cargo.validateCompartmentWeight)
                    Spacer()
                }
                .onAppear(perform: feedBack.prepare)

                Section(header: Text("Forward Hold Totals")
                            .foregroundColor(.primary)) {
                    ForwardHoldTotalsView()
                }

                Section(header: Text("Compartment 3")
                            .foregroundColor(.primary)) {
                    Position31View()
                        .onChange(
                            of: cargo.position31.totalWeight,
                            perform: cargo.validateCompartmentWeight)
                    Spacer()
                    Position32View()
                        .onChange(
                            of: cargo.position32.totalWeight,
                            perform: cargo.validateCompartmentWeight)
                    Spacer()
                    Position33View()
                        .onChange(
                            of: cargo.position33.totalWeight,
                            perform: cargo.validateCompartmentWeight)
                    Spacer()
                }
                .onAppear(perform: feedBack.prepare)

                Section(header: Text("Compartment 4")
                            .foregroundColor(.primary)) {
                    Position41View()
                        .onChange(
                            of: cargo.position41.totalWeight,
                            perform: cargo.validateCompartmentWeight)
                    Spacer()
                    Position42View()
                        .onChange(
                            of: cargo.position42.totalWeight,
                            perform: cargo.validateCompartmentWeight)
                    Spacer()
                    Position43View()
                        .onChange(
                            of: cargo.position43.totalWeight,
                            perform: cargo.validateCompartmentWeight)
                    Spacer()
                }
                .onAppear(perform: feedBack.prepare)

                Section(header: Text("Aft Hold Totals").foregroundColor(.primary)) {
                    AftHoldTotalsView()
                }
                .onAppear(perform: feedBack.prepare)

                Section(header: Text("Bulk Hold")
                            .foregroundColor(.primary)) {
                    BulkView()
                        .onChange(
                            of: cargo.compartment5TotalWeight,
                            perform: cargo.validateCompartmentWeight)
                }
                .onAppear(perform: feedBack.prepare)


                Section(header: Text("Bulk Hold Totals").foregroundColor(.primary)) {
                    BulkHoldTotalView()
                }
            }
            .navigationBarTitle("Cargo Hold")
            .navigationBarItems(
                leading: Button(action: hideKeyboard) {
                    Image(systemName: "keyboard")
                        .font(.system(size: 30))
                        .foregroundColor(.accentColor)
                        .padding()
                },
                trailing: Button(action: cargo.resetCargoToEmpty) {
                    Image(systemName: "trash")
                        .font(.system(size: 30))
                        .foregroundColor(.accentColor)
                        .padding()
                })
            .alert(item: $cargo.overWeightAlert) { overWeight in
                self.feedBack.notificationOccurred(.error)
                return Alert(title: Text(overWeight.rawValue),
                             message: Text(cargo.message),
                             dismissButton: .destructive(Text("Remove last entry"), action: {
                                cargo.removeOverWeightEntry(for: overWeight)
                             }) )
            }
        }
    }
}
