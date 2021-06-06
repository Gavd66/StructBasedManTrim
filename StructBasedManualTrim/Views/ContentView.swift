//
//  ContentView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 31/5/21.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var position: UnderFloor
  
    var body: some View {
        NavigationView {
        Form {
            Section {
                NavigationLink(destination: AftHoldView(position: position)) {
                    Text("Aft Hold")
                }
            }

            Section(header: Text("Position 11")) {
                Position11View()
            }
            Section(header: Text("Position 12")) {
                Position12View()
            }

            Section(header: Text("Position 13")) {
                Position13View()
            }
            Section(header: Text("Position 14")) {
                Position14View()
            }
            Section(header: Text("Position 21")) {
                Position21View()
            }
            Section(header: Text("Position 22")) {
                Position22View()
            }
            Section(header: Text("Position 23")) {
                Position23View()
            }
            Section(header: Text("Position 24")) {
                Position24View()
            }
            Section(header: Text("Forward Hold Totals")) {
                ForwardHoldTotalsView()
            }
        }
        .environmentObject(position)// End Form
        .navigationBarTitle("Forward Hold")
        .navigationBarItems(trailing: Text("AftHold"))
        
        }

    }



}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(position: .example)
    }
}
