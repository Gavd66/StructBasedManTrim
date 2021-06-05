//
//  Container.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 31/5/21.
//

import Foundation
import SwiftUI

enum Container: String, Identifiable, CaseIterable, Codable {
    var id: Container { self }

    case leftAndRight = "L+R"
    case numberOnly = ""
    case numberPapa = "P"

    var setAKEWeight: Ake {
        switch self {
        case .leftAndRight:
            return .ake
        case .numberOnly:
            return .nilFit
        case .numberPapa:
            return .nilFit
        }
    }
}

enum Ake: String, Identifiable, CaseIterable, Codable {
    var id: Ake { self }
    case nilFit = "NIL FIT"
    case ake = "AKE"
    case cargo = "CARGO"

    var setAKEWeightLeft: Int {
        switch self {
        case .ake:
            return 71
        case .nilFit:
            return 0
        case .cargo:
            return 0
        }
    }

    var setAKEWeightRight: Int {
        switch self {
        case .ake:
            return 71
        case .nilFit:
            return 0
        case .cargo:
            return 0
        }
    }
}





class MainHold {

    @Published var container: Container = .leftAndRight
    @Published var cargoStringWeight = ""
    @Published var bagCountLeft = ""
    @Published var bagCountRight = ""
    @Published var cargoLeft = ""
    @Published var cargoRight = ""
    @Published var positionLeft: Ake = .nilFit
    @Published var positionRight: Ake = .nilFit
    @Published var setCargoWeight: Container = .numberPapa
    @Published var hasBagsInLeft = false
    @Published var hasBagsInRight = false
    @Published var hasCargoInLeft = false
    @Published var hasCargoInRight = false


    var bagWeightLeft: Int {
        let bagNumbers = Int(bagCountLeft) ?? 0
        return bagNumbers * 18 + positionLeft.setAKEWeightLeft
    }
    var bagWeightRight : Int {
        let bagNumbers = Int(bagCountRight) ?? 0
        return  bagNumbers * 18 + positionRight.setAKEWeightRight
    }
    var cargoWeightLeft: Int {
        Int(cargoLeft) ?? 0
    }

    var cargoWeightRight: Int {
        Int(cargoRight) ?? 0
    }

    var cargoWeight: Int {
        switch setCargoWeight {
        case .leftAndRight:
            return 0
        case .numberOnly:
            return Int(cargoStringWeight) ?? 0
        case .numberPapa:
            return Int(cargoStringWeight) ?? 0
        }
    }

    var totalWeight: Int {
        let weight = bagWeightLeft + bagWeightRight + cargoWeightLeft + cargoWeightRight + cargoWeight
        print(weight)
        return weight
    }

    func applyContainerLogic(_ container: Container) {
        if container == .numberPapa || container == .numberOnly {
            bagCountLeft = ""
            cargoLeft = ""
            bagCountRight = ""
            cargoRight = ""
            positionLeft = .nilFit
            positionRight = .nilFit
            hasBagsInLeft = false
            hasBagsInRight = false
            hasCargoInLeft = false
            hasCargoInRight = false
        } else if container == .leftAndRight {
            cargoStringWeight = ""
        }
    }

    func applyPositionLeftLogic(_ ake: Ake) {
        switch ake {
        case .nilFit:
            cargoLeft = ""
            bagCountLeft = ""
            hasBagsInLeft = false
            hasCargoInLeft = false
        case .ake:
            cargoLeft = ""
            hasCargoInLeft = false
        case .cargo:
            bagCountLeft = ""
            hasBagsInLeft = false
        }
    }

    func applyPositionRightLogic(_ ake: Ake) {
        switch ake {
        case .nilFit:
            cargoRight = ""
            bagCountRight = ""
            hasBagsInRight = false
            hasCargoInRight = false
        case .ake:
            cargoRight = ""
            hasCargoInRight = false
        case .cargo:
            bagCountRight = ""
            hasBagsInRight = false
        }
    }

// Set the bool condition to enable the change in display between AKE tare weight and total weight
// for position left right
    // also used to enable the button to dismiss the keyboard
    func animateChangeLeft(_ bagCount: String) {
        if bagCount == "" {
            hasBagsInLeft = false
        } else {
            hasBagsInLeft = true
        }
    }

    func animateChangeRight(_ bagCount: String) {
        if bagCount == "" {
            hasBagsInRight = false
        } else {
            hasBagsInRight = true
        }
    }

    func animateCargoChangeLeft(_ cargoRight: String) {
        hasCargoInLeft = (cargoLeft == "") ? false: true
    }

    func animateCargoChangeRight(_ cargoLeft: String) {
        hasCargoInRight = (cargoRight == "") ? false: true
    }

   

}

class BulkHold {
    @Published var bagStringCount = ""
    @Published var cargoStringWeight = ""

    var bagCount: Int {
        Int(bagStringCount) ?? 0
    }

    var cargoWeight: Int {
        Int(cargoStringWeight) ?? 0
    }

    var totalWeight: Int {
        let bagWeight = bagCount * 18
        return bagWeight + cargoWeight
    }
}

class UnderFloor: ObservableObject {

    @Published var position11 = MainHold()
    @Published var position12 = MainHold()
    @Published var position13 = MainHold()
    @Published var position14 = MainHold()
    @Published var position21 = MainHold()
    @Published var position22 = MainHold()
    @Published var position23 = MainHold()
    @Published var position24 = MainHold()
    @Published var position31 = MainHold()
    @Published var position32 = MainHold()
    @Published var position33 = MainHold()
    @Published var position41 = MainHold()
    @Published var position42 = MainHold()
    @Published var position43 = MainHold()
    @Published var bulkHold = BulkHold()

    var compartmentOneWeight: Int {
        position11.totalWeight + position12.totalWeight + position13.totalWeight + position14.totalWeight
    }

    var compartmentTwoWeight: Int {
        position21.totalWeight + position22.totalWeight + position23.totalWeight + position24.totalWeight
    }

    var compartmentThreeWeight: Int {
        position31.totalWeight + position32.totalWeight + position33.totalWeight
    }

    var compartmentFourWeight: Int {
        position41.totalWeight + position42.totalWeight + position43.totalWeight
    }

    var bulkHoldWeight: Int {
        bulkHold.totalWeight
    }

    static let example = UnderFloor()
}


