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

        Picker("Position \(position)", selection: $underFloor.position22.container.animation().onChange(underFloor.position22.applyContainerLogic)) {
            ForEach(Container.allCases, id:\.self) {
                Text("\(position)\($0.rawValue)")
            }
        }
        .pickerStyle(SegmentedPickerStyle())

        switch underFloor.position22.container {
        case .numberPapa:
            HStack {
                Text("\(position)P Cargo kg: ").foregroundColor(.blue)
                TextField("\(position)P Cargo Weight", text: $underFloor.position22.cargoStringWeight)
            }
        case .numberOnly:
            HStack {
                Text("\(position) Cargo kg: ").foregroundColor(.blue)
                TextField("\(position) Cargo Weight", text: $underFloor.position22.cargoStringWeight)
            }
        case .leftAndRight:
            Group {
                Group {
                    Picker("AKEweight", selection: $underFloor.position22.positionLeft.animation()
                            .onChange(underFloor.position22.applyPositionLeftLogic)) {
                        ForEach(Ake.allCases, id:\.self) {
                            Text("\(position)L \($0.rawValue)")

                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    switch underFloor.position22.positionLeft {
                    case .ake:
                        HStack {
                            Text("\(position)L Bags: ").foregroundColor(.blue)
                            TextField("\(position)L Bagnumbers", text: $underFloor.position22.bagCountLeft)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    case .nilFit:
                        Text("\(position)L:  NIL FIT").foregroundColor(.blue)
                    case .cargo:
                        HStack {
                            Text("\(position)L Cargo kg:").foregroundColor(.blue)
                            TextField("\(position)L Cargo Weight kg:" , text: $underFloor.position22.cargoLeft)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }

                } // End L group

                Group {
                    Picker("AKEweight", selection: $underFloor.position22.positionRight.animation()
                            .onChange(underFloor.position22.applyPositionRightLogic)) {
                        ForEach(Ake.allCases, id:\.self) {
                            Text("\(position)R \($0.rawValue)")

                        }

                    }
                    .pickerStyle(SegmentedPickerStyle())

                    switch underFloor.position22.positionRight {
                    case .ake:
                        HStack {
                            Text("\(position)R Bags:")
                                .foregroundColor(.blue)
                                .layoutPriority(1)
                            TextField("\(position)R Bagnumbers", text: $underFloor.position22.bagCountRight)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    case .nilFit:
                        Text("\(position)R:  NIL FIT").foregroundColor(.blue)
                    case .cargo:
                        HStack {
                            Text("\(position)R Cargo kg:").foregroundColor(.blue)
                            TextField("\(position)R Cargo Weight kg" , text: $underFloor.position22.cargoRight)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }

                } // End R group

            } // end group
        }
    }
}
