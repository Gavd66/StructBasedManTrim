//
//  BulkHoldView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 7/6/21.
//

import SwiftUI

struct BulkHoldView: View {

    @ObservedObject var position: UnderFloor
    var body: some View {
        Form {
            Section(header: Text("Bulk Hold")) {
                BulkView()
            }
            Section(header: Text("Bulk Hold Totals")) {
                BulkHoldTotalView()
            }
        }
        .environmentObject(position)
        .navigationBarTitle(Text("Bulk Hold"))
        .navigationBarItems(trailing: Text("Next View"))

    }
}

struct BulkHoldView_Previews: PreviewProvider {
    static var previews: some View {
        BulkHoldView(position: .example)
    }
}
