//
//  Position12View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI

struct Position12View: View {
    @EnvironmentObject var underFloor: UnderFloor
    var position = 12
    var body: some View {

        Picker("Position \(position)", selection: $underFloor.position12.container
                .animation()
                .onChange(underFloor.position12.applyContainerLogic)) {
            ForEach(Container.allCases, id:\.self) {
                Text("\(position)\($0.rawValue)")
            }
        }
        .pickerStyle(SegmentedPickerStyle())

        switch underFloor.position12.container {
        case .numberOnly:
            HStack {
                Button(action: hideKeyboard) {
                    if underFloor.position12.hasCargoInPosition {
                        Text("\(position) Cargo kg: ")
                            .loadedStyle()
                    } else {
                        Text("\(position) Cargo kg: ")
                            .emptyStyle()
                    }
                }
                TextField("0 kg",
                          text: $underFloor.position12.cargoStringWeight
                            .animation()
                            .onChange(underFloor.position12.updateCargoLabel))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
            }
        case .numberPapa:
            HStack {
                Button(action: hideKeyboard) {
                    if underFloor.position12.hasCargoInPapa {
                        Text("\(position)P Cargo kg: ")
                            .loadedStyle()
                    } else {
                        Text("\(position)P Cargo kg: ")
                            .emptyStyle()
                    }
                }
                TextField("0 kg",
                          text: $underFloor.position12.cargoPapaStringWeight
                            .animation()
                            .onChange(underFloor.position12.updateCargoPapaLabel))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
            }

        case .leftAndRight:
            Group {
                Group {
                    Picker("AKEweight", selection: $underFloor.position12.left.animation()
                            .onChange(underFloor.position12.applyPositionLeftLogic)) {
                        ForEach(Ake.allCases, id:\.self) {
                            Text("\(position)L \($0.rawValue)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    switch underFloor.position12.left {
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

                                if underFloor.position12.hasBagsInLeft {
                                    Text("\(position)L Bags")
                                        .loadedStyle()
                                } else {
                                    Text("\(position)Left")
                                        .emptyStyle()
                                }
                            }

                            TextField("0 bags", text: $underFloor.position12.bagCountLeft
                                        .animation()
                                        .onChange(underFloor.position12.updateLeftLabels))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)

                            if underFloor.position12.hasBagsInLeft {
                                Text("Total Wt: \(underFloor.position12.bagWeightLeft) kg")
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
                                if underFloor.position12.hasCargoInLeft {

                                    Text("\(position)L Cargo kg:")
                                        .loadedStyle()
                                } else {
                                    Text("\(position)L Cargo kg:")
                                        .emptyStyle()
                                }
                            }
                            TextField("0 kg" , text: $underFloor.position12.cargoLeft
                                        .animation()
                                        .onChange(underFloor.position12.updateCargoRightLabels))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad).onAppear()
                        }
                        .font(.system(size: 18))
                    }
                } // End Left Group
                .onTapGesture(count: 2, perform: hideKeyboard)
                .onLongPressGesture(perform: hideKeyboard)

                Group {
                    Picker("AKEweight", selection: $underFloor.position12.right.animation()
                            .onChange(underFloor.position12.applyPositionRightLogic)) {
                        ForEach(Ake.allCases, id:\.self) {
                            Text("\(position)R \($0.rawValue)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    switch underFloor.position12.right {
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
                                if underFloor.position12.hasBagsInRight {
                                    Text("\(position)R Bags")
                                        .loadedStyle()
                                } else {
                                    Text("\(position)R ")
                                        .emptyStyle()
                                }
                            }

                            TextField("0 Bags", text: $underFloor.position12.bagCountRight
                                        .animation()
                                        .onChange(underFloor.position12.updateRightLabels))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)

                            if underFloor.position12.hasBagsInRight {
                                Text("Total Wt: \(underFloor.position12.bagWeightRight) kg")
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
                                if underFloor.position12.hasCargoInRight {

                                    Text("\(position)R Cargo kg:")
                                        .loadedStyle()
                                } else {
                                    Text("\(position)R Cargo kg:")
                                        .emptyStyle()
                                }
                            }
                            TextField("0 kg" ,
                                      text: $underFloor.position12.cargoRight
                                        .animation()
                                        .onChange(underFloor.position12.updateCargoLeftLabels))
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

