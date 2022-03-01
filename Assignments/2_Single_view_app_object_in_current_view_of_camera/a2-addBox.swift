//
// ViewController.swift
// World Tracking
//
// Created by GLADWIN KURIAN on 25/02/22.
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
       
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(config)
    }

    @IBAction func Add(_ sender: Any) {
        let node = SCNNode()
		
        
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
		node.geometry?.firstMaterial?.diffuse.contents = UIColor.green
		node.position = SCNVector3(0,0,0)
		self.sceneView.scene.rootNode.addChildNode(node)
	}
    
}


