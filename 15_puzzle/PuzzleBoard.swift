//
//  PuzzleBoard.swift
//  15_puzzle
//
//  Created by Lauren Heinrichs on 2/28/16.
//  Copyright © 2016 ssu. All rights reserved.
//

import UIKit

class PuzzleBoard: NSObject {
    
    private var puzzleButtons: [AnyObject]!
    private var hasWon: [AnyObject]!
    private let winnerFlag: UILabel!
    private var sliderDifficulty = 0
    private var sliderVal: UILabel!
    private var emptySpace: AnyObject!
    private var slider: UISlider!
    
    init(puzzleButtons: [AnyObject], hasWon: [AnyObject], winnerFlag: UILabel, sliderVal: UILabel, emptySpace: AnyObject, slider: UISlider){
        self.puzzleButtons = puzzleButtons
        self.hasWon = hasWon
        self.winnerFlag = winnerFlag
        winnerFlag.hidden = true
        self.sliderVal = sliderVal
        sliderVal.text = "1"
        self.emptySpace = emptySpace
        self.slider = slider
        
        
    }

    
    func hasPlayerWon() -> Bool {
        
        if hasWon == puzzleButtons {
            winnerFlag.hidden = false
            return true
        }
        else {
            winnerFlag.hidden = true
            return false
        }
        
        
    }
    
    func moveRight() {
        let emptyIdx = puzzleButtons.indexOf(emptySpace)
        
        if (emptyIdx!) % 4 > 0 {
            UIView.animateWithDuration(0.25, animations: {
                swap(&self.puzzleButtons[emptyIdx!].frame,
                    &self.puzzleButtons[emptyIdx! - 1].frame)
                swap(&self.puzzleButtons[emptyIdx!], &self.puzzleButtons[emptyIdx! - 1])
            })
            
            
        }
        
    }
    
    func moveLeft() {
        let emptyIdx = puzzleButtons.indexOf(emptySpace)
        
        if (emptyIdx!) % 4 < 3 {
            UIView.animateWithDuration(0.25, animations: {
                swap(&self.puzzleButtons[emptyIdx!].frame,
                    &self.puzzleButtons[emptyIdx! + 1].frame)
                swap(&self.puzzleButtons[emptyIdx!], &self.puzzleButtons[emptyIdx! + 1])
            })
            
        }
    }
    
    func moveDown() {
        let emptyIdx = puzzleButtons.indexOf(emptySpace)
        
        if (emptyIdx!) / 4 > 0 {
            UIView.animateWithDuration(0.25, animations: {
                swap(&self.puzzleButtons[emptyIdx!].frame,
                    &self.puzzleButtons[emptyIdx! - 4].frame)
                swap(&self.puzzleButtons[emptyIdx!], &self.puzzleButtons[emptyIdx! - 4])
            })
        }
        
    }
    
    func moveUp() {
       let emptyIdx = puzzleButtons.indexOf(emptySpace)
        
        if (emptyIdx!) / 4 < 3 {
            UIView.animateWithDuration(0.25, animations: {
                swap(&self.puzzleButtons[emptyIdx!].frame,
                    &self.puzzleButtons[emptyIdx! + 4].frame)
                swap(&self.puzzleButtons[emptyIdx!], &self.puzzleButtons[emptyIdx! + 4])
            })
        }
    }
    
    func reset() {
        for i in 0..<puzzleButtons.count {
            
            if(!puzzleButtons[i].isEqual(hasWon[i]))
            {
                let switchButton = puzzleButtons.indexOf(puzzleButtons[i])
                let originalButton = puzzleButtons.indexOf(hasWon[i])
                
                UIView.animateWithDuration(0.5, animations: {
                    swap(&self.puzzleButtons[switchButton!].frame, &self.puzzleButtons[originalButton!].frame)
                    swap(&self.puzzleButtons[switchButton!], &self.puzzleButtons[originalButton!])
                })
            }
        }
        winnerFlag.hidden = true
    }
    
    func shuffleBoard() {
        for _ in 0...sliderDifficulty{
            let random = arc4random_uniform(4) + 0
            
            if random == 0{
                moveRight()
            }
            if random  == 1 {
                moveLeft()
            }
            
            if random == 2 {
                moveDown()
            }
            
            if random == 3 {
                moveUp()
            }
            
            
        }
        
    }
    
    func getSliderVal(){
        let currentVal = Int(slider.value)
        sliderVal.text = "\(currentVal)"
        sliderDifficulty = currentVal
    }


}
