//
//  generateScramble.swift
//  Rubik's Cube App
//
//  Created by Yuki Li on 7/23/25.
//

import Foundation

class Scramble {
    let cubeFaces: [String] = ["U", "D", "L", "R", "F", "B"]
    let cubeModifiers: [String] = ["", "2", "'"]
    
    func getRandomFace(excludeFace: String?) -> String {
        
        var availableFaces: [String]
        
        if var exclude = excludeFace {
            // excludeFace is not nil
            exclude = String(exclude.first!)
            availableFaces = cubeFaces.filter { $0 != exclude}
        } else {
            availableFaces = cubeFaces
        }
        
        return availableFaces.randomElement()!
    }

    func getRandomModifier() -> String {
        
        return cubeModifiers.randomElement()!
    }

    func generateSingleMove(previousMove: String?) -> String {
        
        var nextMove: String
        
        if let previous = previousMove {
            // previous is not nil
            nextMove = getRandomFace(excludeFace: String(previous.first!))
            
        } else {
            nextMove = getRandomFace(excludeFace: nil)
        }
        
        return nextMove + getRandomModifier()
    }

    func generateScrambleList(numberOfMoves: Int = 20) -> [String] {
        var scramble: [String] = []
        var moved = 0
        var previousMove = ""
        var newMove = ""
        
        while moved < numberOfMoves {
            
            // first move
            if scramble.isEmpty {
                newMove = getRandomFace(excludeFace: nil) + getRandomModifier()
            } else {
                newMove = getRandomFace(excludeFace: previousMove) + getRandomModifier()
            }
            scramble.append(newMove)
            moved += 1
            previousMove = newMove
        }
        
        return scramble
    }

    func convertToScrambleString(scramble: [String]) -> String {
        var scrambleString: String = ""
        for move in scramble {
            if scrambleString == "" {
                scrambleString += move
            } else {
                scrambleString += "  " + move
            }
        }
        
        return scrambleString
    }

    func isValidScramble(_ scramble: [String]) -> Bool {
        
        return true
    }
}




