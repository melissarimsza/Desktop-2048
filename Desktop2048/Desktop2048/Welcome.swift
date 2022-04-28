//
//  Welcome.swift
//  Desktop2048
//
//  Created by Melissa Rimsza on 11/22/21.
//

import Foundation
import SpriteKit
import Cocoa

class Welcome: SKScene {
    var controller: ViewController
    
    init(controller: ViewController, size: CGSize) {
        self.controller = controller
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "welcomeBackground")
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.size = CGSize(width: 1140, height: 812)

        addChild(background)
        
    }
    
    //move to the game scene if the space bar is pressed
    override func keyUp(with event: NSEvent) {
        let key = event.keyCode
        
        if (key == 49) {
            guard let view = view else {return}
            guard let gameScene = controller.gameScene else {return}
            
            view.presentScene(gameScene)
        }
    }
    
}
