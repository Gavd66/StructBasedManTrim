//
//  MainAndBulkHolds.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 28/6/21.
//

import Foundation

class MainHold {

    var container: Container = .leftAndRight
    var cargoStringWeight = ""
    var cargoPapaStringWeight = ""
    var bagCountLeft = ""
    var bagCountRight = ""
    var cargoLeft = ""
    var cargoRight = ""
    var left: Ake = .nilFit
    var right: Ake = .nilFit
    var hideKeyboard = false

    //MARK:- Weight Calculations
    var bagWeightLeft: Int {
        let bagNumbers = Int(bagCountLeft) ?? 0
        return bagNumbers * 18 + left.setAKEWeightLeft
    }
    var bagWeightRight : Int {
        let bagNumbers = Int(bagCountRight) ?? 0
        return  bagNumbers * 18 + right.setAKEWeightRight
    }
    var cargoWeightLeft: Int {
        Int(cargoLeft) ?? 0
    }

    var cargoWeightRight: Int {
        Int(cargoRight) ?? 0
    }

    var cargoWeight: Int {
        Int(cargoStringWeight) ?? 0
    }
    var cargoPapaWeight: Int {
        Int(cargoPapaStringWeight) ?? 0
    }

    var totalBagWeight: Int {
        bagWeightLeft + bagWeightRight
    }

    var totalCargoWeight: Int {
        cargoWeightLeft + cargoWeightRight + cargoWeight + cargoPapaWeight
    }

    var totalWeight: Int {
        totalBagWeight + totalCargoWeight
    }


    // MARK:-Logic Functions
    func applyContainerLogic(_ container: Container) {
        switch container {
        case .leftAndRight:
            cargoStringWeight = ""
            cargoPapaStringWeight = ""
            hideKeyboard = true

        case .numberOnly:
            cargoPapaStringWeight = ""
            bagCountLeft = ""
            cargoLeft = ""
            bagCountRight = ""
            cargoRight = ""
            left = .nilFit
            right = .nilFit
            hideKeyboard = true

        case .numberPapa:
            cargoStringWeight = ""
            bagCountLeft = ""
            cargoLeft = ""
            bagCountRight = ""
            cargoRight = ""
            left = .nilFit
            right = .nilFit
            hideKeyboard = true
        }
    }

    func applyPositionLeftLogic(_ ake: Ake) {
        switch ake {
        case .nilFit:
            cargoLeft = ""
            bagCountLeft = ""
            hideKeyboard = true
        case .ake:
            cargoLeft = ""
            hideKeyboard = true
        case .cargo:
            bagCountLeft = ""
            hideKeyboard = true
        }
    }

    func applyPositionRightLogic(_ ake: Ake) {
        switch ake {
        case .nilFit:
            cargoRight = ""
            bagCountRight = ""
        case .ake:
            cargoRight = ""
            hideKeyboard = true
        case .cargo:
            bagCountRight = ""
            hideKeyboard = true
        }
    }
}
