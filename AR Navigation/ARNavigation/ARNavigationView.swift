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
            
            VStack{
                HStack{
                    Button{
                        pathfindingManager.ResetPathfinder()
                        dismiss()
                        
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward.circle")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(Color.gray)
                    }
                    .padding()
                    VStack{
                        Text("Destination")
                            .foregroundStyle(Color.gray)
                        Text("Jogging Park Gop Lorem Ipsum")
                            .foregroundStyle(Color.black)
                            .bold()
                        
                    }
                    Spacer()
                    VStack{
                        Text("estimate")
                            .foregroundStyle(Color.gray)
                        Text("100m")
                            .foregroundStyle(Color.black)
                            .bold()
                        Text("6min")
                            .foregroundStyle(Color.black)
                            .bold()
                    }
                    
                    Spacer()
                }
            }
            .frame(height: 64 + 20)
            .background(Color.white)
            .clipShape(
                .rect(
                    topLeadingRadius: 24,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 24
                )
            )
        })
        .overlay{
            VStack{
                ZStack{
                    Button("Change Destination"){
                        locationDataManager.cycleLocation()
                    }
                    
//                    if locationDataManager.hasArrived{
//                        ArrivedAtDestinationModal(
//                            showModal: $locationDataManager.hasArrived ,
//                            pathFindingManager: pathfindingManager)
//                    }
                }
                
                
                
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

//struct ARViewContainer: UIViewRepresentable {
//    
//    let modelName: String
//    let axis = normalize(SIMD3<Float>(x: 0, y: 1, z: 0))
//    @Binding var angle : Float
//    
//    
//    
//    func makeUIView(context: Context) -> ARView {
//        let arView = ARView(frame: .zero)
//        arView.scene.anchors.removeAll()
//        
//        let arrow = try! ModelEntity.load(named: "Direction_Arrow.usdz")
//        
//        let scalingPivot = Entity()
//        scalingPivot.name = "arrowPivot"
//        scalingPivot.position.y = arrow.visualBounds(relativeTo: nil).center.y
//        scalingPivot.addChild(arrow)
//        
//        // compensating a robot position
//        arrow.position.y -= scalingPivot.position.x
//        
//        let anchor = AnchorEntity(.camera)
//        anchor.addChild(scalingPivot)
//        arView.scene.addAnchor(anchor)
//        
//        
//        scalingPivot.position = [0,-0.4,-1.2]
//        scalingPivot.scale = [0.2,0.2,0.2]
//        //scalingPivot.orientation = simd_quatf(angle: angel, axis: axis)
//        return arView
//    }
//    
//    func updateUIView(_ uiView: ARView, context: Context) {
//        
//        let rotateEntity : Entity = uiView.scene.findEntity(named: "arrowPivot") ?? Entity()
//        rotateEntity.orientation = simd_quatf(angle: angle - (.pi / 2 + .pi), axis: axis)
//        
//        
//    }
//}

#Preview {
    ARNavigationView(
        pathfindingManager: PathfindingManager(), locationDataManager: LocationDataManager()
    )
}
