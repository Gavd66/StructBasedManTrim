//
//  CargoEnums.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 28/6/21.
//

import Foundation
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

//MARK:- Enum  Underfloor Selection

enum UnderfloorSelection: Identifiable {
    var id: UnderfloorSelection { self }
    case cargoNumber
    case cargoPapa
    case bagsLeft
    case bagsRight
    case cargoLeft
    case cargoRight
    case itemsBulk
    case cargoBulk
}

//MARK:- Enum WeightLimit

enum WeightLimit: String, Identifiable, CaseIterable {
    var id: WeightLimit { self }

    case compartment1 = "Compartment 1 Overweight"
    case compartment2 = "Compartment 2 Overweight"
    case compartment3 = "Compartment 3 Overweight"
    case compartment4 = "Compartment 4 Overweight"
    case compartment5 = "Bulk Hold Overweight"
    case forwardHold = "Forward Hold Overweight"
    case aftHold = "Aft Hold Overweight"

    var maxWeight: Int {
        switch self {
        case .compartment1:
            return 15306
        case .compartment2:
            return 12700
        case .compartment3:
            return 10771
        case .compartment4:
            return 9525
        case .compartment5:
            return 2735
        case .forwardHold:
            return 25514
        case .aftHold:
            return 19132
        }
    }
    var message: String {
        switch self {
        case .compartment1:
            fallthrough
        case .compartment2:
            fallthrough
        case .compartment3:
            fallthrough
        case .compartment4:
            fallthrough
        case .compartment5:
            return "The max weight for this compartment has been exceeded"
        case .forwardHold:
            return "The combined weights of compartments 1 & 2, exceeds the maximum for this hold"
        case .aftHold:
            return "The combined weights of compartments 3 & 4, exceeds the maximum for this hold"
        }
    }
}

