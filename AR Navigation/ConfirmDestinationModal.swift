//
//  ConfirmDestinationModal.swift
//  AR Navigation
//
//  Created by Reynard Hansel on 07/04/25.
//

import SwiftUI

struct ConfirmDestinationModal: View {
    @Binding var showModal:Bool
    @Binding var path : NavigationPath
    var onCancel : () -> Void
    var onConfirm : () -> Void
    
    var body: some View {
        
                VStack(spacing: 16) {
                    // Your custom modal content here (e.g., text, etc.)
                    Text("Do you want to confirm this destination?")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.black)
                        

                    HStack(spacing: 12) {
                        Button {
                            showModal = false
                            // MARK: Close modal
                            onCancel()
                        } label: {
                            Text("Cancel")
                                .bold()
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(12)
                        }

                        Button {
                            showModal = false
                            path.append("ARView")
                            onConfirm()
                            // MARK: Confirm destination
                        } label: {
                            Text("Navigate")
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

//#Preview {
//    
//    ConfirmDestinationModal(showModal: <#Binding<Bool>#>)
//}

