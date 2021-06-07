//
//  ContentView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 31/5/21.
//
// TODO: Check on reasonable values for crash log.
// Transfer new logic from 11 to all views to hide the keyboard, also check that this logic is not causing the crash.
// copy the total weight stuff for the aft hold
import SwiftUI

struct ForwardHoldView: View {
   @ObservedObject var position: UnderFloor
  
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Weight Index Unit Test")) {
                    VStack(alignment: .leading, spacing: 10){
                        Text("C1 kg \(position.compartment1TotalWeight)KG")
                        Text("C1 IU\(position.compartment1IndexUnit)")

                        Text("C2 kg \(position.compartment2TotalWeight)KG")
                        Text("C2 IU\(position.compartment2IndexUnit)")

                        Text("C3 kg \(position.compartment3TotalWeight)KG")
                        Text("C3 IU\(position.compartment3IndexUnit)")

                        Text("C4 kg \(position.compartment4TotalWeight)KG")
                        Text("C4 IU\(position.compartment4IndexUnit)")

                        Text("C5 kg \(position.compartment5TotalWeight)KG")
                        Text("C5 IU\(position.compartment5IndexUnit)")
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
            .environmentObject(position)
            .navigationBarTitle("Fwd Hold")
            .navigationBarItems(trailing: NavigationLink (destination: AftHoldView(position: position)) {
                HStack(spacing: 1) {
                Text("Aft Hold")
                    .font(.system(size: 22))
                    Image(systemName: "chevron.forward")
                        .font(.system(size: 30))
                }})
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForwardHoldView(position: .example)
    }
}
