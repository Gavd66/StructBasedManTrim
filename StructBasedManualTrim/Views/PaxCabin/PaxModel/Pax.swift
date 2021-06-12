//
//  Pax.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 10/6/21.
//

import Foundation

// MARK: Cabin Crew Enum

enum CabinCrew: String, Identifiable {
    var id: CabinCrew { self }
    case zero = "0"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case eleven = "11"
    case twelve = "12"
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
    case paxCarried = " Pax"
}

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

//MARK: - Class Pax
class Pax {

    var maleStringNumber = ""
    var femaleStringNumber = ""
    var childrenStringNumber = ""
    var infantStringNumber = ""
    var paxInCabin: CabinOccupency = .empty
    var hasMalesInZone = false
    var hasFemalesInZone = false
    var hasChildrenInZone = false
    var hasInfantsInZone = false
    var hasPeopleInZone = false
    var hideKeyboard = true
//MARK:- Pax Number Calulations
    var males: Int {
        Int(maleStringNumber) ?? 0
    }
    var females: Int {
        Int(femaleStringNumber) ?? 0
    }
    var children: Int {
        Int(childrenStringNumber) ?? 0
    }
    var infants: Int {
        Int(infantStringNumber) ?? 0
    }
    var totalPax: Int {
        males + females + children + infants
    }
// MARK: - Weight Calculations
    var jMaleWeight: Int {
        males * PaxWeight.jMale.weight
    }
    var jFemaleWeight: Int {
        females * PaxWeight.jFemale.weight
    }
    var yMaleWeight: Int {
        males * PaxWeight.yMale.weight
    }
    var yFemaleWeight: Int {
        females * PaxWeight.yFemale.weight
    }
    var jChildWeight: Int {
        children * PaxWeight.jChild.weight
    }
    var yChildWeight: Int {
        children * PaxWeight.yChild.weight
    }
    var infantWeight: Int {
        infants * PaxWeight.infant.weight
    }
    var buisnessWeight: Int {
        jMaleWeight + jFemaleWeight + jChildWeight + infantWeight
    }
    var ecconomyWeight: Int {
        yMaleWeight + yFemaleWeight + yChildWeight + infantWeight
    }


// MARK: - PAX Cabin Logic Methods
    func applyCabinLogic(_ paxCarried: CabinOccupency) {
        switch paxCarried {
        case .empty:
            maleStringNumber = ""
            femaleStringNumber = ""
            childrenStringNumber = ""
            infantStringNumber = ""
            hasMalesInZone = false
            hasFemalesInZone = false
            hasChildrenInZone = false
            hasInfantsInZone = false
            hasPeopleInZone = false
            hideKeyboard = true

        case .paxCarried:
            // build logic here
            hideKeyboard = true
        }
    }

    func updateMaleLables(_ maleString: String) {
        hasMalesInZone = (maleStringNumber != "") ? true: false
    }
    func updateFemaleLables(_ femaleString: String) {
        hasFemalesInZone = (femaleStringNumber != "") ?  true: false
    }
    func updateChildLables(_ childString: String) {
        hasChildrenInZone = (childrenStringNumber != "") ?  true: false
    }
    func updateInfantLables(_ infantString: String) {
        hasInfantsInZone = (infantStringNumber != "") ?  true: false
    }

    var isNotEmpty: Bool {
        let result = (hasMalesInZone || hasFemalesInZone || hasChildrenInZone || hasInfantsInZone) ? true: false
        return result
    }

}
//MARK:- Class Cabin
class Cabin: ObservableObject {
    @Published var zone1 = Pax()
    @Published var zone2 = Pax()
    @Published var zone3 = Pax()
    @Published var zone4 = Pax()
    @Published var cabinCrew = CabinCrew.eight

    //MARK: Cabin Empty Logic means no pax
    var hasPax: Bool {
        let result = (zone1.isNotEmpty || zone2.isNotEmpty || zone3.isNotEmpty || zone4.isNotEmpty) ? true: false
        return result
    }

    //MARK: - Pax Weight Calculations

    var zone1TotalWeight: Int {
        zone1.buisnessWeight
    }
    var zone2TotalWeight: Int {
        zone2.ecconomyWeight
    }
    var zone3TotalWeight: Int {
        zone3.ecconomyWeight
    }
    var zone4TotalWeight: Int {
        zone4.ecconomyWeight
    }
    var totalPaxWeight: Int {
        zone1TotalWeight
            + zone2TotalWeight
            + zone3TotalWeight
            + zone4TotalWeight
    }
    // MARK:- Pax Number Calulation
    var totalPaxNumbers: Int {
        zone1.totalPax + zone2.totalPax + zone3.totalPax + zone4.totalPax
    }
}

