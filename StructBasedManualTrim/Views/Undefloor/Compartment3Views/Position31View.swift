//
//  Position31View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI

struct Position31View: View {
    @EnvironmentObject var underFloor: UnderFloor
    var position = 31
    var body: some View {

        Picker("Position \(position)", selection: $underFloor.position31.container
                .animation()
                .onChange(underFloor.position31.applyContainerLogic)) {
            ForEach(Container.allCases, id:\.self) {
                Text("\(position)\($0.rawValue)")
            }
        }
        .pickerStyle(SegmentedPickerStyle())

        switch underFloor.position31.container {
        case .numberOnly:
            HStack {
                Button(action: hideKeyboard) {
                    if underFloor.position31.hasCargoInPosition {
                        Text("\(position) Cargo kg: ")
                            .loadedStyle()
                    } else {
                        Text("\(position) Cargo kg: ")
                            .emptyStyle()
                    }
                }
                TextField("0 kg",
                          text: $underFloor.position31.cargoStringWeight
                            .animation()
                            .onChange(underFloor.position31.updateCargoLabel))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
            }
        case .numberPapa:
            HStack {
                Button(action: hideKeyboard) {
                    if underFloor.position31.hasCargoInPapa {
                        Text("\(position)P Cargo kg: ")
                            .loadedStyle()
                    } else {
                        Text("\(position)P Cargo kg: ")
                            .emptyStyle()
                    }
                }
                TextField("0 kg",
                          text: $underFloor.position31.cargoPapaStringWeight
                            .animation()
                            .onChange(underFloor.position31.updateCargoPapaLabel))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
            }

        case .leftAndRight:
            Group {
                Group {
                    Picker("AKEweight", selection: $underFloor.position31.left.animation()
                            .onChange(underFloor.position31.applyPositionLeftLogic)) {
                        ForEach(Ake.allCases, id:\.self) {
                            Text("\(position)L \($0.rawValue)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    switch underFloor.position31.left {
                    case .nilFit:

                        HStack {
                            Spacer()
                            Text("\(position)L  NIL FIT")
                                .nilFitStyle()
                            Spacer()
                        }
                    case .ake:
                        HStack {

                            // Serperate textfield functions to eliminate bugs
                            // Button, when no bags entered button is disabled, when bags, button enabled to dismiss keyboard
                            Button(action: hideKeyboard) {

                                if underFloor.position31.hasBagsInLeft {
                                    Text("\(position)L Bags")
                                        .loadedStyle()
                                } else {
                                    Text("\(position)Left")
                                        .emptyStyle()
                                }
                            }

                            TextField("0 bags", text: $underFloor.position31.bagCountLeft
                                        .animation()
                                        .onChange(underFloor.position31.updateLeftLabels))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)

                            if underFloor.position31.hasBagsInLeft {
                                Text("Total Wt: \(underFloor.position31.bagWeightLeft) kg")
                                    .loadedStyle()
                            } else {
                                Text("AKE: 71kg ")
                                    .loadedStyle()
                            }
                        }
                        .font(.system(size: 18))

                    case .cargo:
                        HStack {
                            Button(action: hideKeyboard) {
                                if underFloor.position31.hasCargoInLeft {

                                    Text("\(position)L Cargo kg:")
                                        .loadedStyle()
                                } else {
                                    Text("\(position)L Cargo kg:")
                                        .emptyStyle()
                                }
                            }
                            TextField("0 kg" , text: $underFloor.position31.cargoLeft
                                        .animation()
                                        .onChange(underFloor.position31.updateCargoRightLabels))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad).onAppear()
                        }
                        .font(.system(size: 18))
                    }
                } // End Left Group
                .onTapGesture(count: 2, perform: hideKeyboard)
                .onLongPressGesture(perform: hideKeyboard)

                Group {
                    Picker("AKEweight", selection: $underFloor.position31.right.animation()
                            .onChange(underFloor.position31.applyPositionRightLogic)) {
                        ForEach(Ake.allCases, id:\.self) {
                            Text("\(position)R \($0.rawValue)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    switch underFloor.position31.right {
                    case .nilFit:
                        HStack {
                            Spacer()
                            Text("\(position)R  NIL FIT")
                                .nilFitStyle()
                            Spacer()
                        }

                    case .ake:
                        HStack {
                            Button(action: hideKeyboard) {
                                if underFloor.position31.hasBagsInRight {
                                    Text("\(position)R Bags")
                                        .loadedStyle()
                                } else {
                                    Text("\(position)R ")
                                        .emptyStyle()
                                }
                            }

                            TextField("0 Bags", text: $underFloor.position31.bagCountRight
                                        .animation()
                                        .onChange(underFloor.position31.updateRightLabels))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)

                            if underFloor.position31.hasBagsInRight {
                                Text("Total Wt: \(underFloor.position31.bagWeightRight) kg")
                                    .loadedStyle()
                            } else {
                                Text("AKE: 71kg ")
                                    .loadedStyle()
                            }
                        }
                        .font(.system(size: 18))

                    case .cargo:
                        HStack {
                            Button(action: hideKeyboard) {
                                if underFloor.position31.hasCargoInRight {

                                    Text("\(position)R Cargo kg:")
                                        .loadedStyle()
                                } else {
                                    Text("\(position)R Cargo kg:")
                                        .emptyStyle()
                                }
                            }
                            TextField("0 kg" ,
                                      text: $underFloor.position31.cargoRight
                                        .animation()
                                        .onChange(underFloor.position31.updateCargoLeftLabels))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                        }
                        .font(.system(size: 18))
                    }
                } // End Right Group
                .onTapGesture(count: 2, perform: hideKeyboard)
                .onLongPressGesture(perform: hideKeyboard)
            } // end L + R group
        }
    } // End body
}

