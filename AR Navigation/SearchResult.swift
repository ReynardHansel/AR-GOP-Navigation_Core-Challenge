//
//  SearchResult.swift
//  AR Navigation
//
//  Created by Reynard Hansel on 27/03/25.
//

import SwiftUI

struct SearchResult: View {
    let destinations: [Destination]
    @Binding var selectedDestination: Destination?

    //      TESTING PURPOSES
    //    @State var previewSelectedDestination: Destination?

    var body: some View {
        ScrollView {
            VStack {
                ForEach(destinations) { destination in
                    Button {
                        selectedDestination = destination
                        //                    previewSelectedDestination = destination
                        //                    print("Selected destination:
                        
                    } label: {
                        Text(destination.name)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white)
                            .cornerRadius(15)
                            .padding(.horizontal, 20)
                    }
                }
            }
            .background(Color.white)
            .cornerRadius(15)
            .padding(.horizontal, 20)
            
        }
        .fixedSize(horizontal: false, vertical: true)

        // TESTING PURPOSES
        // Text("Selected: \(previewSelectedDestination?.name ?? "Not Selected")")
    }
}

#Preview {
    SearchResult(
        destinations: destinationDB, selectedDestination: .constant(nil))
}

//* NOTE:
//*
//******************** About .constant(nil) *******************
//* In SwiftUI’s #Preview, @Binding must be connected to a real state, but previews don’t maintain state by default.

//* So, instead of passing a real @State variable (which isn't possible in simple previews), we provide a fixed, non-changing value using .constant(nil).
