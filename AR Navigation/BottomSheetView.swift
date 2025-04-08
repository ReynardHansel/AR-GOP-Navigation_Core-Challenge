//
//  BottomSheetView.swift
//  AR Navigation
//
//  Created by Gede Binar on 08/04/25.
//

import SwiftUI

struct BottomSheetView: View {
    @State private var showingCredits = false

    var body: some View {
        Button("Show Credits") {
            showingCredits.toggle()
        }
        .sheet(isPresented: $showingCredits) {
            Text("This app was brought to you by Hacking with Swift")
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    BottomSheetView()
}
