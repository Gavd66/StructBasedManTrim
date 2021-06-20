//
//  Fuel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 18/6/21.
//

import Foundation

enum LeftTank: String, Identifiable, CaseIterable {
    var id: LeftTank { self }
    case some = "   Left Tank  "
    case none = "   Left Tank:  "

}

enum CentreTank: String, Identifiable, CaseIterable {
    var id: CentreTank { self }
    case some = "Centre Tank"
    case none = "Centre Tank:"

}

enum RightTank: String, Identifiable, CaseIterable {
    var id: RightTank { self }
    case some = " Right Tank  "
    case none = " Right Tank:  "
    
}

enum FuelLoaded: String, Identifiable, CaseIterable {
    var id: FuelLoaded { self }
    case some = "1000 KG"
    case none = "No Fuel"
}

enum FuelError: String, Identifiable, CaseIterable {
    var id: FuelError { self }
    case leftTankOverLimit = "Left Tank OverFilled"
    case centreTankOverLimit = "Centre Tank OverFilled"
    case rightTankOverLimit = "Right Tank OverFilled"
    case fuelBurn = "Fuel Burn too high"
    
    var message: String {
        switch self {
        case .leftTankOverLimit:
            return "The Left Tank maximum capacity is 17.0T"
        case .centreTankOverLimit:
            return "The Centre Tank maximum capacity is 67.5T"
        case .rightTankOverLimit:
            return "The Right Tank maximum capacity is 17.0T"
        case .fuelBurn:
            return "Fuel Burn is greater than fuel on board"
        }
    }
}

enum LastInput: Identifiable {
    var id: LastInput { self }
    case leftTank
    case centreTank
    case rightTank
    case fuelBurn
}
