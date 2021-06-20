//
//  GalleyWaterWeightIndex.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 17/6/21.
//

import Foundation

struct GalleyWeightIndex {

    func forGalley(using galley: GalleyConfiguration ) -> (weight: Int, indexUnit: Double) {
        switch galley {
        case .dom:
            return (0,0)
        case .empty:
            return (-871, -0.3)
        case .nilCarts:
            return (-1398, -0.4)

        }
    }
}
