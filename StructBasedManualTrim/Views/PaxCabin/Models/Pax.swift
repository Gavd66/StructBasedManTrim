//
//  Pax.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 10/6/21.
//

import Foundation
import SwiftUI

//MARK: - Class Pax
class Pax: ObservableObject, Equatable {

    static func == (lhs: Pax, rhs: Pax) -> Bool {
        lhs.id == rhs.id
    }

    var id = UUID() // For error messages & abstracted code

    @Published var maleStringNumber = "" {
        didSet {
            lastSelection = .male
        }
    }
    @Published var femaleStringNumber = "" {
        didSet {
            lastSelection = .female
        }
    }
    @Published var childStringNumber = "" {
        didSet {
            lastSelection = .child
        }
    }
    @Published var infantStringNumber = "" {
        didSet {

            lastSelection = .infant
        }
    }

    @Published var lastSelection: LastSelection = .male
    @Published var serviceDog = ServiceDog.one
    @Published var hasServiceDogInZone = false {
        didSet {
            if hasServiceDogInZone == false {
                serviceDog = .one
            }
        }
    }
    @Published var oversizePax = OverSizePax.one
    @Published var hasOversizePaxInZone = false {
        didSet {
            if hasOversizePaxInZone {
                oversizePax = .one
            }
        }
    }
    var paxLoadedStatus: PaxLoadedStatus = .noPaxOnboard
    var hideKeyboard = true

//MARK:- Pax Number Calulations
    var males: Int {
        Int(maleStringNumber) ?? 0
    }
    var females: Int {
        Int(femaleStringNumber) ?? 0
    }
    var children: Int {
        Int(childStringNumber) ?? 0
    }
    var infants: Int {
        Int(infantStringNumber) ?? 0
    }
    var totalPax: Int {
        males + females + children + infants
    }
    var seatedPax: Int {
        males + females + children
    }
    var totalInfants: Int {
        infants
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
    // Reset all values and dismiss keyboard on change
    func applyCabinLogic(_ paxCarried: PaxLoadedStatus) {
        switch paxCarried {
        case .noPaxOnboard:
            resetValues()
        case .paxCarried:
            resetValues()
        }
    }

    var hasPaxInZone: Bool {
        if buisnessWeight == 0 && ecconomyWeight == 0 {
            return false
        } else {
            return true
        }
    }

    func resetValues() {
        maleStringNumber = ""
        femaleStringNumber = ""
        childStringNumber = ""
        infantStringNumber = ""
        hideKeyboard = true
    }
}

