//
//  ViewController.swift
//  TicTacToeTest
//
//  Created by Dan Gonzalez on 2016-02-09.
//  Copyright © 2016 varyag00. All rights reserved.
//

/*
TODO:

    -add animations to labels (and maybe button) -- DONE, but going to mess around with Spring
-NOTE: as of right now (02-11-2016), the cocoapods version of Spring pulls from an outdated branch, and thus I had to update my Podfile to 
        pod 'Spring', :git => 'https://github.com/MengTo/Spring.git', :branch => 'master'
    in order for builds to succeed

    Steps for Spring animations (using cocoapods)
    1. Create Spring view
    2. Add subviews to
*/


import UIKit
import Spring

class ViewController: UIViewController {

    //MARK: Attributes  
    
    @IBOutlet weak var Board: UIImageView!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var GameOverLabel: SpringLabel!
    @IBOutlet weak var NewGameButton: UIButton!
    
    
    //@IBOutlet weak var GameOverLabel: SpringLabel!
    
    //TEMP BUG FIX: ref to top left button to clear it directly after every game
    @IBOutlet weak var ZerothButton: UIButton!
    
    
    //track player turn, player 1 = 0, player 2 = 1
    var player = 0
    
    //track gamestate within 2D array, gameState[0] = top left, gameState[8] = bottom right
    var gameState = [-1,-1,-1,-1,-1,-1,-1,-1,-1]
    let winningGameState = [
        //horizontal
        [0,1,2], [3,4,5], [6,7,8],
        //vertical
        [0,3,6], [1,4,7], [2,5,8],
        //diagonal
        [0,4,8], [2,4,6]
    ]
    
    //determine whether game is over or not
    var gameOver = false
    
    //new game button pressed
    @IBAction func NewGameButtonClicked(sender: AnyObject) {
        resetGame()
    }
    
    
    
    //ctrl+drag each button to this method to add a "listener" for each buttonclick event
    @IBAction func ButtonClicked(sender: AnyObject) {
        
        if gameOver{
            print("Game has finished")
            return
        }
        
        //check gamestate, if button is unpressed then draw
        let butt = sender.tag
        if gameState[butt] == -1{
        
            if player == 0{
                sender.setImage(UIImage(named: "cross.png"), forState: UIControlState.Normal)
                //set colour for X's
                (sender as! UIButton).tintColor = UIColor.blueColor()
                //update gamestate
                gameState[butt] = 0
                //check whether a player has won
                checkGameState()
                //update turn
                player = 1
            }
            else if player == 1{
                sender.setImage(UIImage(named: "circle.png"), forState: UIControlState.Normal)
                //set colour for O's
                (sender as! UIButton).tintColor = UIColor.redColor()
                //update gamestate
                gameState[butt] = 1
                //check whether a player has won
                checkGameState()
                //update turn
                player = 0
            }
            else {
                print("Non 0 or 1 player selected. Stop trying to break the game!")
            }
        }
        else{
            print("Attempted to draw on already drawn button")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //starts the game fresh
        resetGame()
    }

    //determines whether game has ended in a win, loss, or draw
    func checkGameState(){
        //compare all winning combinations
        for state in winningGameState{
            //if there exists a piece at all three winning buttons and those pieces are all of the same type
            if ( (gameState[state[0]] > -1) && (gameState[state[0]] == gameState[state[1]] && gameState[state[1]] == gameState[state[2]]) ) {
                print("Player \(gameState[state[0]]) has won!")
                
                //show appropriate game label
                if gameState[state[0]] == 0 {
                    GameOverLabel.text = "X's has won!"
                    //set label colour
                    GameOverLabel.backgroundColor = UIColor.blueColor()
                }
                else if gameState[state[0]] == 1{
                    GameOverLabel.text = "O's has won!"
                    //set label colour
                    GameOverLabel.backgroundColor = UIColor.redColor()
                }
                

                GameOverLabel.hidden = false
                GameOverLabel.animation = "slideDown"
                GameOverLabel.animate()
                NewGameButton.alpha = 1
                gameOver = true
                return
            }
            //check for a draw
            else {
                var draw = true
                for slot in gameState{
                    //if any slots are still -1, no draw yet
                    if slot == -1{
                        draw = false
                        break
                    }
                }
                
                if draw{
                    //draw has occurred
                    GameOverLabel.text = "Game ends in a Draw!"
                    //set label colour
                    GameOverLabel.backgroundColor = UIColor.grayColor()
                    GameOverLabel.alpha = 1
                    NewGameButton.alpha = 1
                    GameOverLabel.animation = "slideDown"
                    GameOverLabel.animate()
                    gameOver = true
                    return
                }
            }
        }
    }
    
    //resets the game to its initial state so another game can be played
    func resetGame(){
        player = 1
        //GameOverLabel.hidden = true
        GameOverLabel.alpha = 0
        //NewGameButton.hidden = true
        NewGameButton.alpha = 0
        gameOver = false
        gameState = [-1,-1,-1,-1,-1,-1,-1,-1,-1]
        
        //for all buttons, delete drawn image
        
        for var i = 0; i < 9; i++ {
            //BUG: attempting to cast UIImageView to UIButton... for some reason the ImageView's tag is set to 0 after the first game completes... so the first button doesn't clear
            if let buttonToClear = view.viewWithTag(i) as? UIButton{
                buttonToClear.setImage(nil, forState: .Normal)
            }
        }
        //temp bug fix
        ZerothButton.setImage(nil, forState: .Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

