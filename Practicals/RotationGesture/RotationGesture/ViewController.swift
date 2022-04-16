//
// ViewController.swift
// RotationGesture
//
// Created by GLADWIN KURIAN on 15/04/22.
// Copyright (c) 2020 OWNER. All rights reserved.
//
// FURTHER, IF ANY
//


import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
   
    
    @IBOutlet var sceneView: ARSCNView!
 
     var currentAngleZ : Float = 0.0
    var currentAngleX : Float = 0.0
    var currentAngleY : Float = 0.0
  
    var newAngleX : Float = 0.0
    var newAngleY : Float = 0.0
    var newAngleZ : Float = 0.0
    @IBAction func rotationGesture(_ sender: UIRotationGestureRecognizer) {
    
        if sender.state == .changed {
                         let areaTouched = sender.view as? SCNView
                         let location = sender.location(in: areaTouched)
                         let hitTestResults = sceneView.hitTest(location, options: nil)
                         if let hitTest = hitTestResults.first {
                             let plane = hitTest.node
                             newAngleX = Float(-sender.rotation)
                             newAngleY = Float(-sender.rotation)
                             newAngleZ = Float(-sender.rotation)
                             newAngleZ += currentAngleZ
                             newAngleX += currentAngleX
                             newAngleY += currentAngleY
                             plane.eulerAngles.x = newAngleX
                             plane.eulerAngles.y = newAngleY
                             plane.eulerAngles.z = newAngleZ
      
                         }
      
                     } else if sender.state == .ended {
                         currentAngleX = newAngleX
                         currentAngleY = newAngleY
                         currentAngleZ = newAngleZ
                     }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
