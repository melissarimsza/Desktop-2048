//
//  Game.swift
//  Desktop2048
//
//  Created by Melissa Rimsza on 11/22/21.
//

import Foundation
import Cocoa
import SpriteKit

class Game: SKScene {
    var controller: ViewController
    var myGrid: Grid
    
    var scoreLabel: SKLabelNode!
    var scoreValue: SKLabelNode!
    
    init(controller: ViewController, size: CGSize) {
        self.controller = controller
        self.myGrid = Grid()
        super.init(size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //setting up the scene
    override func didMove(to view: SKView) {
        
        //creating and adding the game background
        let background = SKSpriteNode(imageNamed: "gameBackground")
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.size = CGSize(width: 1140, height: 812)
        addChild(background)
    
        //displaying grid and score
        myGrid.reset()
        displayGrid()
        displayScore()
    }
    
    override func keyDown(with event: NSEvent) {
        
        let key = event.keyCode
        
        switch key {
        case 126 :
            //up arrow
            myGrid.upArrow()
            myGrid.randomUp()
            displayGrid()
            displayScore()
            winOrLose()
        case 125:
            //down arrow
            myGrid.downArrow()
            myGrid.randomDown()
            displayGrid()
            displayScore()
            winOrLose()
        case 124:
            //right arrow
            myGrid.rightArrow()
            myGrid.randomRight()
            displayGrid()
            displayScore()
            winOrLose()
        case 123:
            //left arrow
            myGrid.leftArrow()
            myGrid.randomLeft()
            displayGrid()
            displayScore()
            winOrLose()
        default:
            print("no arrow pushed")
        }
    }
    
    func displayGrid() {
        //remove all previouse nodes
        removeAllChildren()
        
        //play the button sound
        playButtonSound()
        
        //drawing and adding the background
        let background = SKSpriteNode(imageNamed: "gameBackground")
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.size = CGSize(width: 1140, height: 812)
        addChild(background)

        //0
        let node0Image: String = String(myGrid.getValue(x: 0, y: 0))
        let node0 = SKSpriteNode(imageNamed: node0Image)
        node0.position = CGPoint(x: 448, y: 432)
        node0.size = CGSize(width: 75, height: 75)
        addChild(node0)
        
        //1
        let node1Image: String = String(myGrid.getValue(x: 0, y: 1))
        let node1 = SKSpriteNode(imageNamed: node1Image)
        node1.position = CGPoint(x: 528, y: 432)
        node1.size = CGSize(width: 75, height: 75)
        addChild(node1)
        
        //2
        let node2Image: String = String(myGrid.getValue(x: 0, y: 2))
        let node2 = SKSpriteNode(imageNamed: node2Image)
        node2.position = CGPoint(x: 608, y: 432)
        node2.size = CGSize(width: 75, height: 75)
        addChild(node2)
        
        //3
        let node3Image: String = String(myGrid.getValue(x: 0, y: 3))
        let node3 = SKSpriteNode(imageNamed: node3Image)
        node3.position = CGPoint(x: 688, y: 432)
        node3.size = CGSize(width: 75, height: 75)
        addChild(node3)
        
        //4
        let node4Image: String = String(myGrid.getValue(x: 1, y: 0))
        let node4 = SKSpriteNode(imageNamed: node4Image)
        node4.position = CGPoint(x: 448, y: 352)
        node4.size = CGSize(width: 75, height: 75)
        addChild(node4)
        
        //5
        let node5Image: String = String(myGrid.getValue(x: 1, y: 1))
        let node5 = SKSpriteNode(imageNamed: node5Image)
        node5.position = CGPoint(x: 528, y: 352)
        node5.size = CGSize(width: 75, height: 75)
        addChild(node5)
        
        //6
        let node6Image: String = String(myGrid.getValue(x: 1, y: 2))
        let node6 = SKSpriteNode(imageNamed: node6Image)
        node6.position = CGPoint(x: 608, y: 352)
        node6.size = CGSize(width: 75, height: 75)
        addChild(node6)
        
        //7
        let node7Image: String = String(myGrid.getValue(x: 1, y: 3))
        let node7 = SKSpriteNode(imageNamed: node7Image)
        node7.position = CGPoint(x: 688, y: 352)
        node7.size = CGSize(width: 75, height: 75)
        addChild(node7)
        
        //8
        let node8Image: String = String(myGrid.getValue(x: 2, y: 0))
        let node8 = SKSpriteNode(imageNamed: node8Image)
        node8.position = CGPoint(x: 448, y: 272)
        node8.size = CGSize(width: 75, height: 75)
        addChild(node8)
        
        //9
        let node9Image: String = String(myGrid.getValue(x: 2, y: 1))
        let node9 = SKSpriteNode(imageNamed: node9Image)
        node9.position = CGPoint(x: 528, y: 272)
        node9.size = CGSize(width: 75, height: 75)
        addChild(node9)
        
        //10
        let node10Image: String = String(myGrid.getValue(x: 2, y: 2))
        let node10 = SKSpriteNode(imageNamed: node10Image)
        node10.position = CGPoint(x: 608, y: 272)
        node10.size = CGSize(width: 75, height: 75)
        addChild(node10)
        
        //11
        let node11Image: String = String(myGrid.getValue(x: 2, y: 3))
        let node11 = SKSpriteNode(imageNamed: node11Image)
        node11.position = CGPoint(x: 688, y: 272)
        node11.size = CGSize(width: 75, height: 75)
        addChild(node11)
        
        //12
        let node12Image: String = String(myGrid.getValue(x: 3, y: 0))
        let node12 = SKSpriteNode(imageNamed: node12Image)
        node12.position = CGPoint(x: 448, y: 192)
        node12.size = CGSize(width: 75, height: 75)
        addChild(node12)
        
        //13
        let node13Image: String = String(myGrid.getValue(x: 3, y: 1))
        let node13 = SKSpriteNode(imageNamed: node13Image)
        node13.position = CGPoint(x: 528, y: 192)
        node13.size = CGSize(width: 75, height: 75)
        addChild(node13)
        
        //14
        let node14Image: String = String(myGrid.getValue(x: 3, y: 2))
        let node14 = SKSpriteNode(imageNamed: node14Image)
        node14.position = CGPoint(x: 608, y: 192)
        node14.size = CGSize(width: 75, height: 75)
        addChild(node14)
        
        //15
        let node15Image: String = String(myGrid.getValue(x: 3, y: 3))
        let node15 = SKSpriteNode(imageNamed: node15Image)
        node15.position = CGPoint(x: 688, y: 192)
        node15.size = CGSize(width: 75, height: 75)
        addChild(node15)
        
    }
    
    func displayScore() {
        
        //getting the score
        let newScore = myGrid.getScore()
        let scoreString = String(newScore)
        
        //creating and adding the score label node
        scoreLabel = SKLabelNode(fontNamed: "Arial")
        scoreLabel.fontSize = 25
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.text =  "Score: "
        scoreLabel.position = CGPoint(x: frame.midX - 5 , y: 100)
        addChild(scoreLabel)
        
        //creating anf adding the score value node
        scoreValue = SKLabelNode(fontNamed: "Arial")
        scoreValue.fontSize = 25
        scoreValue.horizontalAlignmentMode = .left
        scoreValue.text = scoreString
        scoreValue.position = CGPoint(x: frame.midX + 5 , y: 100)
        addChild(scoreValue)
    }
    
    //plays the sound every time an arrow key is clicked
    func playButtonSound() {
        //making a sound node, adding it to the scene, running the action
        var buttonSound = SKAudioNode(fileNamed: "button.mp3")
        buttonSound.isPositional = false
        buttonSound.autoplayLooped = false
        addChild(buttonSound)
        buttonSound.run(SKAction.play())
    }
    
    //plays the success sound when the player reaches 2048
    func playSuccessSound() {
        //making a sound node, adding it to the scene, running the action
        var successSound = SKAudioNode(fileNamed: "success.mp3")
        successSound.isPositional = false
        successSound.autoplayLooped = false
        addChild(successSound)
        successSound.run(SKAction.play())
    }
    
    //brings the player back to the welcome scene if they win or lose
    func returnHome() {
        let secondsToDelay = 5.0
        DispatchQueue.main.asyncAfter(deadline: .now() + secondsToDelay) {
            guard let view = self.view else {return}
            guard let gameScene = self.controller.welcomeScene else {return}
            
            view.presentScene(gameScene)
        }
    }
    
    //checks if the player has won or lost, called after each arrow key press
    func winOrLose() {
        //checking for a win, calls on function from grid class
        if (myGrid.checkWin()) {
            playSuccessSound()
            let successNode = SKSpriteNode(imageNamed: "win_final")
            successNode.size = CGSize(width: 620, height: 275)
            successNode.position = CGPoint(x: frame.midX, y: frame.midY)
            addChild(successNode)
            returnHome()
        }
        //checking for a loss, calls on function from grid class
        if (myGrid.checkLoss()) {
            let failNode = SKSpriteNode(imageNamed: "lose_final")
            failNode.size = CGSize(width: 620, height: 275)
            failNode.position = CGPoint(x: frame.midX, y: frame.midY)
            addChild(failNode)
            returnHome()
        }
    }
}
