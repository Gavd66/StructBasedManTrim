//
//  PotableWaterWeightIndex.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 21/6/21.
//

import Foundation

struct PotableWaterWeightIndex {

    func forWaterLevel(using waterLevel: PotableWater ) -> (weight: Int, indexUnit: Double) {
        switch waterLevel {
        case .from284Litres:
            return (0,0)
        case .under284Litres:
            return (-284, -1.1)

        }
    }
}
