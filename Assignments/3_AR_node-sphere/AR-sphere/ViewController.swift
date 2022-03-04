//
// ViewController.swift
// AR-sphere
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
        addSphere()
    }
    func addSphere(){
        let newNode = SCNNode()
        newNode.geometry = SCNSphere(radius: 0.07)
        newNode.geometry?.firstMaterial?.diffuse.contents = UIColor.systemBlue
        newNode.position = SCNVector3(0,0,-0.4)
        sceneView.scene.rootNode.addChildNode(newNode)
        
        sceneView.session.run(config);
    }


}

