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

// MARK:- Zone Seating Capacity Enum
enum Seats: String, Identifiable {
    var id: Seats { self }
    case inZone1 = "Zone 1"
    case inZone2 = "Zone 2"
    case inZone3 = "Zone 3"
    case inZone4 = "Zone 4"
    case infants = "Infants"

    var maxNumber: Int {
        switch self {
        case .inZone1:
            return 21
        case .inZone2:
            return 27
        case .inZone3:
            return 177
        case .inZone4:
            return 110
        case .infants:
            return 22
        }
    }

    var message: String {
        switch self{
        case .inZone1:
            return """
                    Too many pax.
                    There are \(self.maxNumber) seats in this zone.
                    """
        case .inZone2:
            return """
                    Too many pax.
                    There are \(self.maxNumber) seats in this zone.
                    """
        case .inZone3:
            return """
                    Too many pax.
                    There are \(self.maxNumber) seats in this zone.
                    """
        case .inZone4:
            return """
                    Too many pax.
                    There are \(self.maxNumber) seats in this zone.
                    """
        case .infants:
            return """
                    There are too many infants on board.

                    """
        }
    }
}
