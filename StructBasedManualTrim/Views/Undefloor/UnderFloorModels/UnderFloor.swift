//
//  Container.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 31/5/21.
//

import Foundation
import SwiftUI
//MARK:- Enum Container
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
//MARK:- Enum Ake
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
//MARK:- Enum weight Alert
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
//MARK:- MainHold Model
class MainHold: ObservableObject {

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
    @Published var hideKeyboard = false
    @Published var resetIsPressed = false

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
        let weight = totalBagWeight + totalCargoWeight
        print(weight)
        return weight
    }


// MARK:-Logic Functions
    func applyContainerLogic(_ container: Container) {
        switch container {
        case .leftAndRight:
            cargoStringWeight = ""
            cargoPapaStringWeight = ""
            hasCargoInPosition = false
            hasCargoInPapa = false
            hideKeyboard = true

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
            hideKeyboard = true

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
            hideKeyboard = true
        }
    }

    func applyPositionLeftLogic(_ ake: Ake) {
        switch ake {
        case .nilFit:
            cargoLeft = ""
            bagCountLeft = ""
            hasBagsInLeft = false
            hasCargoInLeft = false
            hideKeyboard = true
        case .ake:
            cargoLeft = ""
            hasCargoInLeft = false
            hideKeyboard = true
        case .cargo:
            bagCountLeft = ""
            hasBagsInLeft = false
            hideKeyboard = true
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
            hideKeyboard = true
        case .cargo:
            bagCountRight = ""
            hasBagsInRight = false
            hideKeyboard = true
        }
    }

// MARK:- Label functions
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

// MARK:- Bulk Hold
class BulkHold {
    @Published var itemStringCount = ""
    @Published var cargoStringWeight = ""
    @Published var hasItemsLoaded = false
    @Published var hasCargoLoaded = false

    func resetBulkToEmpty() {
        itemStringCount = ""
        cargoStringWeight = ""
    }

    var bagCount: Int {
        Int(itemStringCount) ?? 0
    }

    var cargoWeight: Int {
        Int(cargoStringWeight) ?? 0
    }

    var itemWeight: Int {
        bagCount * 18
    }

    var totalWeight: Int {
        itemWeight + cargoWeight
    }

    func updateItemLabels(_ itemLabel: String) {
        hasItemsLoaded = (itemStringCount == "") ? false: true
    }

    func updateCargoLabels(_ cargoLabel: String) {
        hasCargoLoaded = (cargoStringWeight == "") ? false: true
    }
}

// Todo after hide keyboard

// TODO: set bool for showing alert if weight exceedance, enable haptics at the same time for overweight. Day 83 for object will change, haptics a bit after that and optional alerts. Try the enum.


// MARK:-UnderFloor Class
class UnderFloor: ObservableObject {

    //MARK:- Properties
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
    @Published var overweightCondition = false
    @Published var weightAlertType = WeightAlert.compartment1Overweight

//MARK:- Cargo Loaded Logic
    var hasCargo: Bool {
        if forwardHoldTotalWeight
            + aftHoldTotalWeight
            + compartment5TotalWeight == 0 {
            return false
        } else {
            return true
        }
    }
//MARK:- Weight Calculations

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
        position11.totalWeight
            + position12.totalWeight
            + position13.totalWeight
            + position14.totalWeight
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
        position21.totalWeight
            + position22.totalWeight
            + position23.totalWeight
            + position24.totalWeight
    }
    var forwardHoldTotalWeight: Int {
       compartment1TotalWeight + compartment2TotalWeight
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
        position31.totalWeight
            + position32.totalWeight
            + position33.totalWeight
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
        position41.totalWeight
            + position42.totalWeight
            + position43.totalWeight
    }
    var aftHoldTotalWeight: Int {
        compartment3TotalWeight + compartment4TotalWeight
    }
    var compartment5TotalWeight: Int {
        bulkHold.totalWeight
    }

// MARK: Index Unit Calculations
    var returnIndex = CargoIndexUnit()

    var compartment1IndexUnit: Double {
        returnIndex.forCompartment1(using: compartment1TotalWeight)
    }
    var compartment2IndexUnit: Double {
        returnIndex.forCompartment2(using: compartment2TotalWeight)
    }
    var compartment3IndexUnit: Double {
        returnIndex.forCompartment3(using: compartment3TotalWeight)
    }
    var compartment4IndexUnit: Double {
        returnIndex.forCompartment4(using: compartment4TotalWeight)
    }
    var compartment5IndexUnit: Double {
        returnIndex.forCompartment5(using: compartment5TotalWeight)
    }

//MARK:- Weight Protection Methods

    func checkCompartment1Weight(int: Int) {
        if compartment1TotalWeight > 15306 {
            overweightCondition = true
            weightAlertType = .compartment1Overweight
        }
    }
    func checkCompartment2Weight(int: Int) {
        if compartment2TotalWeight > 12700 {
            overweightCondition = true
            weightAlertType = .compartment2Overweight
        }
    }
    func checkCompartment3Weight(int: Int) {
        if compartment3TotalWeight > 10771 {
            overweightCondition = true
            weightAlertType = .compartment3Overweight
        }
    }
    func checkCompartment4Weight(int: Int) {
        if compartment4TotalWeight > 2600 {
            overweightCondition = true
            weightAlertType = .compartment4Overweight
        }
    }
    func checkCompartment5Weight(int: Int) {
        if compartment5TotalWeight > 2735 {
            overweightCondition = true
            weightAlertType = .compartment5Overweight
        }
    }
    func checkForwardHoldWeight(int: Int) {
        if forwardHoldTotalWeight > 25514 {
            overweightCondition = true
            weightAlertType = .forwardHoldOverweight
        }
    }
    func checkAftHoldWeight(int: Int) {
        if aftHoldTotalWeight > 19132 {
            overweightCondition = true
            weightAlertType = .aftHoldOverweight
        }
    }

//MARK:- Reset Methods
    func resetCargoToEmpty() {
        withAnimation {
            position11 = MainHold()
            position12 = MainHold()
            position13 = MainHold()
            position14 = MainHold()
            position21 = MainHold()
            position22 = MainHold()
            position23 = MainHold()
            position24 = MainHold()
            position31 = MainHold()
            position32 = MainHold()
            position33 = MainHold()
            position41 = MainHold()
            position42 = MainHold()
            position43 = MainHold()
            bulkHold = BulkHold()
        }
    }

 

    static let example = UnderFloor()
}


