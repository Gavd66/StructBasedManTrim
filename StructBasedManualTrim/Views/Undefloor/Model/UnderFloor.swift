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

enum WeightAlert: Identifiable {
    var id: WeightAlert { self }

    case compartment1Overweight
    case compartment2Overweight
    case compartment3Overweight
    case compartment4Overweight
    case compartment5Overweight
    case forwardHoldOverweight
    case aftHoldOverweight
}





class MainHold {

    @Published var container: Container = .leftAndRight
    @Published var cargoStringWeight = ""
    @Published var cargoPapaStringWeight = ""
    @Published var bagCountLeft = ""
    @Published var bagCountRight = ""
    @Published var cargoLeft = ""
    @Published var cargoRight = ""
    @Published var left: Ake = .nilFit
    @Published var right: Ake = .nilFit
    @Published var hasBagsInLeft = false
    @Published var hasBagsInRight = false
    @Published var hasCargoInLeft = false
    @Published var hasCargoInRight = false
    @Published var hasCargoInPosition = false
    @Published var hasCargoInPapa = false

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
        let weight = totalBagWeight + totalCargoWeight
        print(weight)
        return weight
    }

    func applyContainerLogic(_ container: Container) {
        switch container {
        case .leftAndRight:
            cargoStringWeight = ""
            cargoPapaStringWeight = ""
            hasCargoInPosition = false
            hasCargoInPapa = false

        case .numberOnly:
            cargoPapaStringWeight = ""
            hasCargoInPapa = false
            bagCountLeft = ""
            cargoLeft = ""
            bagCountRight = ""
            cargoRight = ""
            left = .nilFit
            right = .nilFit
            hasBagsInLeft = false
            hasBagsInRight = false
            hasCargoInLeft = false
            hasCargoInRight = false

        case .numberPapa:
            cargoStringWeight = ""
            hasCargoInPosition = false
            bagCountLeft = ""
            cargoLeft = ""
            bagCountRight = ""
            cargoRight = ""
            left = .nilFit
            right = .nilFit
            hasBagsInLeft = false
            hasBagsInRight = false
            hasCargoInLeft = false
            hasCargoInRight = false
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

// Set the bool condition to enable change in display between nil value text( black) and value text(blue)

    func updateLeftLabels(_ bagCount: String) {
        hasBagsInLeft = (bagCount == "") ? false: true
    }

    func updateRightLabels(_ bagCount: String) {
        hasBagsInRight = (bagCount == "") ? false: true
    }

    func updateCargoRightLabels(_ cargoRight: String) {
        hasCargoInLeft = (cargoLeft == "") ? false: true
    }

    func updateCargoLeftLabels(_ cargoLeft: String) {
        hasCargoInRight = (cargoRight == "") ? false: true
    }

    func updateCargoLabel(_ cargoWeight: String) {
        hasCargoInPosition = (cargoStringWeight == "") ? false: true
    }

    func updateCargoPapaLabel(_ cargoPapaWeight: String) {
        hasCargoInPapa = (cargoPapaStringWeight == "") ? false: true
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
// TODO: set bool for showing alert if weight exceedance, enable haptics at the same time for overweight



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
    @Published var overweight = false
    @Published var weightAlert = WeightAlert.compartment1Overweight


    var compartment1TotalBagWeight: Int {
        position11.totalBagWeight
            + position12.totalBagWeight
            + position13.totalBagWeight
            + position14.totalBagWeight
    }

    var compartment1TotalCargoWeight: Int {
        position11.totalCargoWeight
            + position12.totalCargoWeight
            + position13.totalCargoWeight
            + position14.totalCargoWeight

    }
    var compartment1TotalWeight: Int {
       let weight = position11.totalWeight
            + position12.totalWeight
            + position13.totalWeight
            + position14.totalWeight
        if weight > 15306 {
            overweight = true
            weightAlert = .compartment1Overweight
            return 0
        }
        return weight
    }

    var compartment2TotalBagWeight: Int {
        position21.totalBagWeight
            + position22.totalBagWeight
            + position23.totalBagWeight
            + position24.totalBagWeight
    }

    var compartment2TotalCargoWeight: Int {
        position21.totalCargoWeight
            + position22.totalCargoWeight
            + position23.totalCargoWeight
            + position24.totalCargoWeight

    }

    var compartment2TotalWeight: Int {
       let weight = position21.totalWeight
            + position22.totalWeight
            + position23.totalWeight
            + position24.totalWeight
        if weight > 12700 {
            overweight = true
            weightAlert = .compartment2Overweight
            return 0
        }
        return weight
    }

    var forwardHoldTotalWeight: Int {
       let weight = compartment1TotalWeight + compartment2TotalWeight
        if weight > 25514 {
            overweight = true
            weightAlert = .forwardHoldOverweight
            return 0
        }
        return weight
    }

    var compartment3TotalBagWeight: Int {
        position31.totalBagWeight
            + position32.totalBagWeight
            + position33.totalBagWeight
    }

    var compartment3TotalCargoWeight: Int {
        position31.totalCargoWeight
            + position32.totalCargoWeight
            + position33.totalCargoWeight
    }

    var compartment3TotalWeight: Int {
       let weight = position31.totalWeight
            + position32.totalWeight
            + position33.totalWeight
        if weight > 10771 {
            overweight = true
            weightAlert = .compartment3Overweight
            return 0
        }
        return weight
    }

    var compartment4TotalBagWeight: Int {
        position41.totalBagWeight
            + position42.totalBagWeight
            + position43.totalBagWeight
    }

    var compartment4TotalCargoWeight: Int {
        position41.totalCargoWeight
            + position42.totalCargoWeight
            + position43.totalCargoWeight
    }

    var compartment4TotalWeight: Int {
       let weight = position41.totalWeight
            + position42.totalWeight
            + position43.totalWeight
        if weight > 9525 {
            overweight = true
            weightAlert = .compartment4Overweight
            return 0
        }
        return weight
    }

    var aftHoldTotal: Int {
        let weight = compartment3TotalWeight + compartment4TotalWeight
        if weight > 19132  {
            overweight = true
            weightAlert = .aftHoldOverweight
            return 0
        }
        return weight
    }

    var compartmentFiveTotal: Int {
        let weight = bulkHold.totalWeight
        if weight > 2735 {
            overweight = true
            weightAlert = .compartment5Overweight
        }
        return weight
    }

    static let example = UnderFloor()
}


