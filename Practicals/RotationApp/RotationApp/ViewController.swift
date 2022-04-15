
import UIKit
import GLKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate{
    
    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    let node = SCNNode()
    
    var currentX : Float = 0
    var currentY : Float = 0
    var currentZ : Float = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sceneView.delegate = self
        sceneView.showsStatistics = true
        
        let scene = SCNScene()
        sceneView.scene = scene
        
        //sceneView.debugOptions = [.showWorldOrigin, .showFeaturePoints]
        
        showShape()
        sceneView.session.run(configuration)
    }
    
    func showShape(){
        let earth = SCNSphere(radius: 0.2)
        earth.firstMaterial?.diffuse.contents = UIImage(named: "earth.jpg")
        node.geometry = earth
        node.position = SCNVector3(-0.15, 0, 0)
        sceneView.scene.rootNode.addChildNode(node)
        
//        let moon = SCNNode()
//        moon.geometry = SCNSphere(radius: 0.03)
//        moon.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "moon.jpeg")
//        moon.position = SCNVector3(0.05, 0.05, -0.4)
//        node.addChildNode(moon)
        
        
        
    }

    @IBAction func XChanged(_ sender: Any) {
        currentX = GLKMathDegreesToRadians((sender as AnyObject).value)
        node.eulerAngles = SCNVector3(currentX, currentY, currentZ)
    }
    
    @IBAction func YChanged(_ sender: Any) {
        currentY = GLKMathDegreesToRadians((sender as AnyObject).value)
        node.eulerAngles = SCNVector3(currentX, currentY, currentZ)
    }
    
    @IBAction func ZChanged(_ sender: Any) {
        currentZ = GLKMathDegreesToRadians((sender as AnyObject).value)
        node.eulerAngles = SCNVector3(currentX, currentY, currentZ)
    }
    
}
