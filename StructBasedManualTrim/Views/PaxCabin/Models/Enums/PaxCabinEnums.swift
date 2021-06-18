//
//  CabinEnums.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 15/6/21.
//

import Foundation
import SwiftUI

// MARK:- Enum Aircraft J setting
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
// MARK: Pax LoadedStatus Enums
enum PaxLoadedStatus: String, Identifiable, CaseIterable {
    var id: PaxLoadedStatus { self }
    case noPaxOnboard = " No Pax Onboard"
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
            return """
                   Entry for Number of Cabin Crew required.
                   Pax cannot be onboard without Cabin Crew
                   """

        }
    }
}
    // MARK: - Extra Seat Adjustments

    enum Instrument: String, Identifiable, CaseIterable {

        var id: Instrument { self }
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"

        var weight: Int {
          let number = Int(self.rawValue) ?? 0
          return number * 15
        }
}

enum ServiceDog: String, Identifiable, CaseIterable {

    var id: ServiceDog { self }
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"

    var number: Int {
        Int(self.rawValue) ?? 0
    }

    var weight: Int {
        self.number * 30
    }

    var indexForZone1: Double {
        let indexUnit = -0.1
        return Double(self.number) * indexUnit
    }
    var indexForZone2: Double {
        let indexUnit = -0.1
        return Double(self.number) * indexUnit
    }
    var indexForZone3: Double {
        let indexUnit = -0.0
        return Double(self.number) * indexUnit
    }
    var indexForZone4: Double {
        let indexUnit =  0.1
        return Double(self.number) * indexUnit
    }
}

enum OverSizePax: String, Identifiable, CaseIterable {

    var id: OverSizePax { self }
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"

    var number: Int {
        Int(self.rawValue) ?? 0
    }

    var weight: Int {
        self.number * 50
    }

    var indexForZone1: Double {
        let indexUnit = -0.2
        return Double(self.number) * indexUnit
    }
    var indexForZone2: Double {
        let indexUnit = -0.1
        return Double(self.number) * indexUnit
    }
    var indexForZone3: Double {
        let indexUnit = -0.0
        return Double(self.number) * indexUnit
    }
    var indexForZone4: Double {
        let indexUnit =  0.1
        return Double(self.number) * indexUnit
    }

}
