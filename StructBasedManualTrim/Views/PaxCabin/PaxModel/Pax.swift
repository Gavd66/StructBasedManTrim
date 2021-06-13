//
//  Pax.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 10/6/21.
//

import Foundation
import SwiftUI

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

//MARK: Enum Jumpseat Configuration

enum Jumpseat: String, Identifiable {
    var id: Jumpseat { self }
    case none = "0"
    case one = "1"
    case two = "2"
}

// MARK:- Enum Aircraft Pax Configuration
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

enum Seats: String, Identifiable {
    var id: Seats { self }
    case inZone1 = "Zone 1"
    case inZone2 = "Zone 2"
    case inZone3 = "Zone 3"
    case inZone4 = "Zone 4"

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
        }
    }
}

//MARK: - Class Pax
class Pax: ObservableObject {

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
    var seatsOccupied: Int {
        males + females + children
    }
// MARK: - Weight Calculations
    var jMaleWeight: Int {
        objectWillChange.send()
       return males * PaxWeight.jMale.weight
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
    var hasPaxInZone: Bool {
        objectWillChange.send()
        if hasMalesInZone || hasFemalesInZone || hasChildrenInZone || hasInfantsInZone {
            return true
        } else {
            return false
        }
    }

    static var example = Pax()

}
//MARK:- Class Cabin
class Cabin: ObservableObject {
    @Published var zone1 = Pax()
    @Published var zone2 = Pax()
    @Published var zone3 = Pax()
    @Published var zone4 = Pax()
    @Published var cabinCrew = CabinCrew.nine
    @Published var jWeight: JWeightConfiguration = .buisness
    @Published var seatingError: Seats? = nil
    @Published var zone1Unlocked = true
    @Published var zone2Unlocked = true
    @Published var zone3Unlocked = true
    @Published var zone4Unlocked = true
    @Published var jumpseat: Jumpseat = .none

    var hasPax: Bool {
        if (zone1.hasPaxInZone || zone2.hasPaxInZone || zone3.hasPaxInZone || zone4.hasPaxInZone) {
            return true
        } else {
            return false
        }
    }
    //MARK: - Pax Zone Weight Calculations

    var totalPaxWeight: Int {
        zone1.buisnessWeight
            + zone1.ecconomyWeight
            + zone2.ecconomyWeight
            + zone3.ecconomyWeight
            + zone4.ecconomyWeight
    }


// To allow abstracted generic labels in J and Y models to display weights
    func zoneBuisnessWeight(for zone: Pax) -> Int {
        zone.buisnessWeight
    }

    func zoneEcconomylWeight(for zone: Pax) -> Int {
        zone.ecconomyWeight
    }
    // MARK:- POB Number Calulation
    var totalPaxNumbers: Int {
        zone1.totalPax + zone2.totalPax + zone3.totalPax + zone4.totalPax
    }

    func totalPax() -> Int {
        zone1.totalPax + zone2.totalPax + zone3.totalPax + zone4.totalPax
    }

    var cabinCrewNumber: Int {
        Int(cabinCrew.rawValue) ?? 0
    }

    var jumpseatNumber: Int {
        Int(jumpseat.rawValue) ?? 0
    }

    var totalCrewNumber: Int {
        cabinCrewNumber + jumpseatNumber + 2
    }
    var totalPOB: Int {
        totalPaxNumbers + totalCrewNumber
    }



// MARK: - Seating Logic
    func overSeatingCheck(_ seats: Int) {
        // If over seating in a zone occurs, no other inputs are available until the seating issue is rectified.
        seatingError = nil
        if zone1.seatsOccupied > Seats.inZone1.maxNumber {
            seatingError = .inZone1
        }
        if zone2.seatsOccupied > Seats.inZone2.maxNumber {
            seatingError = .inZone2
        }
        if zone3.seatsOccupied > Seats.inZone3.maxNumber {
            seatingError = .inZone3
        }
        if zone4.seatsOccupied > Seats.inZone4.maxNumber {
            seatingError = .inZone4
        }

        switch seatingError {
        case .none:
            zone1Unlocked = true
            zone2Unlocked = true
            zone3Unlocked = true
            zone4Unlocked = true
        case .inZone1:
            zone1Unlocked = true
            zone2Unlocked = false
            zone3Unlocked = false
            zone4Unlocked = false
        case .inZone2:
            zone1Unlocked = false
            zone2Unlocked = true
            zone3Unlocked = false
            zone4Unlocked = false
        case .inZone3:
            zone1Unlocked = false
            zone2Unlocked = false
            zone3Unlocked = true
            zone4Unlocked = false
        case .inZone4:
            zone1Unlocked = false
            zone2Unlocked = false
            zone3Unlocked = false
            zone4Unlocked = true
        }
    }
    // MARK: - Seating Error Messages

    var zoneTitle: String {
        switch seatingError {
        case .inZone1:
            return Seats.inZone1.rawValue
        case .inZone2:
            return Seats.inZone2.rawValue
        case .inZone3:
            return Seats.inZone3.rawValue
        case .inZone4:
            return Seats.inZone4.rawValue
        case .none:
            return ""
        }
    }

    var zoneMessage: String {
        switch seatingError {
        case .inZone1:
            return Seats.inZone1.message + " Remove \(zone1.seatsOccupied - Seats.inZone1.maxNumber) pax"
        case .inZone2:
            return Seats.inZone2.message + " Remove \(zone2.seatsOccupied - Seats.inZone2.maxNumber) pax"
        case .inZone3:
            return Seats.inZone3.message + " Remove \(zone3.seatsOccupied - Seats.inZone3.maxNumber) pax"
        case .inZone4:
            return Seats.inZone4.message + " Remove \(zone4.seatsOccupied - Seats.inZone4.maxNumber) pax"
        case .none:
            return ""
        }
    }
static var example = Pax()

    //MARK:- Cabin Reset
    func resetCabin() {
        withAnimation {
        zone1 = Pax.init()
        zone2 = Pax.init()
        zone3 = Pax.init()
        zone4 = Pax.init()
        }
    }

}

