//
//  AftHoldView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 6/6/21.
//

import SwiftUI

struct AftHoldView: View {
    @ObservedObject var position: UnderFloor

    var body: some View {
//        NavigationView {
                Form {

                    Section(header: Text("Position 31")) {
                        Position31View()
                    }
                    Section(header: Text("Position 32")) {
                        Position32View()
                    }
                    Section(header: Text("Position 33")) {
                        Position33View()
                    }
                    Section(header: Text("Position 41")) {
                        Position41View()
                    }
                    Section(header: Text("Position 42")) {
                        Position42View()
                    }
                    Section(header: Text("Position 43")) {
                        Position43View()
                    }
                    Section(header: Text("Aft Hold Totals")) {
                        AftHoldTotalsView()
                    }
                }// End Form
                .environmentObject(position)
                .navigationBarTitle(Text("Aft Hold"))
                .navigationBarItems(leading: Text("Forward Hold"))
                .navigationBarItems(trailing: Text("Next View"))

//        }
    }
}

struct AftHoldView_Previews: PreviewProvider {
    static var previews: some View {
        AftHoldView(position: .example)
    }
}
