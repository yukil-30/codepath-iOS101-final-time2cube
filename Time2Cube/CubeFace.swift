//
//  CubeFace.swift
//  Rubik's Cube App
//
//  Created by Yuki Li on 7/25/25.
//

import Foundation
import UIKit

extension UIColor {

    /// Returns a human‑readable name for Apple standard colours,
    /// otherwise a 6‑digit hex string like “#1A2B3C”.
    func toString() -> String {
        // Exact Apple colours
        switch self {
        case UIColor.red:    return "red"
        case UIColor.blue:   return "blue"
        case UIColor.green:  return "green"
        case UIColor.black:  return "black"
        case UIColor.white:  return "white"
        case UIColor.gray:   return "gray"
        case UIColor.yellow: return "yellow"
        case UIColor.orange: return "orange"
        case UIColor.purple: return "purple"
        case UIColor.brown:  return "brown"
        default:
            // Fallback: hex
            var r : CGFloat = 0
            var g : CGFloat = 0
            var b : CGFloat = 0
            var a : CGFloat = 0
            guard self.getRed(&r, green: &g, blue: &b, alpha: &a) else {
                return "unknown"
            }
            return String(format:"#%02X%02X%02X",
                          Int(r * 255),
                          Int(g * 255),
                          Int(b * 255))
        }
    }
}

func stringToUIColor(_ colorString: String) -> UIColor {
    switch colorString {
        case "red":    return UIColor.red
        case "blue":   return UIColor.blue
        case "green":  return UIColor.green
        case "white":  return UIColor.white
        case "yellow": return UIColor.yellow
        case "orange": return UIColor.orange
    default:
        return UIColor.black
    }
}


class CubeFace {
    
    var face: [[UIColor]]
    var faceColor: String
    
    init(faceColor: String, face: [[UIColor]]) {
        self.face = face
        self.faceColor = faceColor
    }
    
    init(faceColor: String) {
        self.faceColor = faceColor
        self.face = Array(repeating: Array(repeating: UIColor.black, count: 3), count: 3)
        for i in 0..<3 {
            for j in 0..<3 {
                self.face[i][j] = stringToUIColor(faceColor)
            }
        }
    }
    
    func setNewTopRow(_ color: [UIColor]) {
        face[0] = color
    }
    
    func setNewBottomRow(_ color: [UIColor]) {
        face[2] = color
    }
    
    func setNewLeftColumn(_ color: [UIColor]) {
        face[0][0] = color[0]
        face[1][0] = color[1]
        face[2][0] = color[2]
    }
    
    func setNewRightColumn(_ color: [UIColor]) {
        face[0][2] = color[0]
        face[1][2] = color[1]
        face[2][2] = color[2]
    }
    
    func getTopRow() -> [UIColor] {
        return face[0]
    }
    
    func getBottomRow() -> [UIColor] {
        return face[2]
    }
    
    func getLeftColumn() -> [UIColor] {
        var leftColumn: [UIColor] = []
        for i in 0..<3 {
            leftColumn.append(face[i][0])
        }
        return leftColumn
    }
    
    func getRightColumn() -> [UIColor] {
        var rightColumn: [UIColor] = []
        for i in 0..<3 {
            rightColumn.append(face[i][2])
        }
        return rightColumn
    }
    
    func getFaceColor() -> String {
        return faceColor
    }
    
    func turnFaceClockwise() {
        // rotate white face corner
        let tempCorner00 = face[0][0]
        face[0][0] = face[2][0]
        face[2][0] = face[2][2]
        face[2][2] = face[0][2]
        face[0][2] = tempCorner00
        
        // rotate white face edge
        let tempEdge01 = face[0][1]
        face[0][1] = face[1][0]
        face[1][0] = face[2][1]
        face[2][1] = face[1][2]
        face[1][2] = tempEdge01
    }
    
    func turnFaceCounterClockwise() {
        let tempCorner00 = face[0][0]
        face[0][0] = face[2][2]
        face[2][2] = face[2][0]
        face[2][0] = face[0][2]
        face[0][2] = tempCorner00
        
        let tempEdge01 = face[0][1]
        face[0][1] = face[1][2]
        face[1][2] = face[2][1]
        face[2][1] = face[1][0]
        face[1][0] = tempEdge01
    }
    
    
    
    
}
