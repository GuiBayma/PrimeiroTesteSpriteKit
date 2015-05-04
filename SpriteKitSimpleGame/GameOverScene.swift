//
//  GameOverScene.swift
//  SpriteKitSimpleGame
//
//  Created by Guilherme Bayma on 5/4/15.
//  Copyright (c) 2015 Guilherme Bayma. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    
    init(size: CGSize, monsters: Int) {
        
        super.init(size: size)
        
        // 1
        backgroundColor = SKColor.whiteColor()
        
        // 2
        var message = "Game Over!"
        var scoreMessage = "You killed \(monsters) monsters!"
        
        // 3
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = message
        label.fontSize = 40
        label.fontColor = SKColor.blackColor()
        label.position = CGPoint(x: size.width/2, y: size.height*0.75)
        addChild(label)
        
        let score = SKLabelNode(fontNamed: "Chalkduster")
        score.text = scoreMessage
        score.fontSize = 40
        score.fontColor = SKColor.blackColor()
        score.position = CGPoint(x: size.width/2, y: size.height*0.25)
        addChild(score)
        
        // 4
        runAction(SKAction.sequence([
            SKAction.waitForDuration(3.0),
            SKAction.runBlock() {
                // 5
                let reveal = SKTransition.flipHorizontalWithDuration(0.5)
                let scene = InitialScene(size: size)
                self.view?.presentScene(scene, transition:reveal)
            }
            ]))
        
    }
    
    // 6
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
