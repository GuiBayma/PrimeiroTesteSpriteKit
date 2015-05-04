//
//  InitialScene.swift
//  SpriteKitSimpleGame
//
//  Created by Guilherme Bayma on 5/4/15.
//  Copyright (c) 2015 Guilherme Bayma. All rights reserved.
//

import Foundation
import SpriteKit

class InitialScene: SKScene {
    
    var highScoreButton: SKNode! = nil
    var playButton: SKNode! = nil
    
    override func didMoveToView(view: SKView) {
        
        playBackgroundMusic("background-music-aac.caf")
        // 2
        backgroundColor = SKColor.whiteColor()
        self.alpha = 0.8
        // 3
        
        let Titlelabel = SKLabelNode(fontNamed: "Chalkduster")
        Titlelabel.text = "Ninja Monsters kill"
        Titlelabel.fontSize = 60
        Titlelabel.fontColor = SKColor.blackColor()
        Titlelabel.position = CGPoint(x: size.width/2, y: size.height*0.7)
        addChild(Titlelabel)
        
        playButton = SKSpriteNode(imageNamed: "play")
        playButton.position = CGPoint(x: size.width/4, y: size.height/4);
        self.addChild(playButton)
        
        highScoreButton = SKSpriteNode(imageNamed: "high")
        highScoreButton.position = CGPoint(x: size.width*3/4, y: size.height/4)
        self.addChild(highScoreButton)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        let touch = touches.first as! UITouch
        let touchLocation = touch.locationInNode(self)
        
        if playButton.containsPoint(touchLocation) {
            let reveal = SKTransition.flipHorizontalWithDuration(0.5)
            let gameScene = GameScene(size: self.size)
            self.view?.presentScene(gameScene, transition: reveal)
        }
        else if highScoreButton.containsPoint(touchLocation) {
            let reveal = SKTransition.flipHorizontalWithDuration(0.5)
            let highScoreScene = HighScoreScene(size: self.size)
            self.view?.presentScene(highScoreScene, transition: reveal)
        }
    }
    
}
