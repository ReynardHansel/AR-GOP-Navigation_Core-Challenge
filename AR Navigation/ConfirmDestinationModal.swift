//
//  ConfirmDestinationModal.swift
//  AR Navigation
//
//  Created by Reynard Hansel on 07/04/25.
//

import SwiftUI

struct ConfirmDestinationModal: View {
    var selectedDestination: Binding<Destination?>
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            // Main Modal Content
            VStack(spacing: 16) {
                Text("Do you want to confirm this destination?")
                    .font(.headline)
                    .multilineTextAlignment(.center)

                HStack(spacing: 12) {
                    Button {
                        // MARK: Close modal
                    } label: {
                        Text("Cancel")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(12)
                    }

                    Button {
                        // MARK: Confirm destination
                    } label: {
                        Text("Confirm")
                            .bold()
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)

            // Close ("x") Button
            Button {
                // MARK: Close modal
                selectedDestination.wrappedValue = nil
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
                    .foregroundColor(.gray)
//                    .padding(10)
            }
            .padding()
        }
    }
}

#Preview {
    ConfirmDestinationModal(selectedDestination: .constant(nil))
}

//* NOTE:
//******************** ```About selectedDestination.wrappedValue = nil``` *******************
//  Binding variable access its underlying value using the wrappedValue property. This is because Binding is a property wrapper that provides a reference to a value, allowing you to read and write to it.
//  On the other hand, selectedDestination = nil would attempt to reassign the Binding itself, which is not the intended use.
//  (Ini masi gangerti, cb pahamin lg ntar)
