//
//  ARNavigationView.swift
//  AR Navigation
//
//  Created by Gede Binar on 07/04/25.
//

import SwiftUI
import RealityKit
import CoreLocation

struct ARNavigationView: View {
    @StateObject var pathfindingManager : PathfindingManager
    @StateObject var locationDataManager : LocationDataManager
    
    @ViewBuilder func ShowStat() -> some View{
        VStack{
            Text("Destination : \(locationDataManager.currentPath[locationDataManager.userNodeIndex].nodeName)")
            Divider()
            Text("Target heading \(String(format:"%.2f",locationDataManager.targetDirectionInDegrees))")
            Text("User heading :\(String(format:"%.2f",locationDataManager.userHeadingInDegrees))")
            Divider()
            Text("Rotate Towards : \(String(format: "%.2f",locationDataManager.targetDirectionInDegrees - locationDataManager.userHeadingInDegrees))")
            Divider()
            Text("Distance to target : \(String(format: "%.2f",locationDataManager.distanceToTarget))")
        }.padding()
    }
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ARViewContainer(
            modelName: "Direction_Arrow",
            angle: $locationDataManager.userHasToHeadInRadians
        )
        
        .overlay(alignment: .bottom, content: {
            NavigationToolbarView(
                onCancel: {
                    pathfindingManager.ResetPathfinder()
                    dismiss()
                },
                destinationName: pathfindingManager.destinationName,
                distance: String(format:"%.0f",pathfindingManager.destinationName),
                time: String(format:"%.0f",pathfindingManager.estimateCumulativeDistance * 0.3)
            )
        })
        .overlay{
            VStack{
//                ShowStat()
//                ZStack{
//                    Button("Change Destination"){
//                        locationDataManager.cycleLocation()
//                    }
//                }
                
                
                
            }
            
        }
        .overlay{
            if locationDataManager.hasArrived{
                ArrivedAtDestinationModal(
                    showModal: $locationDataManager.hasArrived ,
                    pathFindingManager: pathfindingManager)
            }
        }
    }
}

struct NavigationToolbarView : View {
    var onCancel : () -> Void
    var destinationName : String
    var distance : String
    var time :String
    
    var body: some View {
        VStack{
            HStack(spacing:30){
                Button{
                    onCancel()
                    
                } label: {
                    Image(systemName: "multiply.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32,height: 32)
                        .foregroundStyle(Color.red)
                }
                VStack{
                    Text("\(destinationName)")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.black)
                        .bold()
                    HStack(spacing:20) {
                        
                        Image(systemName: "figure.walk")
                            .resizable()
                            .scaledToFit()
                            .padding(.trailing,-10)
                            .foregroundStyle(Color.gray)
                        Text("\(distance) m")
                            .font(.subheadline)
                            .foregroundStyle(Color.gray)
                            .bold()
                        Image(systemName: "clock")
                            .resizable()
                            .scaledToFit()
                            .padding(.trailing,-10)
                            .foregroundStyle(Color.gray)
                        Text("\(time) min")
                            .font(.subheadline)
                            .foregroundStyle(Color.gray)
                            .bold()
                    }.frame(height: 24)
                    
                    

                    
                }

                Spacer()
            }
            .padding()
        }
        .frame(height: 100 ) //88
        .background(Color.white)
        .clipShape(
            .rect(
                topLeadingRadius: 24,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: 24
            )
        )
    }
}

#Preview {
    ARNavigationView(
        pathfindingManager: PathfindingManager(), locationDataManager: LocationDataManager()
    )
}
