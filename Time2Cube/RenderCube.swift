//
//  RenderCube.swift
//  Rubik's Cube App
//
//  Created by Yuki Li on 7/26/25.
//

import Foundation
import UIKit

struct CubeView {
    
//    var cube: Cube
    var whiteImageViewList: [[UIImageView]]
    var orangeImageViewList: [[UIImageView]]
    var greenImageViewList: [[UIImageView]]
    var redImageViewList: [[UIImageView]]
    var blueImageViewList: [[UIImageView]]
    var yellowImageViewList: [[UIImageView]]
    
    init(whiteImageViewList: [[UIImageView]], orangeImageViewList: [[UIImageView]], greenImageViewList: [[UIImageView]], redImageViewList: [[UIImageView]], blueImageViewList: [[UIImageView]], yellowImageViewList: [[UIImageView]]) {
//        self.cube = cube
        self.whiteImageViewList = whiteImageViewList
        self.orangeImageViewList = orangeImageViewList
        self.greenImageViewList = greenImageViewList
        self.redImageViewList = redImageViewList
        self.blueImageViewList = blueImageViewList
        self.yellowImageViewList = yellowImageViewList
    }
    
    func renderCube(cube: Cube) {
        for i in 0..<3 {
            for j in 0..<3 {
                whiteImageViewList[i][j].backgroundColor = cube.whiteFace.face[i][j]
                orangeImageViewList[i][j].backgroundColor = cube.orangeFace.face[i][j]
                greenImageViewList[i][j].backgroundColor = cube.greenFace.face[i][j]
                redImageViewList[i][j].backgroundColor = cube.redFace.face[i][j]
                blueImageViewList[i][j].backgroundColor = cube.blueFace.face[i][j]
                yellowImageViewList[i][j].backgroundColor = cube.yellowFace.face[i][j]
            }
        }
        
    }
    
}

