//
//  Cube.swift
//  Rubik's Cube App
//
//  Created by Yuki Li on 7/26/25.
//

import Foundation
import UIKit

struct Cube {
    
    let whiteFace: CubeFace
    let yellowFace: CubeFace
    let redFace: CubeFace
    let blueFace: CubeFace
    let orangeFace: CubeFace
    let greenFace: CubeFace
    
    init(whiteFace: CubeFace, yellowFace: CubeFace, redFace: CubeFace, blueFace: CubeFace, orangeFace: CubeFace, greenFace: CubeFace) {
        self.whiteFace = whiteFace
        self.yellowFace = yellowFace
        self.redFace = redFace
        self.blueFace = blueFace
        self.orangeFace = orangeFace
        self.greenFace = greenFace
    }
    
    init() {
        self.whiteFace = CubeFace(faceColor: "white")
        self.yellowFace = CubeFace(faceColor: "yellow")
        self.redFace = CubeFace(faceColor: "red")
        self.blueFace = CubeFace(faceColor: "blue")
        self.orangeFace = CubeFace(faceColor: "orange")
        self.greenFace = CubeFace(faceColor: "green")
    }
    
    func turnCube(_ turn: String) {
        switch turn {
        case "U": turnTopLayerClockwise()
        case "D": turnBottomLayerClockwise()
        case "F": turnFrontLayerClockwise()
        case "B": turnBackLayerClockwise()
        case "L": turnLeftLayerClockwise()
        case "R": turnRightLayerClockwise()
            
        case "U'": turnTopLayerCounterClockwise()
        case "D'": turnBottomLayerCounterClockwise()
        case "F'": turnFrontLayerCounterClockwise()
        case "B'": turnBackLayerCounterClockwise()
        case "L'": turnLeftLayerCounterClockwise()
        case "R'": turnRightLayerCounterClockwise()
            
        case "U2": turnTopLayerDouble()
        case "D2": turnBottomLayerDouble()
        case "F2": turnFrontLayerDouble()
        case "B2": turnBackLayerDouble()
        case "L2": turnLeftLayerDouble()
        case "R2": turnRightLayerDouble()
        
        default:
            print("Error: Invalid turn input")
            return
        }
    }
    
    func scrambleCube(srambleList: [String]) {
        
        self.resetCube()
        
        for scramble in srambleList {
            self.turnCube(scramble)
        }

    }
    
    func resetCube() {
        for i in 0..<3 {
            for j in 0..<3 {
                whiteFace.face[i][j] = UIColor.white
                yellowFace.face[i][j] = UIColor.yellow
                redFace.face[i][j] = UIColor.red
                blueFace.face[i][j] = UIColor.blue
                orangeFace.face[i][j] = UIColor.orange
                greenFace.face[i][j] = UIColor.green
            }
        }
    }
    
    
//=====================================Turn Clockwise==============================//
    func turnTopLayerClockwise() {
        
        whiteFace.turnFaceClockwise()
        
        // rotate first layer of (O, G, R, B)
        let tempOrangeFaceTop: [UIColor] = orangeFace.face[0]
        orangeFace.setNewTopRow(greenFace.getTopRow())
        greenFace.setNewTopRow(redFace.getTopRow())
        redFace.setNewTopRow(blueFace.getTopRow())
        blueFace.setNewTopRow(tempOrangeFaceTop)
    }
    
    func turnBottomLayerClockwise() {
        // rotate yellow face clockwise
        yellowFace.turnFaceClockwise()
        
        // rotate bottom layer
        let tempOrangeFaceBottom: [UIColor] = orangeFace.getBottomRow()
        orangeFace.setNewBottomRow(blueFace.getBottomRow())
        blueFace.setNewBottomRow(redFace.getBottomRow())
        redFace.setNewBottomRow(greenFace.getBottomRow())
        greenFace.setNewBottomRow(tempOrangeFaceBottom)
    }
    
