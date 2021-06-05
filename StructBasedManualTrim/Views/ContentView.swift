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

            Text("Total Weight: \(position.compartmentOneWeight)")
        }
        .environmentObject(position)// End Form
           

        }

    }



}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(position: .example)
    }
}
