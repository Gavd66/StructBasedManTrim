//
//  CabinEnums.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 15/6/21.
//

import Foundation
import SwiftUI

// MARK:- Enum Aircraft Jweight setting
enum JWeightConfiguration: String, Identifiable, CaseIterable {
    var id: JWeightConfiguration { self }
    case buisness = "Buisness"
    case ecconomy = "Ecconomy"
}
//MARK: - Enum Pax Weights
enum PaxWeight: Identifiable {
    var id: PaxWeight { self }
    case jMale
    case jFemale
    case yMale
    case yFemale
    case jChild
    case yChild
    case infant

    var weight: Int {
        switch self {
        case .jMale:
            return 101
        case .jFemale:
            return 86
        case .yMale:
            return 93
        case .yFemale:
            return 78
        case .jChild:
            return 48
        case .yChild:
            return 49
        case .infant:
            return 16
        }
    }


}
// MARK: Cabin Occupency Enums
enum CabinOccupency: String, Identifiable, CaseIterable {
    var id: CabinOccupency { self }
    case empty = " Empty"
    case paxCarried = " Load Pax"
}
//MARK:- Pax Label Enums
enum HasMales: String, Identifiable {
    var id: HasMales { self }
    case some = "  Males  "
    case none = "  No Males  "
}

enum HasFemales: String, Identifiable {
    var id: HasFemales { self }
    case some = "Females"
    case none = "No Females"
}

enum HasChildren: String, Identifiable {
    var id: HasChildren { self }
    case some = "Children"
    case none = "No Children"
}

enum HasInfants: String, Identifiable {
    var id: HasInfants { self }
    case some = " Infants "
    case none = " No Infants "
}

// MARK:- Seating Logic Enum
enum SeatingLogic: String, Identifiable {
    var id: SeatingLogic { self }
    case forZone1 = "Zone 1"
    case forZone2 = "Zone 2"
    case forZone3 = "Zone 3"
    case forZone4 = "Zone 4"
    case forInfants = "Infants"
    case noCabinCrew = " No Cabin Crew"

    var maxNumber: Int {
        switch self {
        case .forZone1:
            return 21
        case .forZone2:
            return 27
        case .forZone3:
            return 177
        case .forZone4:
            return 110
        case .forInfants:
            return 22
        case .noCabinCrew:
            return 12
        }
    }

    var message: String {
        switch self{
        case .forZone1:
            fallthrough
        case .forZone2:
            fallthrough
        case .forZone3:
             fallthrough
        case .forZone4:
            return "You have exceeded the maximum number of \(self.rawValue) seats. "
        case .forInfants:
            return "There are too many infants onboard. "
        case .noCabinCrew:
            return "Entry for number of Cabin Crew required."

        }
    }
}
