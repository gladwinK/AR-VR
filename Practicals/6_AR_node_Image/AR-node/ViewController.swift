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
  
        let newNode = addNode()
        
        sceneView.scene.rootNode.addChildNode(newNode);
        
        
        // start the session
        sceneView.session.run(config)
    }

    func addNode() -> SCNNode{
        let earthNode = SCNSphere(radius: 0.05)
        
        let newNode = SCNNode(geometry: earthNode)
        newNode.position = SCNVector3(0, 0, 0.01)
        
        
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named : "earth-map.jpg")
        
        earthNode.materials = [material]
        return newNode
    }
}

