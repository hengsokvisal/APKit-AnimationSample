//
//  ViewController.swift
//  ARKitAPP
//
//  Created by HengVisal on 5/24/18.
//  Copyright © 2018 HengVisal. All rights reserved.
//

import UIKit
import ARKit
class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    // Create node to display object
    let node = SCNNode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.session.run(configuration)
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin ,
                                       ARSCNDebugOptions.showFeaturePoints]
        
        // Give Shape to node
        self.node.geometry = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0 )
        
        // Give color to node
        self.node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
        //Give position to node
        self.node.position = SCNVector3(0, 0, -0.5)
        
        //add note to sceneView
        self.sceneView.scene.rootNode.addChildNode(node)
    }

    @IBAction func btnLeft(_ sender: Any) {
        SCNTransaction.animationDuration = 1.0
        self.node.position.x -= 0.1
    }
    @IBAction func btnRight(_ sender: Any) {
        SCNTransaction.animationDuration = 1.0
        self.node.position.x += 0.1
    }
    
    @IBAction func btnClick(_ sender: UIButton) {
        SCNTransaction.animationDuration = 1.0
        self.node.position.y += 0.1
    }
    @IBAction func btnDown(_ sender: Any) {
        SCNTransaction.animationDuration = 1.0
        self.node.position.y -= 0.1
    }
}

