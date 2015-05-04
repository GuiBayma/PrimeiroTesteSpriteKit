//
//  HighScoreScene.swift
//  SpriteKitSimpleGame
//
//  Created by Guilherme Bayma on 5/4/15.
//  Copyright (c) 2015 Guilherme Bayma. All rights reserved.
//

import Foundation
import SpriteKit

class HighScoreScene: SKScene {
    
    var backButton: SKNode! = nil
    
    override func didMoveToView(view: SKView) {
        
        backgroundColor = SKColor.whiteColor()
        
        let titlelabel = SKLabelNode(fontNamed: "Chalkduster")
        titlelabel.text = "High Scores"
        titlelabel.fontSize = 50
        titlelabel.fontColor = SKColor.blackColor()
        titlelabel.position = CGPoint(x: size.width/2, y: size.height*0.8)
        addChild(titlelabel)
        
        var score = 0
        let defaults = NSUserDefaults.standardUserDefaults()
        if let lastScore = defaults.integerForKey("userLastScoreKey") as Int? {
            score = lastScore
        }
        
        let lastScoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        lastScoreLabel.text = "Last Score: \(score)"
        lastScoreLabel.fontSize = 30
        lastScoreLabel.fontColor = SKColor.blackColor()
        lastScoreLabel.position = CGPoint(x: size.width/2, y: size.height*0.5)
        addChild(lastScoreLabel)

        
        backButton = SKSpriteNode(imageNamed: "back")
        backButton.position = CGPoint(x: size.width/2, y: size.height*0.2);
        self.addChild(backButton)

    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        let touch = touches.first as! UITouch
        let touchLocation = touch.locationInNode(self)
        
        if backButton.containsPoint(touchLocation) {
            let reveal = SKTransition.flipHorizontalWithDuration(0.5)
            let initialScene = InitialScene(size: self.size)
            self.view?.presentScene(initialScene, transition: reveal)
        }

    }

}
