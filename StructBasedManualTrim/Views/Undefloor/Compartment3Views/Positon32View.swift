//
//  Positon32View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI

struct Positon32View: View {
    @EnvironmentObject var underFloor: UnderFloor
    var position = 32
    var body: some View {

        Picker("Position \(position)", selection: $underFloor.position32.container.animation().onChange(underFloor.position32.applyContainerLogic)) {
            ForEach(Container.allCases, id:\.self) {
                Text("\(position)\($0.rawValue)")
            }
        }
        .pickerStyle(SegmentedPickerStyle())

        switch underFloor.position32.container {
        case .numberPapa:
            HStack {
                Text("\(position)P Cargo kg: ").foregroundColor(.blue)
                TextField("\(position)P Cargo Weight", text: $underFloor.position32.cargoStringWeight)
            }
        case .numberOnly:
            HStack {
                Text("\(position) Cargo kg: ").foregroundColor(.blue)
                TextField("\(position) Cargo Weight", text: $underFloor.position32.cargoStringWeight)
            }
        case .leftAndRight:
            Group {
                Group {
                    Picker("AKEweight", selection: $underFloor.position32.positionLeft.animation()
                            .onChange(underFloor.position32.applyPositionLeftLogic)) {
                        ForEach(Ake.allCases, id:\.self) {
                            Text("\(position)L \($0.rawValue)")

                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    switch underFloor.position32.positionLeft {
                    case .ake:
                        HStack {
                            Text("\(position)L Bags: ").foregroundColor(.blue)
                            TextField("\(position)L Bagnumbers", text: $underFloor.position32.bagCountLeft)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    case .nilFit:
                        Text("\(position)L:  NIL FIT").foregroundColor(.blue)
                    case .cargo:
                        HStack {
                            Text("\(position)L Cargo kg:").foregroundColor(.blue)
                            TextField("\(position)L Cargo Weight kg:" , text: $underFloor.position32.cargoLeft)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }

                } // End L group

                Group {
                    Picker("AKEweight", selection: $underFloor.position32.positionRight.animation()
                            .onChange(underFloor.position32.applyPositionRightLogic)) {
                        ForEach(Ake.allCases, id:\.self) {
                            Text("\(position)R \($0.rawValue)")

                        }

                    }
                    .pickerStyle(SegmentedPickerStyle())

                    switch underFloor.position32.positionRight {
                    case .ake:
                        HStack {
                            Text("\(position)R Bags:")
                                .foregroundColor(.blue)
                                .layoutPriority(1)
                            TextField("\(position)R Bagnumbers", text: $underFloor.position32.bagCountRight)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    case .nilFit:
                        Text("\(position)R:  NIL FIT").foregroundColor(.blue)
                    case .cargo:
                        HStack {
                            Text("\(position)R Cargo kg:").foregroundColor(.blue)
                            TextField("\(position)R Cargo Weight kg" , text: $underFloor.position32.cargoRight)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }

                } // End R group

            } // end group
        }
    }
}
