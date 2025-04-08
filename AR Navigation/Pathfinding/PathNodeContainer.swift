//
//  PathNodeContainer.swift
//  AR Navigation
//
//  Created by Gede Binar on 07/04/25.
//

import Foundation
import CoreLocation

class PathNodeContainer {
    
    static var testingNodes1 : [PathNode] = [
        PathNode(
            nodeIndex: 0, nodeConnections: [
                NodeConnection(nodeIndex: 1, distance: 2),
                NodeConnection(nodeIndex:3, distance: 3),
            ]
        ),
        PathNode(nodeIndex: 1,
                 nodeConnections: [
                    NodeConnection(nodeIndex: 0, distance: 2),
                    NodeConnection(nodeIndex:3, distance: 4),
                    NodeConnection(nodeIndex:2, distance: 5),
                    NodeConnection(nodeIndex:4, distance: 2)
                 ]),
        PathNode(nodeIndex: 2,
                 nodeConnections: [
                    NodeConnection(nodeIndex: 1, distance: 5),
                    NodeConnection(nodeIndex:5, distance: 1)
                 ]),
        PathNode(nodeIndex: 3,
                 nodeConnections: [
                    NodeConnection(nodeIndex: 1, distance: 4),
                    NodeConnection(nodeIndex:4, distance: 3),
                    NodeConnection(nodeIndex:0, distance: 3),
                 ]),
        PathNode(nodeIndex: 4,
                 nodeConnections: [
                    NodeConnection(nodeIndex: 1, distance: 2),
                    NodeConnection(nodeIndex:3, distance: 3),
                    NodeConnection(nodeIndex:5, distance: 3)
                 ]),
        PathNode(nodeIndex: 5,
                 nodeConnections: [
                    NodeConnection(nodeIndex: 4, distance: 3),
                    NodeConnection(nodeIndex:2, distance: 1)
                 ])
    ]
    
    //Has Minor Hallucination at F
    static var testingNodes2: [PathNode] = [
        PathNode(
            nodeIndex: 0,
            nodeConnections:[
                NodeConnection(nodeIndex: 3, distance: 2),
                NodeConnection(nodeIndex: 1, distance: 4),
            ],
            nodeName: "A"
        ),
        //
        PathNode(
            nodeIndex: 1,
            nodeConnections:[
                NodeConnection(nodeIndex: 0, distance: 4),
                NodeConnection(nodeIndex: 2, distance: 5),
            ],
            nodeName: "B"
        ),
        //
        PathNode(
            nodeIndex: 2,
            nodeConnections:[
                NodeConnection(nodeIndex: 1, distance: 5),
                NodeConnection(nodeIndex: 8, distance: 3),
            ],
            nodeName: "C/K"
        ),
        PathNode(
            nodeIndex: 3,
            nodeConnections:[
                NodeConnection(nodeIndex: 0, distance: 2),
                NodeConnection(nodeIndex: 4, distance: 3),
                NodeConnection(nodeIndex: 6, distance: 4),
                NodeConnection(nodeIndex: 8, distance: 3),
            ],
            nodeName: "D"
        ),
        PathNode(
            nodeIndex: 4,
            nodeConnections:[
                NodeConnection(nodeIndex: 3, distance: 3),
                NodeConnection(nodeIndex: 4, distance: 1),
            ],
            nodeName: "E"
        ),
        //
        PathNode(
            nodeIndex: 5,
            nodeConnections:[
                NodeConnection(nodeIndex: 4, distance: 1),
                NodeConnection(nodeIndex: 6, distance: 3),
            ],
            nodeName: "F"
        ),
        //
        PathNode(
            nodeIndex: 6,
            nodeConnections:[
                NodeConnection(nodeIndex: 5, distance: 3),
                NodeConnection(nodeIndex: 3, distance: 4),
                NodeConnection(nodeIndex: 7, distance: 2),
            ],
            nodeName: "G"
        ),
        PathNode(
            nodeIndex: 7,
            nodeConnections:[
                NodeConnection(nodeIndex: 6, distance: 2),
                NodeConnection(nodeIndex: 9, distance: 1),
            ],
            nodeName: "H"
        ),
        PathNode(
            nodeIndex: 8,
            nodeConnections:[
                NodeConnection(nodeIndex: 3, distance: 3),
                NodeConnection(nodeIndex: 2, distance: 3),
                NodeConnection(nodeIndex: 9, distance: 4),
            ],
            nodeName: "I"
        ),
        PathNode(
            nodeIndex: 9,
            nodeConnections:[
                NodeConnection(nodeIndex: 8, distance: 4),
                NodeConnection(nodeIndex: 7, distance: 1),
            ],
            nodeName: "J"
        ),
        
    ]

