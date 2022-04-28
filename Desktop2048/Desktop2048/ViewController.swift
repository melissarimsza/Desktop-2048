//
//  ViewController.swift
//  Desktop2048
//
//  Created by Melissa Rimsza on 11/17/21.
//

import Cocoa
import SpriteKit

class ViewController: NSViewController {
    
    var welcomeScene: Welcome?
    var gameScene: Game?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /*
        var myGrid = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 4)
        
        for array in myGrid {
            for value in array {
                print(value, terminator: " ")
            }
            print(" ")
        }*/
    }

    override func viewWillAppear() {
        super.viewWillAppear()
        
        if let window = view.window, let screen = window.screen {
            let visibleScreen = screen.visibleFrame
            let newFrame = NSRect(x: visibleScreen.origin.x, y: visibleScreen.origin.y, width: visibleScreen.width - 300, height: visibleScreen.height)
            window.setFrame(newFrame, display: true)
            
            print("width: ", visibleScreen.width - 300)
            print("height: ", visibleScreen.height)
            
            window.title = "2048"
        }
        
        welcomeScene = Welcome(controller: self, size: view.frame.size)
        gameScene = Game(controller: self, size: view.frame.size)
        
        let spriteKitView = SKView(frame: view.frame)
        
        view = spriteKitView
        
        spriteKitView.presentScene(welcomeScene)
    }
}

