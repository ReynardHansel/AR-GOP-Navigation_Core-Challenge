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
//    var onCancel: () -> Void
    
    var body: some View {
        HStack{
            Spacer()
            VStack(spacing:24){
                Spacer()
            
                VStack {
                    Image(systemName: "location.circle")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.white)
                } .frame(width: 1600,height:160)
                   
                    
                Text("You arrived !")
                    .bold()
                    .font(.title)
                    .foregroundStyle(Color.white)
//                    .padding(.bottom,24)
                Button {
                    showModal = false
                    pathFindingManager.ResetPathfinder()
                    dismiss()
                } label: {
                    Text("Return To Map")
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.green)
//                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                }
                Spacer()
            }
            Spacer()
        }.background(Color.green)
      
//        VStack(spacing: 16) {
//            // Your custom modal content here (e.g., text, etc.)
//            Text("You arrived !")
//                .bold()
//                .font(.title)
//                .foregroundStyle(Color.black)
//                .multilineTextAlignment(.center)
//            
////            Text("Do you want to return to Map ?")
////                .font(.headline)
////                .multilineTextAlignment(.center)
////                .foregroundStyle(Color.black)
//            HStack(spacing: 12) {
////                Button {
////                    showModal = false
////                    // MARK: Close modal
//////                    onCancel()
////                } label: {
////                    Text("Cancel")
////                        .bold()
////                        .frame(maxWidth: .infinity)
////                        .padding()
////                        .background(Color.gray.opacity(0.1))
////                        .cornerRadius(12)
////                }
//                
//                Button {
//                    showModal = false
//                    pathFindingManager.ResetPathfinder()
//                    dismiss()
//                    //path.append("ARView")
//                    // MARK: Confirm destination
//                } label: {
//                    Text("Return To Map")
//                        .font(.subheadline)
//                        .bold()
//                        .foregroundStyle(.white)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(12)
//                }
//            }
//        }
//        .frame(height: 200)
//        .padding()
//        .background(Color.white)
//        .cornerRadius(20)
//        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
    }
}
//
#Preview {
    @Previewable @State var showModal = true
    @Previewable @State var path = NavigationPath()
    ArrivedAtDestinationModal(
        showModal: $showModal,
        pathFindingManager: PathfindingManager()
    )
}