    static var testingNodes3: [PathNode] = [
        PathNode(
            nodeIndex: 0,
            nodeConnections:[
                NodeConnection(nodeIndex: 3, distance: 2),
                NodeConnection(nodeIndex: 1, distance: 4),
            ],
            nodeName: "Apple Academy",
            nodeCoordinate: CLLocationCoordinate2D(latitude: -6.3018583391480245, longitude: 106.65235130605886)
        ),
        //
        PathNode(
            nodeIndex: 1,
            nodeConnections:[
                NodeConnection(nodeIndex: 0, distance: 4),
                NodeConnection(nodeIndex: 2, distance: 5),
            ],
            nodeName: "BSD Link",
            nodeCoordinate: CLLocationCoordinate2D(latitude: -6.301384980170001, longitude: 106.65313631678508)
        ),
        //
        PathNode(
            nodeIndex: 2,
            nodeConnections:[
                NodeConnection(nodeIndex: 1, distance: 5),
                NodeConnection(nodeIndex: 8, distance: 3),
            ],
            nodeName: "Purwadhika",
            nodeCoordinate: CLLocationCoordinate2D(latitude:-6.302385989195373,longitude:106.65227637651314)
        ),
        PathNode(
            nodeIndex: 3,
            nodeConnections:[
                NodeConnection(nodeIndex: 0, distance: 2),
                NodeConnection(nodeIndex: 4, distance: 3),
                NodeConnection(nodeIndex: 6, distance: 4),
                NodeConnection(nodeIndex: 8, distance: 3),
            ],
            nodeName: "Green Eatery",
            nodeCoordinate: CLLocationCoordinate2D(latitude:-6.30207039644354,longitude:106.65252829582444)
        ),
        PathNode(
            nodeIndex: 4,
            nodeConnections:[
                NodeConnection(nodeIndex: 3, distance: 3),
                NodeConnection(nodeIndex: 4, distance: 1),
            ],
            nodeName: "commsult",
            nodeCoordinate: CLLocationCoordinate2D(latitude:-6.302120512049928,longitude:106.6522019314486)
        ),
        //
        PathNode(
            nodeIndex: 5,
            nodeConnections:[
                NodeConnection(nodeIndex: 4, distance: 1),
                NodeConnection(nodeIndex: 6, distance: 3),
            ],
            nodeName: "Alfamart",
            nodeCoordinate: CLLocationCoordinate2D(latitude:-6.302377315695916,longitude:106.65206874982911)
        ),
        //
        PathNode(
            nodeIndex: 6,
            nodeConnections:[
                NodeConnection(nodeIndex: 5, distance: 3),
                NodeConnection(nodeIndex: 3, distance: 4),
                NodeConnection(nodeIndex: 7, distance: 2),
            ],
            nodeName: "Jogging Track The Breeze",
            nodeCoordinate: CLLocationCoordinate2D(latitude:-6.30288683390901,longitude:106.65238109588839)
        ),
        PathNode(
            nodeIndex: 7,
            nodeConnections:[
                NodeConnection(nodeIndex: 6, distance: 2),
                NodeConnection(nodeIndex: 9, distance: 1),
            ],
            nodeName: "Burgreens",
            nodeCoordinate: CLLocationCoordinate2D(latitude:-6.301847402036466,longitude:106.65358465164711)
        ),
        PathNode(
            nodeIndex: 8,
            nodeConnections:[
                NodeConnection(nodeIndex: 3, distance: 3),
                NodeConnection(nodeIndex: 2, distance: 3),
                NodeConnection(nodeIndex: 9, distance: 4),
            ],
            nodeName: "BSD Link",
            nodeCoordinate: CLLocationCoordinate2D(latitude: -6.301384980170001, longitude: 106.65313631678508)
        ),
        PathNode(
            nodeIndex: 9,
            nodeConnections:[
                NodeConnection(nodeIndex: 8, distance: 4),
                NodeConnection(nodeIndex: 7, distance: 1),
            ],
            nodeName: "Ranch Market",
            nodeCoordinate: CLLocationCoordinate2D(latitude: -6.302250327701575, longitude: 106.65306362775476)
        ),
        
    ]
    
}

