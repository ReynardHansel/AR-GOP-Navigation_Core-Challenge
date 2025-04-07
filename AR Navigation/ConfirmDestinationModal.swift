//
//  ConfirmDestinationModal.swift
//  AR Navigation
//
//  Created by Reynard Hansel on 07/04/25.
//

import SwiftUI

struct ConfirmDestinationModal: View {
    var body: some View {
                VStack(spacing: 16) {
                    // Your custom modal content here (e.g., text, etc.)
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
    }
}

#Preview {
    ConfirmDestinationModal()
}

