//
//  Position11View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI


struct Position11View: View {
    @EnvironmentObject var underFloor: UnderFloor
    var position = 11
    var body: some View {

        Picker("Position \(position)", selection: $underFloor.position11.container.animation()
                .onChange(underFloor.position11.applyContainerLogic)) {
            ForEach(Container.allCases, id:\.self) {
                Text("\(position)\($0.rawValue)")
            }
        }
        .pickerStyle(SegmentedPickerStyle())

        switch underFloor.position11.container {
        case .numberPapa:
            HStack {
                Text("\(position)P Cargo kg: ").foregroundColor(.blue)
                TextField("\(position)P Cargo Weight", text: $underFloor.position11.cargoStringWeight)
            }
        case .numberOnly:
            HStack {
                Text("\(position) Cargo kg: ").foregroundColor(.blue)
                TextField("\(position) Cargo Weight", text: $underFloor.position11.cargoStringWeight)
            }
        case .leftAndRight:
            Group {
                Group {
                    Picker("AKEweight", selection: $underFloor.position11.positionLeft.animation()
                            .onChange(underFloor.position11.applyPositionLeftLogic)) {
                        ForEach(Ake.allCases, id:\.self) {
                            Text("\(position)L \($0.rawValue)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    switch underFloor.position11.positionLeft {
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
                                if underFloor.position11.hasBagsInLeft {

                                    Text("\(position)L Bags")
                                        .foregroundColor(.accentColor)
                                        .layoutPriority(1)
                                        .transition(.scale)
                                } else {
                                    Text("\(position)Left")
                                        .foregroundColor(.black)
                                        .padding(.trailing, 5)
                                        .layoutPriority(1)
                                        .transition(.scale)
                                }
                            }
                           // .allowsHitTesting(underFloor.position11.hideKeyboard)
                            TextField("0 bags", text: $underFloor.position11.bagCountLeft.animation()
                                        .onChange(underFloor.position11.animateChangeLeft))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)

                            // Use logic to display ake tare weight info if no bags
                            // Animate the change to make it more noticeable
                            if underFloor.position11.hasBagsInLeft {
                                Text("Total Wt: \(underFloor.position11.bagWeightLeft) kg")
                                    .foregroundColor(.accentColor)
                                    .layoutPriority(1)
                                    .transition(.scale)
                            } else {
                                Text("AKE: 71kg ")
                                    .foregroundColor(.black)
                                    .layoutPriority(1)
                                    .transition(.scale)
                            }
                        }
                        .font(.system(size: 18))

                    case .cargo:
                        HStack {
                            Text("\(position)L Cargo kg:").foregroundColor(.blue)
                            TextField("\(position)L Cargo Weight kg:" , text: $underFloor.position11.cargoLeft)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad).onAppear()
                        }
                        .font(.system(size: 18))
                    }
                } // End Left Group
                .onTapGesture(count: 2, perform: hideKeyboard)
                .onLongPressGesture(perform: hideKeyboard)

                Group {
                    Picker("AKEweight", selection: $underFloor.position11.positionRight.animation()
                            .onChange(underFloor.position11.applyPositionRightLogic)) {
                        ForEach(Ake.allCases, id:\.self) {
                            Text("\(position)R \($0.rawValue)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    switch underFloor.position11.positionRight {
                    case .nilFit:
                        HStack {
                            Spacer()
                            Text("\(position)R  NIL FIT")
                                .nilFitStyle()
                            Spacer()
                        }


                    case .ake:
                        HStack {
                            Text("\(position)R Bags:")
                                .foregroundColor(.blue)
                                .layoutPriority(1)
                            TextField("\(position)R Empty", text: $underFloor.position11.bagCountRight.animation()
                                        .onChange(underFloor.position11.animateChangeRight))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)

                            // Use logic to display ake tare weight info if no bags
                            // Animate the change to make it more noticeable
                            if underFloor.position11.hasBagsInRight {
                                Text("Total Wt: \(underFloor.position11.bagWeightRight) kg")
                                    .foregroundColor(.blue)
                                    .layoutPriority(1)
                                    .transition(.scale)
                            } else {
                                Text("AKE Wt: 71kg ")
                                    .foregroundColor(.blue)
                                    .layoutPriority(1)
                                    .transition(.scale)
                            }
                        }
                        .font(.system(size: 18))

                    case .cargo:
                        HStack {
                            Text("\(position)R Cargo kg:").foregroundColor(.blue)
                            TextField("\(position)R Cargo Weight kg" , text: $underFloor.position11.cargoRight)
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
    }
}

