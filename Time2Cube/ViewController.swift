//
//  ViewController.swift
//  Rubik's Cube App
//
//  Created by Yuki Li on 7/23/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var whiteFaceCorner00: UIImageView!
    @IBOutlet weak var whiteFaceEdge01: UIImageView!
    @IBOutlet weak var whiteFaceCorner01: UIImageView!
    @IBOutlet weak var whiteFaceEdge10: UIImageView!
    @IBOutlet weak var whiteFaceMiddle11: UIImageView!
    @IBOutlet weak var whiteFaceEdge12: UIImageView!
    @IBOutlet weak var whiteFaceCorner20: UIImageView!
    @IBOutlet weak var whiteFaceEdge21: UIImageView!
    @IBOutlet weak var whiteFaceCorner22: UIImageView!
    
    @IBOutlet weak var greenFaceCorner00: UIImageView!
    @IBOutlet weak var greenFaceEdge01: UIImageView!
    @IBOutlet weak var greenFaceCorner01: UIImageView!
    @IBOutlet weak var greenFaceEdge10: UIImageView!
    @IBOutlet weak var greenFaceMiddle11: UIImageView!
    @IBOutlet weak var greenFaceEdge12: UIImageView!
    @IBOutlet weak var greenFaceCorner20: UIImageView!
    @IBOutlet weak var greenFaceEdge21: UIImageView!
    @IBOutlet weak var greenFaceCorner22: UIImageView!
    
    @IBOutlet weak var redFaceCorner00: UIImageView!
    @IBOutlet weak var redFaceEdge01: UIImageView!
    @IBOutlet weak var redFaceCorner01: UIImageView!
    @IBOutlet weak var redFaceEdge10: UIImageView!
    @IBOutlet weak var redFaceMiddle11: UIImageView!
    @IBOutlet weak var redFaceEdge12: UIImageView!
    @IBOutlet weak var redFaceCorner20: UIImageView!
    @IBOutlet weak var redFaceEdge21: UIImageView!
    @IBOutlet weak var redFaceCorner22: UIImageView!
    
    @IBOutlet weak var yellowFaceCorner00: UIImageView!
    @IBOutlet weak var yellowFaceEdge01: UIImageView!
    @IBOutlet weak var yellowFaceCorner01: UIImageView!
    @IBOutlet weak var yellowFaceEdge10: UIImageView!
    @IBOutlet weak var yellowFaceMiddle11: UIImageView!
    @IBOutlet weak var yellowFaceEdge12: UIImageView!
    @IBOutlet weak var yellowFaceCorner20: UIImageView!
    @IBOutlet weak var yellowFaceEdge21: UIImageView!
    @IBOutlet weak var yellowFaceCorner22: UIImageView!
    
    @IBOutlet weak var orangeFaceCorner00: UIImageView!
    @IBOutlet weak var orangeFaceEdge01: UIImageView!
    @IBOutlet weak var orangeFaceCorner01: UIImageView!
    @IBOutlet weak var orangeFaceEdge10: UIImageView!
    @IBOutlet weak var orangeFaceMiddle11: UIImageView!
    @IBOutlet weak var orangeFaceEdge12: UIImageView!
    @IBOutlet weak var orangeFaceCorner20: UIImageView!
    @IBOutlet weak var orangeFaceEdge21: UIImageView!
    @IBOutlet weak var orangeFaceCorner22: UIImageView!
    
    @IBOutlet weak var blueFaceCorner00: UIImageView!
    @IBOutlet weak var blueFaceEdge01: UIImageView!
    @IBOutlet weak var blueFaceCorner01: UIImageView!
    @IBOutlet weak var blueFaceEdge10: UIImageView!
    @IBOutlet weak var blueFaceMiddle11: UIImageView!
    @IBOutlet weak var blueFaceEdge12: UIImageView!
    @IBOutlet weak var blueFaceCorner20: UIImageView!
    @IBOutlet weak var blueFaceEdge21: UIImageView!
    @IBOutlet weak var blueFaceCorner22: UIImageView!
    
    
    func initialCubeSetUp() {
        whiteFace = [[whiteFaceCorner00, whiteFaceEdge01, whiteFaceCorner01], [whiteFaceEdge10, whiteFaceMiddle11, whiteFaceEdge12], [whiteFaceCorner20, whiteFaceEdge21, whiteFaceCorner22]]
        yellowFace = [[yellowFaceCorner00, yellowFaceEdge01, yellowFaceCorner01], [yellowFaceEdge10, yellowFaceMiddle11, yellowFaceEdge12], [yellowFaceCorner20, yellowFaceEdge21, yellowFaceCorner22]]
        orangeFace = [[orangeFaceCorner00, orangeFaceEdge01, orangeFaceCorner01], [orangeFaceEdge10, orangeFaceMiddle11, orangeFaceEdge12], [orangeFaceCorner20, orangeFaceEdge21, orangeFaceCorner22]]
        blueFace = [[blueFaceCorner00, blueFaceEdge01, blueFaceCorner01], [blueFaceEdge10, blueFaceMiddle11, blueFaceEdge12], [blueFaceCorner20, blueFaceEdge21, blueFaceCorner22]]
        redFace = [[redFaceCorner00, redFaceEdge01, redFaceCorner01], [redFaceEdge10, redFaceMiddle11, redFaceEdge12], [redFaceCorner20, redFaceEdge21, redFaceCorner22]]
        greenFace = [[greenFaceCorner00, greenFaceEdge01, greenFaceCorner01], [greenFaceEdge10, greenFaceMiddle11, greenFaceEdge12], [greenFaceCorner20, greenFaceEdge21, greenFaceCorner22]]
        
        cubeView = CubeView(whiteImageViewList: whiteFace, orangeImageViewList: orangeFace, greenImageViewList: greenFace, redImageViewList: redFace, blueImageViewList: blueFace, yellowImageViewList: yellowFace)
        
    }
    
    
    
    var scrambleList: [String] = []
    var scrambleString: String = ""
    let scrambler = Scramble()
    
    var whiteFace: [[UIImageView]] = []
    var yellowFace: [[UIImageView]] = []
    var orangeFace: [[UIImageView]] = []
    var blueFace: [[UIImageView]] = []
    var redFace: [[UIImageView]] = []
    var greenFace: [[UIImageView]] = []
    var cubeView: CubeView!
    var cube: Cube = Cube()
    
    var timer: Timer?
    var startTime: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
        initialCubeSetUp()
        scrambleList = scrambler.generateScrambleList()
        scrambleString = scrambler.convertToScrambleString(scramble: scrambleList)
        scrambleLabel.text = scrambleString
        cube.scrambleCube(srambleList: scrambleList)
        cubeView.renderCube(cube: cube)
        
    }
    
    
    
    @IBOutlet weak var scrambleLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var startTimerBTN: UIButton!
    @IBOutlet weak var stopTimerBTN: UIButton!
    
    @IBAction func didTapButton(_ sender: Any) {
        scrambleList = scrambler.generateScrambleList()
        scrambleString = scrambler.convertToScrambleString(scramble: scrambleList)
        scrambleLabel.text = scrambleString
        
        cube.scrambleCube(srambleList: scrambleList)

        cubeView.renderCube(cube: cube)
    }
    
    @IBAction func startTimer(_ sender: Any) {
        
        if timer != nil { return }
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        startTime = Date()
    }
    
    
    @IBAction func stopTimer(_ sender: Any) {
        timer?.invalidate()
        timer = nil
    }
    
    @objc func updateTimer() {
        
        guard let start = startTime else { return }
            let elapsed = Date().timeIntervalSince(start)

            let hours = Int(elapsed) / 3600
            let minutes = (Int(elapsed) % 3600) / 60
            let seconds = Int(elapsed) % 60
            let milliseconds = Int((elapsed - floor(elapsed)) * 1000)

            if hours > 0 {
                // Show hours, minutes, seconds
                timerLabel.text = String(format: "%02d:%02d:%02d.%03d", hours, minutes, seconds, milliseconds)
            } else if minutes > 0 {
                // Show minutes, seconds
                timerLabel.text = String(format: "%02d:%02d.%03d", minutes, seconds, milliseconds)
            } else {
                // Show only seconds
                timerLabel.text = String(format: "%02d.%03d", seconds, milliseconds)
            }
        
        
    }
    
}

