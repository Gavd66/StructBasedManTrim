//
//  PaxCabinView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 9/6/21.
//

import SwiftUI


struct PaxCabinView: View {

    @EnvironmentObject var cabin: Cabin
    //Haptic for pax overload. Prewarm engine as each View Appears
    @State private var feedBack = UINotificationFeedbackGenerator()

    var body: some View {

        NavigationView {
            Form {
                Group {
                    Section {
                        EmptyCabinView()
                    }

                    Section(header: Text("Jump Seats Used")
                                .foregroundColor(.primary)) {
                        JumpseatView()
                    }

                    Section(header: Text("Cabin Crew") .foregroundColor(.primary)) {
                        CabinCrewView()
                    }
                } // End Crew Group

                Group { // Pax Cabin Group

                    Section(header: Text("Zone 1 Pax Weight")
                                .foregroundColor(.primary)) {
                        ConfigurationView()
                    }

                    Section(header: Text("Cabin Zone 1")
                                .foregroundColor(.primary)) {
                        Zone1View()
                    }
                    .onAppear(perform: feedBack.prepare)
                    .onChange(of: cabin.zone1.totalPax, perform: cabin.validPaxLoad)

                    Section {
                        JTotals(cabin: _cabin, zone: cabin.zone1, zoneLimit: SeatingLogic.forZone1)
                    }

                    Section(header: Text("Cabin Zone 2")
                                .foregroundColor(.primary)) {
                        Zone2View()
                            
                    }
                    .onAppear(perform: feedBack.prepare)
                    .onChange(of: cabin.zone2.totalPax, perform: cabin.validPaxLoad)

                    Section {
                        YTotals(cabin: _cabin, zone: cabin.zone2, zoneLimit: SeatingLogic.forZone2)
                    }

                    Section(header: Text("Cabin Zone 3")
                                .foregroundColor(.primary)) {
                        Zone3View()
                    }
                    .onAppear(perform: feedBack.prepare)
                    .onChange(of: cabin.zone3.totalPax, perform: cabin.validPaxLoad)

                    Section {
                        YTotals(cabin: _cabin, zone: cabin.zone3, zoneLimit: SeatingLogic.forZone3)
                    }

                    Section(header: Text("Cabin Zone 4")
                                .foregroundColor(.primary)) {
                        Zone4View()
                    }
                    .onAppear(perform: feedBack.prepare)
                    .onChange(of: cabin.zone4.totalPax, perform: cabin.validPaxLoad)

                    Section {
                        YTotals(cabin: _cabin, zone: cabin.zone4, zoneLimit: SeatingLogic.forZone4)
                    }
                }// End Pax Cabin Group

                Section(header: Text("Pob total")
                            .foregroundColor(.primary)) {
                    EmptyCabinView()
                }
            } // End Form
            .navigationTitle("Persons on Board")
            .navigationBarItems(trailing: Button(action: cabin.resetCabin) {
                Image(systemName: "trash")
                    .font(.system(size: 30))
                    .foregroundColor(.accentColor)
                    .padding()
            })
            .alert(item: $cabin.seatingError) { seatingError in
                self.feedBack.notificationOccurred(.error)
                return Alert(title: Text(cabin.zoneTitle), message: Text(cabin.zoneMessage), dismissButton: .destructive(Text("Remove last entry"), action: cabin.removeLastEntry))
            }
        } // End Navigation View
    }
}

struct PaxCabinView_Previews: PreviewProvider {
    static var previews: some View {
        PaxCabinView()
    }
}
