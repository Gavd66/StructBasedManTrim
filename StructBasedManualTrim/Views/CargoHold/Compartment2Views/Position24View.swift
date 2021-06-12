//
//  Position24View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI

struct Position24View: View {
    @EnvironmentObject var cargoHold: CargoHold
    var position = 24
    var body: some View {

        Picker("Position \(position)", selection: $cargoHold.position24.container
                .animation()
                .onChange(cargoHold.position24.applyContainerLogic)) {
            ForEach(Container.allCases, id:\.self) {
                Text("\(position)\($0.rawValue)")
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .onChange(of: cargoHold.position24.container, perform: dismissContainerKeyBoard)

        switch cargoHold.position24.container {
        case .numberOnly:
            HStack {
                Button(action: hideKeyboard) {
                    if cargoHold.position24.hasCargoInPosition {
                        Text("\(position) Cargo")
                            .loadedStyle()
                    } else {
                        Text("\(position) Cargo")
                            .emptyStyle()
                    }
                }
                .capsuleStyle()

                TextField("0 kg",
                          text: $cargoHold.position24.cargoStringWeight
                            .animation()
                            .onChange(cargoHold.position24.updateCargoLabel))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if cargoHold.position24.hasCargoInPosition {
                    Text("kg")
                        .loadedStyle()
                }
            }
        case .numberPapa:
            HStack {
                Button(action: hideKeyboard) {
                    if cargoHold.position24.hasCargoInPapa {
                        Text("\(position)P Cargo")
                            .loadedStyle()
                    } else {
                        Text("\(position)P Cargo")
                            .emptyStyle()
                    }
                }
                .capsuleStyle()

                TextField("0 kg",
                          text: $cargoHold.position24.cargoPapaStringWeight
                            .animation()
                            .onChange(cargoHold.position24.updateCargoPapaLabel))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if cargoHold.position24.hasCargoInPapa {
                    Text("kg")
                        .loadedStyle()
                }
            }
            .onChange(of: cargoHold.position24.container,
                      perform: dismissContainerKeyBoard)

        case .leftAndRight:
            Group {
                Group {
                    Picker("AKEweight", selection: $cargoHold.position24.left.animation()
                            .onChange(cargoHold.position24.applyPositionLeftLogic)) {
                        ForEach(Ake.allCases, id:\.self) {
                            Text("\(position)L \($0.rawValue)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    switch cargoHold.position24.left {
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
                                if cargoHold.position24.hasBagsInLeft {
                                    Text("\(position)L Bags")
                                        .loadedStyle()
                                } else {
                                    Text("\(position)L  ")
                                        .emptyStyle()
                                }
                            }
                            .capsuleStyle()

                            TextField("0 bags", text: $cargoHold.position24.bagCountLeft
                                        .animation()
                                        .onChange(cargoHold.position24.updateLeftLabels))

                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)

                            if cargoHold.position24.hasBagsInLeft {
                                Text("\(cargoHold.position24.bagWeightLeft) kg")
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
                                if cargoHold.position24.hasCargoInLeft {
                                    Text("\(position)L Cargo")
                                        .loadedStyle()
                                } else {
                                    Text("\(position)L Cargo")
                                        .emptyStyle()
                                }
                            }
                            .capsuleStyle()

                            TextField("0 kg" , text: $cargoHold.position24.cargoLeft
                                        .animation()
                                        .onChange(
                                            withAnimation(.easeInOut) {
                                                cargoHold.position24.updateCargoRightLabels
                                            }
                                        ))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad).onAppear()

                            if cargoHold.position24.hasCargoInLeft {
                                Text("kg")
                                    .loadedStyle()
                            }
                        }
                        .font(.system(size: 18))
                    }
                } // End Left Group
                // dismiss the number pad automatically when changing selections
                .onChange(of: cargoHold.position24.left,
                          perform: dismissAKEKeyBoard)


                Group {
                    Picker("AKEweight", selection: $cargoHold.position24.right.animation()
                            .onChange(cargoHold.position24.applyPositionRightLogic)) {
                        ForEach(Ake.allCases, id:\.self) {
                            Text("\(position)R \($0.rawValue)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    switch cargoHold.position24.right {
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
                                if cargoHold.position24.hasBagsInRight {
                                    Text("\(position)R Bags")
                                        .loadedStyle()
                                        .capsuleStyle()
                                } else {
                                    Text("\(position)R ")
                                        .emptyStyle()
                                        .capsuleStyle()
                                }
                            }

                            TextField("0 Bags", text: $cargoHold.position24.bagCountRight
                                        .animation()
                                        .onChange(
                                            withAnimation(.easeIn(duration: 2)) {
                                                cargoHold.position24.updateRightLabels
                                            }
                                        ))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)

                            if cargoHold.position24.hasBagsInRight {
                                Text("\(cargoHold.position24.bagWeightRight) kg")
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
                                if cargoHold.position24.hasCargoInRight {
                                    Text("\(position)R Cargo")
                                        .loadedStyle()
                                        .capsuleStyle()
                                } else {
                                    Text("\(position)R Cargo")
                                        .emptyStyle()
                                        .capsuleStyle()
                                }
                            }

                            TextField("0 kg" ,text: $cargoHold.position24.cargoRight
                                        .animation()
                                        .onChange(cargoHold.position24.updateCargoLeftLabels))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)

                            if cargoHold.position24.hasCargoInRight {
                                Text("kg")
                                    .loadedStyle()
                            }
                        }
                        .font(.system(size: 18))
                    }
                } // End Right Group
                .onChange(of: cargoHold.position24.right, perform: dismissAKEKeyBoard)

            }
        } // Container

    } // End body

    // Methods to automatically dismiss the numeral keyboard on change of selection
    func dismissAKEKeyBoard(_ ake: Ake ) {
        if cargoHold.position24.hideKeyboard {
            hideKeyboard()
        }
    }

    func dismissContainerKeyBoard(_ container: Container) {
        if cargoHold.position24.hideKeyboard {
            hideKeyboard()
        }
    }
}
