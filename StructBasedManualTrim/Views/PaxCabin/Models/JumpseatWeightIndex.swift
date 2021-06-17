//
//  JumpseatAdjustment.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 16/6/21.
//

import Foundation

struct JumpSeatWeightIndex {

    func forJumpSeat(using weight: Int) -> (Int, Double) {
        switch weight {
        case 0:
            return (0,0)
        case 1:
            return (82, -0.4)
        case 2:
            return (164, -0.7)
        default:
            return (0,0)
        }
    }
}
