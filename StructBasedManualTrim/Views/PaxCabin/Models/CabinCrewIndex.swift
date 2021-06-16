//
//  CabinCrewIndex.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 16/6/21.
//

import Foundation

struct CabinCrewIndex {

    func cabinCrew(using number: Int) -> (Int, Double) {
        switch number {
        case 0:
            return (-576, 0.4)
        case 8:
            return (-64, 0.2)
        case 9:
            return (0,0)
        case 10:
            return (64, 0.2)
        case 11:
            return (128, 0.5)
        case 12:
            return (192, 0.5)
        default:
            return (0,0)
        }
    }

    func shiftCabinCrewFrom(using position: CrewMoveFrom) -> (Int, Double) {
        switch position {
        case .A1:
            return (-64, 0.3)
        case .A2:
            return (-64, 0.2)
        case .A9:
            return (-64, 0.2)
        case .A3:
            return (-64, 0.1)
        case .A4:
            return (-64, 0.1)
        case .A5:
            return (-64, -0.1)
        case .A6:
            return (-64, -0.1)
        case .A7:
            return (-64, -0.2)
        case .A8:
            return (-64, -0.2)
        case .A10:
            return (-64, -0.2)
        case .A11:
            return (-64, -0.2)
        }
    }

    func shiftCabinCrewTo(for position: CrewMoveTo) -> (Int, Double) {
        switch position {
        case .A1:
            return (64, -0.3)
        case .A2:
            return (64, -0.2)
        case .A9:
            return (64, -0.2)
        case .A3:
            return (64, -0.1)
        case .A4:
            return (64, -0.1)
        case .A5:
            return (64, 0.1)
        case .A6:
            return (64, 0.1)
        case .A7:
            return (64, 0.2)
        case .A8:
            return (64, 0.2)
        case .A10:
            return (64, 0.2)
        case .A11:
            return (64, 0.2)
        case .zone1:
            return (64, -0.2)
        case .zone2:
            return (64, -0.2)
        case .zone3:
            return (64, 0.0)
        case .zone4:
            return (64, 0.1)
        }
    }
}
