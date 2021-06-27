//
//  PositionView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 23/6/21.
//

import SwiftUI

struct PositionView: View {

    var position: Int
    var bindingCargoPosition: Binding<MainHold>
    var cargoPosition: MainHold

    var body: some View {

        Picker("Position \(position)", selection: bindingCargoPosition.container
                .animation()
                .onChange(cargoPosition.applyContainerLogic)) {
            ForEach(Container.allCases, id:\.self) {
                Text("\(position)\($0.rawValue)")
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .onChange(of: cargoPosition.container, perform: dismissContainerKeyBoard)

        switch cargoPosition.container {

        case .numberOnly:

            CargoNumberView(position: position,
                           bindingMainHoldInstance: bindingCargoPosition,
                           mainHoldInstance: cargoPosition)

        case .numberPapa:

            CargoPapaView(position: position,
                           bindingMainHoldInstance: bindingCargoPosition,
                           mainHoldInstance: cargoPosition)
                .onChange(of: cargoPosition.container,
                          perform: dismissContainerKeyBoard)

        case .leftAndRight:

            Group {
                Group {
                    Picker("AKEweight", selection:bindingCargoPosition.left.animation()
                            .onChange(cargoPosition.applyPositionLeftLogic)) {
                        ForEach(Ake.allCases, id:\.self) {
                            Text("\(position)L \($0.rawValue)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    switch cargoPosition.left {
                    case .nilFit:
                        NilFitLeftView(position: position)

                    case .ake:
                        AkeLeftView(position: position,
                                    bindingMainHoldInstance: bindingCargoPosition,
                                    mainHoldInstance: cargoPosition)
                    case .cargo:
                        CargoLeftView(position: position,
                                      bindingMainHoldInstance:  bindingCargoPosition,
                                      mainHoldInstance: cargoPosition)
                    }
                } // End Left Group
                // dismiss the number pad automatically when changing selections
                .onChange(of: cargoPosition.left,
                          perform: dismissAKEKeyBoard)

                Group {
                    Picker("AKEweight", selection: bindingCargoPosition.right.animation()
                            .onChange(cargoPosition.applyPositionRightLogic)) {
                        ForEach(Ake.allCases, id:\.self) {
                            Text("\(position)R \($0.rawValue)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    switch cargoPosition.right {
                    case .nilFit:
                        NilFitRightView(position: position)
                    case .ake:
                        AkeRightView(position: position,
                                     bindingMainHoldInstance: bindingCargoPosition,
                                     mainHoldInstance: cargoPosition)
                    case .cargo:
                        CargoRightView(position: position,
                                       bindingMainHoldInstance: bindingCargoPosition,
                                       mainHoldInstance: cargoPosition)
                    }
                } // End Right Group
                .onChange(of: cargoPosition.right, perform: dismissAKEKeyBoard)
            }
        } // Container
    }

    func dismissAKEKeyBoard(_ ake: Ake ) {
        if cargoPosition.hideKeyboard {
            hideKeyboard()
        }
    }

    func dismissContainerKeyBoard(_ container: Container) {
        if cargoPosition.hideKeyboard {
            hideKeyboard()
        }
    }
}



