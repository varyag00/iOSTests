//
//  ViewController.swift
//  TicTacToeTest
//
//  Created by Dan Gonzalez on 2016-02-09.
//  Copyright © 2016 varyag00. All rights reserved.
//

/*
TODO:
    -change colour of circles to be red
    -change label colour to correspond to winner
    -add restart game button
*/


import UIKit

class ViewController: UIViewController {

    //MARK: Attributes  
    
    @IBOutlet weak var Board: UIImageView!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var GameOverLabel: UILabel!
    
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
                //update gamestate
                gameState[butt] = 0
                //check whether a player has won
                checkGameState()
                //update turn
                player = 1
            }
            else if player == 1{
                sender.setImage(UIImage(named: "circle.png"), forState: UIControlState.Normal)
                //update gamestate
                gameState[butt] = 1
                //check whether a player has won
                checkGameState()
                //update turn
                player = 0
            }
            else {
                print("Non 0 or 1 player is selecterd. Stop trying to break the game!")
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
                }
                else if gameState[state[0]] == 1{
                    GameOverLabel.text = "O's has won!"
                }
                
                GameOverLabel.hidden = false
                gameOver = true
                return
            }
        }
    }
    
    //resets the game to its initial state so another game can be played
    func resetGame(){
        GameOverLabel.hidden = true
        gameOver = false
        gameState = [-1,-1,-1,-1,-1,-1,-1,-1,-1]
        //for all buttons, delete drawn image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

