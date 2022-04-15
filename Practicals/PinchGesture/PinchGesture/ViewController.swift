//
// ViewController.swift
// PinchGesture
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
    
    @IBAction func pinchGesture(_ sender: UIPinchGestureRecognizer) {
        
        if sender.state == .changed {
                    let areaPinched = sender.view as! SCNView
                    let location = sender.location(in: areaPinched)
                    let hitTestResults = sceneView.hitTest(location, options: nil)
                    
                    if let hitTest = hitTestResults.first{
                        let plane = hitTest.node
                       
                        let scaleX = Float(sender.scale) * plane.scale.x
                        let scaleY = Float(sender.scale) * plane.scale.y
                        let scaleZ = Float(sender.scale) * plane.scale.z
                        
                        plane.scale = SCNVector3(scaleX,scaleY,scaleZ)
                        
                        sender.scale = 1
                    }
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
