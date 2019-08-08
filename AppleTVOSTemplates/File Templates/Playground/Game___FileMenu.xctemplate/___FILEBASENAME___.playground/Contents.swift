//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit

class GameScene: SKScene {
    
    private var label : SKLabelNode!
    
    override func didMove(to view: SKView) {
        // Get label node from scene and store it for use later
        label = childNode(withName: "//helloLabel") as? SKLabelNode
        label.alpha = 1.0
        let fadeInOut = SKAction.sequence([.fadeOut(withDuration: 1.0),
                                           .fadeIn(withDuration: 1.0)])
        
        let spin = SKAction.rotate(byAngle: 2.0 * .pi, duration: 2.0)
        spin.timingMode = .easeInEaseOut
        
        let scale = SKAction.sequence([.scale(to: 1.3, duration: 1.0),
                                       .scale(to: 1.0, duration: 1.0)])
        scale.timingMode = .easeInEaseOut
        
        label.run(.repeatForever(.sequence([.wait(forDuration: 3.0),
                                            .group([spin, fadeInOut, scale])])))
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    @objc static override var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
}

// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
if let scene = GameScene(fileNamed: "GameScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
