//
// ViewController.swift
// AR-node
//
// Created by GLADWIN KURIAN on 01/03/22.
// Copyright (c) 2020 OWNER. All rights reserved.
//
// FURTHER, IF ANY
//


import UIKit
import ARKit
class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let config = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
  
        let newNode = SCNNode()
//        newNode.geometry = SCNCapsule(capRadius: 0.05, height: 0.1)
//        newNode.geometry = SCNBox(width: 0.05, height: 0.05, length: 0.05, chamferRadius: 0)
        newNode.geometry = SCNPyramid(width: 0.05   , height: 0.05, length: 0.05)
        newNode.position = SCNVector3(0,0,0);
        
        
//        newNode.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
        sceneView.scene.rootNode.addChildNode(newNode);
        
        
        // start the session
        sceneView.session.run(config)
    }


}

