//
// ViewController.swift
// AR-single-view-app
//
// Created by GLADWIN KURIAN on 01/03/22.
// Copyright (c) 2020 OWNER. All rights reserved.
//
// FURTHER, IF ANY
//


import UIKit
import ARKit

class ViewController: UIViewController {

  
    @IBOutlet weak var arscnView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        arscnView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        arscnView.session.pause()
    }



}

