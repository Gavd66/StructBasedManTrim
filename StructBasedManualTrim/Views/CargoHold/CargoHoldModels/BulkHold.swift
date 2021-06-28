//
//  BulkHold.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 28/6/21.
//

import Foundation
// MARK:- Bulk Hold
class BulkHold {
    var itemBulkStringCount = "" {
        didSet {
            lastSelection = .itemsBulk
        }
    }
    var cargoBulkStringWeight = "" {
        didSet {
            lastSelection = .cargoBulk
        }
    }
    var lastSelection = UnderfloorSelection.itemsBulk

    func resetBulkToEmpty() {
        itemBulkStringCount = ""
        cargoBulkStringWeight = ""
    }

    var bulkBagCount: Int {
        Int(itemBulkStringCount) ?? 0
    }

    var bulkCargoWeight: Int {
        Int(cargoBulkStringWeight) ?? 0
    }

    var bulkItemWeight: Int {
        bulkBagCount * 18
    }
    var bulkTotalWeight: Int {
        bulkItemWeight + bulkCargoWeight
    }
}
