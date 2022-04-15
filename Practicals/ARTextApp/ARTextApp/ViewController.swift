//
// ViewController.swift
// ARTextApp
//
// Created by GLADWIN KURIAN on 15/04/22.
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
    
    let node = SCNNode()
        let text = SCNText(string : "Gladwin Kurian", extrusionDepth: 1)
        
        node.geometry = text;
        node.position = SCNVector3(-18,-1,-20)
        text.font = UIFont(name: "Helvatica", size: 9)
        
        sceneView.scene.rootNode.addChildNode(node);
        sceneView.session.run(config);
    }


}

