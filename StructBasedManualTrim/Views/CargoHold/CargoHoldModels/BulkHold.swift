//
//  BulkHold.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 28/6/21.
//

import Foundation
// MARK:- Bulk Hold
class BulkHold {
    var itemStringCount = ""
    var cargoStringWeight = ""
    var hasItemsLoaded = false
    var hasCargoLoaded = false

    func resetBulkToEmpty() {
        itemStringCount = ""
        cargoStringWeight = ""
    }

    var bagCount: Int {
        Int(itemStringCount) ?? 0
    }

    var cargoWeight: Int {
        Int(cargoStringWeight) ?? 0
    }

    var itemWeight: Int {
        bagCount * 18
    }

    var totalWeight: Int {
        itemWeight + cargoWeight
    }

    func updateItemLabels(_ itemLabel: String) {
        hasItemsLoaded = (itemStringCount == "") ? false: true
    }

    func updateCargoLabels(_ cargoLabel: String) {
        hasCargoLoaded = (cargoStringWeight == "") ? false: true
    }
}
