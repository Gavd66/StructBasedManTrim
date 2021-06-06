//
//  Positon42View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI

struct Positon42View: View {
    @EnvironmentObject var underFloor: UnderFloor
    var position = 42
    var body: some View {

        Picker("Position \(position)", selection: $underFloor.position42.container.animation().onChange(underFloor.position42.applyContainerLogic)) {
            ForEach(Container.allCases, id:\.self) {
                Text("\(position)\($0.rawValue)")
            }
        }
        .pickerStyle(SegmentedPickerStyle())

        switch underFloor.position42.container {
        case .numberPapa:
            HStack {
                Text("\(position)P Cargo kg: ").foregroundColor(.blue)
                TextField("\(position)P Cargo Weight", text: $underFloor.position42.cargoStringWeight)
            }
        case .numberOnly:
            HStack {
                Text("\(position) Cargo kg: ").foregroundColor(.blue)
                TextField("\(position) Cargo Weight", text: $underFloor.position42.cargoStringWeight)
            }
        case .leftAndRight:
            Group {
                Group {
                    Picker("AKEweight", selection: $underFloor.position42.left.animation()
                            .onChange(underFloor.position42.applyPositionLeftLogic)) {
                        ForEach(Ake.allCases, id:\.self) {
                            Text("\(position)L \($0.rawValue)")

                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    switch underFloor.position42.left {
                    case .ake:
                        HStack {
                            Text("\(position)L Bags: ").foregroundColor(.blue)
                            TextField("\(position)L Bagnumbers", text: $underFloor.position42.bagCountLeft)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    case .nilFit:
                        Text("\(position)L:  NIL FIT").foregroundColor(.blue)
                    case .cargo:
                        HStack {
                            Text("\(position)L Cargo kg:").foregroundColor(.blue)
                            TextField("\(position)L Cargo Weight kg:" , text: $underFloor.position42.cargoLeft)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }

                } // End L group

                Group {
                    Picker("AKEweight", selection: $underFloor.position42.right.animation()
                            .onChange(underFloor.position42.applyPositionRightLogic)) {
                        ForEach(Ake.allCases, id:\.self) {
                            Text("\(position)R \($0.rawValue)")

                        }

                    }
                    .pickerStyle(SegmentedPickerStyle())

                    switch underFloor.position42.right {
                    case .ake:
                        HStack {
                            Text("\(position)R Bags:")
                                .foregroundColor(.blue)
                                .layoutPriority(1)
                            TextField("\(position)R Bagnumbers", text: $underFloor.position42.bagCountRight)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    case .nilFit:
                        Text("\(position)R:  NIL FIT").foregroundColor(.blue)
                    case .cargo:
                        HStack {
                            Text("\(position)R Cargo kg:").foregroundColor(.blue)
                            TextField("\(position)R Cargo Weight kg" , text: $underFloor.position42.cargoRight)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }

                } // End R group

            } // end group
        }
    }
}
