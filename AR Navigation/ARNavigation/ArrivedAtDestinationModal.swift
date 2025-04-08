//
//  ArrivedAtDestinationModal.swift
//  AR Navigation
//
//  Created by Gede Binar on 08/04/25.
//

import SwiftUI

struct ArrivedAtDestinationModal: View {
    @Binding var showModal:Bool
    //@Binding var path : NavigationPath
    @Environment(\.dismiss) var dismiss
    @State var pathFindingManager : PathfindingManager
    
    var body: some View {
        
        VStack(spacing: 16) {
            // Your custom modal content here (e.g., text, etc.)
            Text("You arrived !")
                .bold()
                .font(.title2)
            Text("Do you want to return to Map ?")
                .font(.headline)
                .multilineTextAlignment(.center)
            HStack(spacing: 12) {
                Button {
                    showModal = false
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
                    showModal = false
                    pathFindingManager.ResetPathfinder()
                    dismiss()
                    //path.append("ARView")
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
//        .frame(height: 200)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
    }
}
//
//#Preview {
//    @Previewable @State var showModal = true
//    @Previewable @State var path = NavigationPath()
//    ArrivedAtDestinationModal(showModal: $showModal)
//}
