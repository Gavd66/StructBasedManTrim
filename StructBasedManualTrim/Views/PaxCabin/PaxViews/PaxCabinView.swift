//
//  PaxCabinView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 9/6/21.
//

import SwiftUI

struct PaxCabinView: View {
    @EnvironmentObject var cabin: Cabin
    var body: some View {
        NavigationView {
            Form {
                // Pax Cabin Group
                Group {
                    Section {
                        EmptyCabinView()
                    }
                    Section(header: Text("Cabin Zone 1")
                                .foregroundColor(.primary)) {
                        Zone1View()
                            .padding(.bottom)
                    }
                    Section(header: Text("Cabin Zone 2")
                                .foregroundColor(.primary)) {
                        Zone2View()
                    }

                    Section(header: Text("Cabin Zone 3")
                                .foregroundColor(.primary)) {
                        Zone3View()
                    }

                    Section(header: Text("Cabin Zone 4")
                                .foregroundColor(.primary)) {
                        Zone4View()
                    }
                }// End Pax Cabin Group

            }
            .navigationTitle("Persons on Board")
        }
    }
}

struct PaxCabinView_Previews: PreviewProvider {
    static var previews: some View {
        PaxCabinView()
    }
}
