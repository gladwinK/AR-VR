//
// ViewController.swift
// DrawingApp
//
// Created by GLADWIN KURIAN on 15/04/22.
// Copyright (c) 2020 OWNER. All rights reserved.
//
// FURTHER, IF ANY
//


import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController, ARSCNViewDelegate{
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var switchDraw: UISwitch!
    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sceneView.delegate = self
        sceneView.showsStatistics = true
        let scene = SCNScene()
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        sceneView.session.run(configuration)
        sceneView.session.run(configuration)
    
    }
    

    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval) {
        guard let pov = sceneView.pointOfView else {
            return
        }
        
        let transform = pov.transform
        
        let rotation = SCNVector3(-transform.m31, -transform.m32, -transform.m33)
        let location = SCNVector3(transform.m41, transform.m42, transform.m43)
        let currentPosition = SCNVector3(rotation.x + location.x, rotation.y + location.y, rotation.z + location.z)
        
        DispatchQueue.main.async {
            if self.switchDraw.isOn {
                let drawNode = SCNNode()
                drawNode.geometry = SCNSphere(radius: 0.01)
                drawNode.geometry?.firstMaterial?.diffuse.contents = UIColor.green
                drawNode.position = currentPosition
                self.sceneView.scene.rootNode.addChildNode(drawNode)
            } else {
                let point = SCNNode()
                point.name = "aiming point"
                point.geometry = SCNSphere(radius: 0.005)
                point.position = currentPosition
                point.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
                self.sceneView.scene.rootNode.enumerateChildNodes({ (node, _) in
                    if node.name == "aiming point" {
                        node.removeFromParentNode()
                    }
                
                })
            
                self.sceneView.scene.rootNode.addChildNode(point)
            }
        
            if self.clearButton.isHighlighted { self.sceneView.scene.rootNode.enumerateChildNodes({ (node, _) in
                        node.removeFromParentNode()
                })
            }
            
       }
        
    }

}


