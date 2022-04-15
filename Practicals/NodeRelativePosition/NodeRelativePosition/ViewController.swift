//
// ViewController.swift
// NodeRelativePosition
//
// Created by GLADWIN KURIAN on 15/04/22.
// Copyright (c) 2020 OWNER. All rights reserved.
//
// FURTHER, IF ANY
//


import UIKit
import ARKit

class ViewController: UIViewController {
    let configuration = ARWorldTrackingConfiguration()

        @IBOutlet weak var sceneView: ARSCNView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        let node1 = SCNNode()
        node1.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        node1.position = SCNVector3(-0.1,0,-0.2)
        
        
        let node2 = SCNNode()
        node2.geometry = SCNSphere(radius: 0.06)
        node2.position = SCNVector3( 0.2,0,0);
        
        node1.addChildNode(node2)
        
        sceneView.scene.rootNode.addChildNode(node1)
        
        sceneView.session.run(configuration);
        
    }


}

