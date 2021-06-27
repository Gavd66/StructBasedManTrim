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

//MARK:- Enum Underfloor

enum Underfloor: Identifiable {
    var id: Underfloor { self }

    case compartment1
    case compartment2
    case compartment3
    case compartment4
    case compartment5
    case forwardHold
    case aftHold

    var limitWeight: Int {
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
// if didn't need computed property for overweight amount then could also make entire alert here and call on one line as per https://www.hackingwithswift.com/books/ios-swiftui/binding-an-alert-to-an-optional-string
}

