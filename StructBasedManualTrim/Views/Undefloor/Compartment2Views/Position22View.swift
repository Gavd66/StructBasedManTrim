//
//  Position22View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI

struct Position22View: View {
    @EnvironmentObject var underFloor: UnderFloor
    var position = 22
    var body: some View {

        Picker("Position \(position)", selection: $underFloor.position22.container
                .animation()
                .onChange(underFloor.position22.applyContainerLogic)) {
            ForEach(Container.allCases, id:\.self) {
                Text("\(position)\($0.rawValue)")
            }
        }
        .pickerStyle(SegmentedPickerStyle())

        switch underFloor.position22.container {
        case .numberOnly:
            HStack {
                Button(action: hideKeyboard) {
                    if underFloor.position22.hasCargoInPosition {
                        Text("\(position) Cargo")
                            .loadedStyle()
                    } else {
                        Text("\(position) Cargo")
                            .emptyStyle()
                    }
                }
                .capsuleStyle()

                TextField("0 kg",
                          text: $underFloor.position22.cargoStringWeight
                            .animation()
                            .onChange(underFloor.position22.updateCargoLabel))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if underFloor.position22.hasCargoInPosition {
                    Text("kg")
                        .loadedStyle()
                }
            }
        case .numberPapa:
            HStack {
                Button(action: hideKeyboard) {
                    if underFloor.position22.hasCargoInPapa {
                        Text("\(position)P Cargo")
                            .loadedStyle()
                    } else {
                        Text("\(position)P Cargo")
                            .emptyStyle()
                    }
                }
                .capsuleStyle()

                TextField("0 kg",
                          text: $underFloor.position22.cargoPapaStringWeight
                            .animation()
                            .onChange(underFloor.position22.updateCargoPapaLabel))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if underFloor.position22.hasCargoInPapa {
                    Text("kg")
                        .loadedStyle()
                }
            }
        case .leftAndRight:
            Group {
                Group {
                    Picker("AKEweight", selection: $underFloor.position22.left.animation()
                            .onChange(underFloor.position22.applyPositionLeftLogic)) {
                        ForEach(Ake.allCases, id:\.self) {
                            Text("\(position)L \($0.rawValue)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    switch underFloor.position22.left {
                    case .nilFit:

                        HStack {
                            Spacer()
                            Text("\(position)L  NIL FIT")
                                .nilFitStyle()
                            Spacer()
                        }
                    case .ake:
                        HStack {
                            Button(action: hideKeyboard) {
                                if underFloor.position22.hasBagsInLeft {
                                    Text("\(position)L Bags")
                                        .loadedStyle()
                                } else {
                                    Text("\(position)L  ")
                                        .emptyStyle()
                                }
                            }
                            .capsuleStyle()

                            TextField("0 bags", text: $underFloor.position22.bagCountLeft
                                        .animation()
                                        .onChange(underFloor.position22.updateLeftLabels))

                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)

                            if underFloor.position22.hasBagsInLeft {
                                Text("\(underFloor.position22.bagWeightLeft) kg")
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
                                if underFloor.position22.hasCargoInLeft {
                                    Text("\(position)L Cargo")
                                        .loadedStyle()
                                } else {
                                    Text("\(position)L Cargo")
                                        .emptyStyle()
                                }
                            }
                            .capsuleStyle()

                            TextField("0 kg" , text: $underFloor.position22.cargoLeft
                                        .animation()
                                        .onChange(
                                            withAnimation(.easeInOut) {
                                                underFloor.position22.updateCargoRightLabels
                                            }
                                        ))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad).onAppear()

                            if underFloor.position22.hasCargoInLeft {
                                Text("kg")
                                    .loadedStyle()
                            }
                        }
                        .font(.system(size: 18))
                    }
                } // End Left Group
                // dismiss the number pad automatically when changing selections
                .onChange(of: underFloor.position22.left,
                          perform: dismissAKEKeyBoard)
                .onChange(of: underFloor.position22.container,
                          perform: dismissContainerKeyBoard)

                Group {
                    Picker("AKEweight", selection: $underFloor.position22.right.animation()
                            .onChange(underFloor.position22.applyPositionRightLogic)) {
                        ForEach(Ake.allCases, id:\.self) {
                            Text("\(position)R \($0.rawValue)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    switch underFloor.position22.right {
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
                                if underFloor.position22.hasBagsInRight {
                                    Text("\(position)R Bags")
                                        .loadedStyle()
                                        .capsuleStyle()
                                } else {
                                    Text("\(position)R ")
                                        .emptyStyle()
                                        .capsuleStyle()
                                }
                            }

                            TextField("0 Bags", text: $underFloor.position22.bagCountRight
                                        .animation()
                                        .onChange(
                                            withAnimation(.easeIn(duration: 2)) {
                                                underFloor.position22.updateRightLabels
                                            }
                                        ))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)

                            if underFloor.position22.hasBagsInRight {
                                Text("\(underFloor.position22.bagWeightRight) kg")
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
                                if underFloor.position22.hasCargoInRight {
                                    Text("\(position)R Cargo")
                                        .loadedStyle()
                                        .capsuleStyle()
                                } else {
                                    Text("\(position)R Cargo")
                                        .emptyStyle()
                                        .capsuleStyle()
                                }
                            }

                            TextField("0 kg" ,text: $underFloor.position22.cargoRight
                                        .animation()
                                        .onChange(underFloor.position22.updateCargoLeftLabels))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)

                            if underFloor.position22.hasCargoInRight {
                                Text("kg")
                                    .loadedStyle()
                            }
                        }
                        .font(.system(size: 18))
                    }
                } // End Right Group
                .onChange(of: underFloor.position22.right, perform: dismissAKEKeyBoard)
                .onChange(of: underFloor.position22.container, perform: dismissContainerKeyBoard)
            } // end L + R group

        }
    } // End body

    // Methods to automatically dismiss the numeral keyboard on change of selection
    func dismissAKEKeyBoard(_ ake: Ake ) {
        if underFloor.position22.hideKeyboard {
            hideKeyboard()
        }
    }

    func dismissContainerKeyBoard(_ container: Container) {
        if underFloor.position22.hideKeyboard {
            hideKeyboard()
        }
    }
}