    func turnFrontLayerClockwise(){
        // rotate green face clockwise
        greenFace.turnFaceClockwise()
        
        // rotate front layers
        let tempWhiteFaceBottom: [UIColor] = whiteFace.getBottomRow()
        whiteFace.setNewBottomRow(orangeFace.getRightColumn().reversed())
        orangeFace.setNewRightColumn(yellowFace.getTopRow())
        yellowFace.setNewTopRow(redFace.getLeftColumn().reversed())
        redFace.setNewLeftColumn(tempWhiteFaceBottom)
    
    }
    
    func turnBackLayerClockwise() {
        
        // rotate blue face
        blueFace.turnFaceClockwise()
        
        let tempWhiteFaceTop: [UIColor] = whiteFace.getTopRow()
        whiteFace.setNewTopRow(redFace.getRightColumn())
        redFace.setNewRightColumn(yellowFace.getBottomRow().reversed())
        yellowFace.setNewBottomRow(orangeFace.getLeftColumn())
        orangeFace.setNewLeftColumn(tempWhiteFaceTop.reversed())
    }
    
    func turnLeftLayerClockwise() {
        
        // rotate orange face
        orangeFace.turnFaceClockwise()
        
        let tempWhiteFaceLeft: [UIColor] = whiteFace.getLeftColumn()
        whiteFace.setNewLeftColumn(blueFace.getRightColumn().reversed())
        blueFace.setNewRightColumn(yellowFace.getLeftColumn().reversed())
        yellowFace.setNewLeftColumn(greenFace.getLeftColumn())
        greenFace.setNewLeftColumn(tempWhiteFaceLeft)
    }
    
    func turnRightLayerClockwise() {
        
        // rotate red face
        redFace.turnFaceClockwise()
        
        let tempWhiteFaceRight: [UIColor] = whiteFace.getRightColumn()
        whiteFace.setNewRightColumn(greenFace.getRightColumn())
        greenFace.setNewRightColumn(yellowFace.getRightColumn())
        yellowFace.setNewRightColumn(blueFace.getLeftColumn().reversed())
        blueFace.setNewLeftColumn(tempWhiteFaceRight.reversed())
    }
    
//=====================================Turn Counter Clockwise==============================//
    func turnTopLayerCounterClockwise() {
        
        turnTopLayerDouble()
        turnTopLayerClockwise()
    }
    
    func turnBottomLayerCounterClockwise() {
        
        turnBottomLayerDouble()
        turnBottomLayerClockwise()
    }
    
    func turnFrontLayerCounterClockwise() {
        
        turnFrontLayerDouble()
        turnFrontLayerClockwise()
    }
    
    func turnBackLayerCounterClockwise() {
        
        turnBackLayerDouble()
        turnBackLayerClockwise()
    }
    
    func turnLeftLayerCounterClockwise() {
        
        turnLeftLayerDouble()
        turnLeftLayerClockwise()
    }
    
    func turnRightLayerCounterClockwise() {
        
        turnRightLayerDouble()
        turnRightLayerClockwise()
    }

//=====================================Turn Counter Clockwise==============================//
    func turnTopLayerDouble() {
        turnTopLayerClockwise()
        turnTopLayerClockwise()
    }
    
    func turnBottomLayerDouble() {
        turnBottomLayerClockwise()
        turnBottomLayerClockwise()
    }
    
    func turnFrontLayerDouble() {
        turnFrontLayerClockwise()
        turnFrontLayerClockwise()
    }
    
    func turnBackLayerDouble() {
        turnBackLayerClockwise()
        turnBackLayerClockwise()
    }
    
    func turnLeftLayerDouble() {
        turnLeftLayerClockwise()
        turnLeftLayerClockwise()
    }
    
    func turnRightLayerDouble() {
        turnRightLayerClockwise()
        turnRightLayerClockwise()
    }
    
}
