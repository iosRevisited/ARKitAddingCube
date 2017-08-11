//
//  ViewController.swift
//  ARKitAddingCube
//
//  Created by Sai Sandeep on 08/08/17.
//  Copyright © 2017 Sai Sandeep. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    var sceneView = ARSCNView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        sceneView.frame = view.frame
        view.addSubview(sceneView)
        
        
        
        let configuration = ARWorldTrackingSessionConfiguration()
        //        configuration.planeDetection = .horizontal
        
        sceneView.session.run(configuration)
        
        addButton()
        
        
    }
    
    @IBAction func addCubeButtonTapped(sender: UIButton) {
        DispatchQueue.main.async {
            print("cube button tapped")
            let cubeNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
            let cc = self.getMyCameraCoordinates(sceneView: self.sceneView)
            cubeNode.position = SCNVector3(cc.translation.x, cc.translation.y, cc.translation.z)
            self.sceneView.scene.rootNode.addChildNode(cubeNode)
        }
    }
    
    func getMyCameraCoordinates(sceneView: ARSCNView) -> MDLTransform {
        let cameraTransform = sceneView.session.currentFrame?.camera.transform
        let cameraCoordinates = MDLTransform(matrix: cameraTransform!)
        return cameraCoordinates
    }
    
    func addButton() {
        let button = UIButton()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add a CUBE", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        button.addTarget(self, action: #selector(addCubeButtonTapped(sender:)) , for: .touchUpInside)
        
        // Contraints
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8.0).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}













