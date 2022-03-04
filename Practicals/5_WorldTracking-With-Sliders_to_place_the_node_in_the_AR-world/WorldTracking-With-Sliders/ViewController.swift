//
// ViewController.swift
// WorldTracking-With-Sliders
//
// Created by GLADWIN KURIAN on 26/02/22.
// Copyright (c) 2020 OWNER. All rights reserved.
//
// FURTHER, IF ANY
//


import UIKit
import ARKit
class ViewController: UIViewController {
    
    @IBOutlet weak var sliderX: UISlider!
    @IBOutlet weak var sliderY: UISlider!
    @IBOutlet weak var sliderZ: UISlider!
    @IBOutlet weak var sceneView: ARSCNView!
    let config = ARWorldTrackingConfiguration()
    
    
    @IBAction func addBox(_ sender: Any) {
        Add()
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.sceneView.session.run(config)
    }

     func Add() {
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.05, height: 0.05, length: 0.05, chamferRadius: 0)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.cyan
        node.position = SCNVector3(sliderX.value, sliderY.value,  sliderZ.value)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    
}

