//
//  ViewController.swift
//  15_puzzle
//
//  Created by Lauren Heinrichs on 2/26/16.
//  Copyright © 2016 ssu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet private var puzzleButtons: [UIButton]!
    
    @IBOutlet weak var winnerFlag: UILabel!
    @IBOutlet private var hasWon: [UIButton]!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet var emptySpace: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderVal: UILabel!
    
    private var puzzleBoard:PuzzleBoard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startGame()
    }
    
    func startGame() {
        puzzleBoard = PuzzleBoard(puzzleButtons: puzzleButtons, hasWon: hasWon, winnerFlag: winnerFlag, sliderVal: sliderVal, emptySpace: emptySpace, slider: slider)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func swipedRight(sender: UISwipeGestureRecognizer) {
        puzzleBoard!.moveRight()
        puzzleBoard!.hasPlayerWon()
        
    }
    
    
    @IBAction func adjustSlider(sender: UISlider) {
        puzzleBoard!.getSliderVal()
    }
    
    @IBAction func swipedLeft(sender: UISwipeGestureRecognizer) {
        puzzleBoard!.moveLeft()
        puzzleBoard!.hasPlayerWon()
     
        
    }
    
    
    @IBAction func swipedUp(sender: UISwipeGestureRecognizer) {
        
        puzzleBoard!.moveUp()
        puzzleBoard!.hasPlayerWon()

    }
    
    
    @IBAction func swipedDown(sender: UISwipeGestureRecognizer) {
        puzzleBoard!.moveDown()
        puzzleBoard!.hasPlayerWon()
        
    }
    
  
    @IBAction func reset(sender: UIButton) {
       puzzleBoard!.reset()
        
    }
    

    @IBAction func shuffle(sender: UIButton) {
        puzzleBoard!.shuffleBoard()
    }

    
}
    
    

